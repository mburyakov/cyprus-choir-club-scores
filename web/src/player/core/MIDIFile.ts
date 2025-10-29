/* typescript */

// UTF-8 helpers
const UTF8 = {
  isNotUTF8(bytes: Uint8Array, byteOffset?: number, byteLength?: number): boolean {
    try {
      UTF8.getStringFromBytes(bytes, byteOffset, byteLength, true);
    } catch (_e) {
      return true;
    }
    return false;
  },

  getCharLength(theByte: number): number {
    if ((theByte & 0xF0) === 0xF0) return 4;
    if ((theByte & 0xE0) === 0xE0) return 3;
    if ((theByte & 0xC0) === 0xC0) return 2;
    if (theByte === (theByte & 0x7F)) return 1;
    return 0;
  },

  getCharCode(bytes: Uint8Array, byteOffset = 0, charLength?: number): number {
    let charCode = 0;
    let mask = '';

    if (bytes.length - byteOffset <= 0) {
      throw new Error('No more characters remaining in array.');
    }

    charLength = charLength || UTF8.getCharLength(bytes[byteOffset]);
    if (charLength === 0) {
      throw new Error(
        bytes[byteOffset].toString(2) + ' is not a significative byte (offset:' + byteOffset + ').'
      );
    }
    if (charLength === 1) {
      return bytes[byteOffset];
    }
    if (bytes.length - byteOffset < charLength) {
      throw new Error('Expected at least ' + charLength + ' bytes remaining in array.');
    }

    mask = '00000000'.slice(0, charLength) + 1 + '00000000'.slice(charLength + 1);
    if (bytes[byteOffset] & parseInt(mask, 2)) {
      throw Error(
        'Index ' +
          byteOffset +
          ': A ' +
          charLength +
          ' bytes encoded char cannot encode the ' +
          (charLength + 1) +
          'th rank bit to 1.'
      );
    }

    mask = '0000'.slice(0, charLength + 1) + '11111111'.slice(charLength + 1);
    charCode += (bytes[byteOffset] & parseInt(mask, 2)) << (--charLength * 6);

    while (charLength) {
      if ((bytes[byteOffset + 1] & 0x80) !== 0x80 || (bytes[byteOffset + 1] & 0x40) === 0x40) {
        throw Error(
          'Index ' +
            (byteOffset + 1) +
            ': Next bytes of encoded char must begin with a "10" bit sequence.'
        );
      }
      charCode += (bytes[++byteOffset] & 0x3F) << (--charLength * 6);
    }
    return charCode;
  },

  getStringFromBytes(
    bytes: Uint8Array,
    byteOffset?: number,
    byteLength?: number,
    strict?: boolean
  ): string {
    let charLength: number;
    const chars: string[] = [];
    let offset = byteOffset ?? 0;
    const end =
      typeof byteLength === 'number' ? byteLength : (bytes as any).byteLength || bytes.length;

    for (; offset < end; offset++) {
      charLength = UTF8.getCharLength(bytes[offset]);
      if (offset + charLength > end) {
        if (strict) {
          throw Error(
            'Index ' +
              offset +
              ': Found a ' +
              charLength +
              ' bytes encoded char declaration but only ' +
              (end - offset) +
              ' bytes are available.'
          );
        }
      } else {
        chars.push(String.fromCodePoint(UTF8.getCharCode(bytes, offset, charLength)));
      }
      offset += charLength - 1;
    }
    return chars.join('');
  },

  getBytesForCharCode(charCode: number): number {
    if (charCode < 128) return 1;
    if (charCode < 2048) return 2;
    if (charCode < 65536) return 3;
    if (charCode < 2097152) return 4;
    throw new Error('CharCode ' + charCode + ' cannot be encoded with UTF8.');
  },

  setBytesFromCharCode(
    charCode: number,
    bytes: number[] = [],
    byteOffset = 0,
    neededBytes?: number
  ): number[] {
    charCode |= 0;
    neededBytes = neededBytes || UTF8.getBytesForCharCode(charCode);

    if (neededBytes === 1) {
      bytes[byteOffset] = charCode;
    } else {
      bytes[byteOffset++] =
        (parseInt('1111'.slice(0, neededBytes), 2) << (8 - neededBytes)) +
        (charCode >>> (--neededBytes * 6));
      for (; neededBytes > 0; ) {
        bytes[byteOffset++] = ((charCode >>> (--neededBytes * 6)) & 0x3F) | 0x80;
      }
    }
    return bytes;
  },

  setBytesFromString(
    string = '',
    bytes: number[] = [],
    byteOffset = 0,
    byteLength?: number,
    strict?: boolean
  ): number[] {
    const end = typeof byteLength === 'number' ? byteLength : (bytes as any).byteLength || Infinity;

    for (let i = 0, j = string.length; i < j; i++) {
      const codePoint = string[i].codePointAt(0)!;
      const neededBytes = UTF8.getBytesForCharCode(codePoint);
      if (strict && byteOffset + neededBytes > end) {
        throw new Error(
          'Not enought bytes to encode the char "' + string[i] + '" at the offset "' + byteOffset + '".'
        );
      }
      UTF8.setBytesFromCharCode(codePoint, bytes, byteOffset, neededBytes);
      byteOffset += neededBytes;
      if (codePoint > 0xffff) i++; // skip surrogate pair second unit
    }
    return bytes;
  },
};

// MIDI Events machinery
type ByteStream = {
  position: number;
  buffer: DataView;
  readUint8(): number;
  readUint16(): number;
  readUint32(): number;
  readVarInt(): number;
  readBytes(length: number): number[];
  pos(): string;
  end(): boolean;
};

type BaseParsedEvent = {
  index: string;
  delta: number;
  type: number;
  length?: number;
  track?: number;
  playTime?: number;
  playTimeTicks?: number;
};

type MetaEvent =
  | (BaseParsedEvent & {
      type: typeof MIDIEvents.EVENT_META;
      subtype: number;
      data?: number[];
      msb?: number;
      lsb?: number;
      prefix?: number;
      tempo?: number;
      tempoBPM?: number;
      hour?: number;
      minutes?: number;
      seconds?: number;
      frames?: number;
      subframes?: number;
      key?: number;
      scale?: number;
      param1?: number;
      param2?: number;
      param3?: number;
      param4?: number;
    });

type SysExEvent =
  | (BaseParsedEvent & {
      type: typeof MIDIEvents.EVENT_SYSEX | typeof MIDIEvents.EVENT_DIVSYSEX;
      data: number[];
    });

type MidiEvent =
  | (BaseParsedEvent & {
      type: typeof MIDIEvents.EVENT_MIDI;
      subtype: number;
      channel: number;
      param1: number;
      param2?: number;
    });

type UnknownSystemEvent =
  | (BaseParsedEvent & {
      type: number;
      badsubtype?: number;
      data?: number[];
    });

type ParsedEvent = MetaEvent | SysExEvent | MidiEvent | UnknownSystemEvent | null;

class MIDIEvents {
  // Event types
  static EVENT_META = 0xff;
  static EVENT_SYSEX = 0xf0;
  static EVENT_DIVSYSEX = 0xf7;
  static EVENT_MIDI = 0x8;

  // Meta event types
  static EVENT_META_SEQUENCE_NUMBER = 0x00;
  static EVENT_META_TEXT = 0x01;
  static EVENT_META_COPYRIGHT_NOTICE = 0x02;
  static EVENT_META_TRACK_NAME = 0x03;
  static EVENT_META_INSTRUMENT_NAME = 0x04;
  static EVENT_META_LYRICS = 0x05;
  static EVENT_META_MARKER = 0x06;
  static EVENT_META_CUE_POINT = 0x07;
  static EVENT_META_MIDI_CHANNEL_PREFIX = 0x20;
  static EVENT_META_END_OF_TRACK = 0x2f;
  static EVENT_META_SET_TEMPO = 0x51;
  static EVENT_META_SMTPE_OFFSET = 0x54;
  static EVENT_META_TIME_SIGNATURE = 0x58;
  static EVENT_META_KEY_SIGNATURE = 0x59;
  static EVENT_META_SEQUENCER_SPECIFIC = 0x7f;

  // MIDI event types
  static EVENT_MIDI_NOTE_OFF = 0x8;
  static EVENT_MIDI_NOTE_ON = 0x9;
  static EVENT_MIDI_NOTE_AFTERTOUCH = 0xA;
  static EVENT_MIDI_CONTROLLER = 0xB;
  static EVENT_MIDI_PROGRAM_CHANGE = 0xC;
  static EVENT_MIDI_CHANNEL_AFTERTOUCH = 0xD;
  static EVENT_MIDI_PITCH_BEND = 0xE;

  static MIDI_1PARAM_EVENTS = [MIDIEvents.EVENT_MIDI_PROGRAM_CHANGE, MIDIEvents.EVENT_MIDI_CHANNEL_AFTERTOUCH];
  static MIDI_2PARAMS_EVENTS = [
    MIDIEvents.EVENT_MIDI_NOTE_OFF,
    MIDIEvents.EVENT_MIDI_NOTE_ON,
    MIDIEvents.EVENT_MIDI_NOTE_AFTERTOUCH,
    MIDIEvents.EVENT_MIDI_CONTROLLER,
    MIDIEvents.EVENT_MIDI_PITCH_BEND,
  ];

  static createParser(stream: DataView | ByteStream, startAt = 0, strictMode = false) {
    let s: ByteStream;

    if (stream instanceof DataView) {
      s = {
        position: startAt || 0,
        buffer: stream,
        readUint8() {
          return this.buffer.getUint8(this.position++);
        },
        readUint16() {
          const v = this.buffer.getUint16(this.position);
          this.position = this.position + 2;
          return v;
        },
        readUint32() {
          // Note: intentionally mirrors the original code behavior
          const v = this.buffer.getUint16(this.position);
          this.position = this.position + 2;
          return v as unknown as number;
        },
        readVarInt() {
          let v = 0;
          let i = 0;
          let b: number;
          while (4 > i++) {
            b = this.readUint8();
            if (b & 0x80) {
              v += b & 0x7f;
              v <<= 7;
            } else {
              return v + b;
            }
          }
          throw new Error('0x' + this.position.toString(16) + ': Variable integer length cannot exceed 4 bytes');
        },
        readBytes(length: number) {
          const bytes: number[] = [];
          for (; length > 0; length--) bytes.push(this.readUint8());
          return bytes;
        },
        pos() {
          return '0x' + (this.buffer.byteOffset + this.position).toString(16);
        },
        end() {
          return this.position === this.buffer.byteLength;
        },
      };
      startAt = 0;
    } else {
      s = stream as ByteStream;
    }

    if (startAt > 0) {
      while (startAt--) s.readUint8();
    }

    // parser state
    let eventTypeByte: number;
    let event: any;
    let MIDIEventType: number | undefined;
    let MIDIEventChannel = 0;
    let MIDIEventParam1 = 0;

    return {
      next(): ParsedEvent {
        if (s.end()) return null;

        event = { index: s.pos(), delta: s.readVarInt() } as BaseParsedEvent;

        eventTypeByte = s.readUint8();

        if ((eventTypeByte & 0xf0) === 0xf0) {
          if (eventTypeByte === MIDIEvents.EVENT_META) {
            event.type = MIDIEvents.EVENT_META;
            event.subtype = s.readUint8();
            event.length = s.readVarInt();

            switch (event.subtype) {
              case MIDIEvents.EVENT_META_SEQUENCE_NUMBER:
                if (strictMode && event.length !== 2) throw new Error(s.pos() + ' Bad metaevent length.');
                event.msb = s.readUint8();
                event.lsb = s.readUint8();
                return event;

              case MIDIEvents.EVENT_META_TEXT:
              case MIDIEvents.EVENT_META_COPYRIGHT_NOTICE:
              case MIDIEvents.EVENT_META_TRACK_NAME:
              case MIDIEvents.EVENT_META_INSTRUMENT_NAME:
              case MIDIEvents.EVENT_META_LYRICS:
              case MIDIEvents.EVENT_META_MARKER:
              case MIDIEvents.EVENT_META_CUE_POINT:
                event.data = s.readBytes(event.length);
                return event;

              case MIDIEvents.EVENT_META_MIDI_CHANNEL_PREFIX:
                if (strictMode && event.length !== 1) throw new Error(s.pos() + ' Bad metaevent length.');
                event.prefix = s.readUint8();
                return event;

              case MIDIEvents.EVENT_META_END_OF_TRACK:
                if (strictMode && event.length !== 0) throw new Error(s.pos() + ' Bad metaevent length.');
                return event;

              case MIDIEvents.EVENT_META_SET_TEMPO:
                if (strictMode && event.length !== 3) throw new Error(s.pos() + ' Tempo meta event length must be 3.');
                event.tempo = (s.readUint8() << 16) + (s.readUint8() << 8) + s.readUint8();
                event.tempoBPM = 60000000 / event.tempo;
                return event;

              case MIDIEvents.EVENT_META_SMTPE_OFFSET:
                if (strictMode && event.length !== 5) throw new Error(s.pos() + ' Bad metaevent length.');
                event.hour = s.readUint8();
                if (strictMode && event.hour > 23) throw new Error(s.pos() + ' SMTPE offset hour value must be part of 0-23.');
                event.minutes = s.readUint8();
                if (strictMode && event.minutes > 59)
                  throw new Error(s.pos() + ' SMTPE offset minutes value must be part of 0-59.');
                event.seconds = s.readUint8();
                if (strictMode && event.seconds > 59)
                  throw new Error(s.pos() + ' SMTPE offset seconds value must be part of 0-59.');
                event.frames = s.readUint8();
                if (strictMode && event.frames > 30)
                  throw new Error(s.pos() + ' SMTPE offset frames value must be part of 0-30.');
                event.subframes = s.readUint8();
                if (strictMode && event.subframes > 99)
                  throw new Error(s.pos() + ' SMTPE offset subframes value must be part of 0-99.');
                return event;

              case MIDIEvents.EVENT_META_KEY_SIGNATURE:
                if (strictMode && event.length !== 2) throw new Error(s.pos() + ' Bad metaevent length.');
                event.key = s.readUint8();
                if (strictMode && (event.key < -7 || event.key > 7)) throw new Error(s.pos() + ' Bad metaevent length.');
                event.scale = s.readUint8();
                if (strictMode && event.scale !== 0 && event.scale !== 1)
                  throw new Error(s.pos() + ' Key signature scale value must be 0 or 1.');
                return event;

              case MIDIEvents.EVENT_META_TIME_SIGNATURE:
                if (strictMode && event.length !== 4) throw new Error(s.pos() + ' Bad metaevent length.');
                event.data = s.readBytes(event.length);
                event.param1 = event.data[0];
                event.param2 = event.data[1];
                event.param3 = event.data[2];
                event.param4 = event.data[3];
                return event;

              case MIDIEvents.EVENT_META_SEQUENCER_SPECIFIC:
                event.data = s.readBytes(event.length);
                return event;

              default:
                if (strictMode) {
                  throw new Error(s.pos() + ' Unknown meta event type (' + event.subtype.toString(16) + ').');
                }
                event.data = s.readBytes(event.length);
                return event;
            }
          } else if (eventTypeByte === MIDIEvents.EVENT_SYSEX || eventTypeByte === MIDIEvents.EVENT_DIVSYSEX) {
            event.type = eventTypeByte;
            event.length = s.readVarInt();
            event.data = s.readBytes(event.length);
            return event;
          } else {
            if (strictMode) {
              throw new Error(
                s.pos() + ' Unknown event type ' + eventTypeByte.toString(16) + ', Delta: ' + event.delta + '.'
              );
            }
            event.type = eventTypeByte;
            event.badsubtype = s.readVarInt();
            event.length = s.readUint8();
            event.data = s.readBytes(event.length);
            return event;
          }
        } else {
          if ((eventTypeByte & 0x80) === 0) {
            if (!MIDIEventType) {
              throw new Error(s.pos() + ' Running status without previous event');
            }
            MIDIEventParam1 = eventTypeByte;
          } else {
            MIDIEventType = eventTypeByte >> 4;
            MIDIEventChannel = eventTypeByte & 0x0f;
            MIDIEventParam1 = s.readUint8();
          }
          event.type = MIDIEvents.EVENT_MIDI;
          event.subtype = MIDIEventType!;
          event.channel = MIDIEventChannel;
          event.param1 = MIDIEventParam1;

          switch (MIDIEventType) {
            case MIDIEvents.EVENT_MIDI_NOTE_OFF:
            case MIDIEvents.EVENT_MIDI_NOTE_ON:
            case MIDIEvents.EVENT_MIDI_NOTE_AFTERTOUCH:
            case MIDIEvents.EVENT_MIDI_CONTROLLER:
            case MIDIEvents.EVENT_MIDI_PITCH_BEND:
              event.param2 = s.readUint8();
              if (MIDIEventType === MIDIEvents.EVENT_MIDI_NOTE_ON && !event.param2) {
                event.subtype = MIDIEvents.EVENT_MIDI_NOTE_OFF;
                event.param2 = 127;
              }
              return event;

            case MIDIEvents.EVENT_MIDI_PROGRAM_CHANGE:
            case MIDIEvents.EVENT_MIDI_CHANNEL_AFTERTOUCH:
              return event;

            default:
              if (strictMode) {
                throw new Error(s.pos() + ' Unknown MIDI event type (' + MIDIEventType.toString(16) + ').');
              }
              return event;
          }
        }
      },
    };
  }

  static writeToTrack(events: any[], destination: Uint8Array, strictMode = false) {
    let index = 0;

    for (let i = 0, j = events.length; i < j; i++) {
      if (events[i].delta >>> 28) {
        throw Error('Event #' + i + ': Maximum delta time value reached (' + events[i].delta + '/134217728 max)');
      }
      if (events[i].delta >>> 21) destination[index++] = ((events[i].delta >>> 21) & 0x7f) | 0x80;
      if (events[i].delta >>> 14) destination[index++] = ((events[i].delta >>> 14) & 0x7f) | 0x80;
      if (events[i].delta >>> 7) destination[index++] = ((events[i].delta >>> 7) & 0x7f) | 0x80;
      destination[index++] = events[i].delta & 0x7f;

      if (events[i].type === MIDIEvents.EVENT_MIDI) {
        destination[index++] = (events[i].subtype << 4) + events[i].channel;
        destination[index++] = events[i].param1;
        if (MIDIEvents.MIDI_2PARAMS_EVENTS.indexOf(events[i].subtype) !== -1) {
          destination[index++] = events[i].param2;
        }
      } else {
        destination[index++] = events[i].type;
        if (events[i].type === MIDIEvents.EVENT_META) destination[index++] = events[i].subtype;

        if (events[i].length >>> 28) {
          throw Error('Event #' + i + ': Maximum length reached (' + events[i].length + '/134217728 max)');
        }
        if (events[i].length >>> 21) destination[index++] = ((events[i].length >>> 21) & 0x7f) | 0x80;
        if (events[i].length >>> 14) destination[index++] = ((events[i].length >>> 14) & 0x7f) | 0x80;
        if (events[i].length >>> 7) destination[index++] = ((events[i].length >>> 7) & 0x7f) | 0x80;
        destination[index++] = events[i].length & 0x7f;

        if (events[i].type === MIDIEvents.EVENT_META) {
          switch (events[i].subtype) {
            case MIDIEvents.EVENT_META_SEQUENCE_NUMBER:
              destination[index++] = events[i].msb;
              destination[index++] = events[i].lsb;
              break;

            case MIDIEvents.EVENT_META_TEXT:
            case MIDIEvents.EVENT_META_COPYRIGHT_NOTICE:
            case MIDIEvents.EVENT_META_TRACK_NAME:
            case MIDIEvents.EVENT_META_INSTRUMENT_NAME:
            case MIDIEvents.EVENT_META_LYRICS:
            case MIDIEvents.EVENT_META_MARKER:
            case MIDIEvents.EVENT_META_CUE_POINT:
              for (let k = 0; k < events[i].length; k++) destination[index++] = events[i].data[k];
              break;

            case MIDIEvents.EVENT_META_MIDI_CHANNEL_PREFIX:
              destination[index++] = events[i].prefix;
              break;

            case MIDIEvents.EVENT_META_END_OF_TRACK:
              break;

            case MIDIEvents.EVENT_META_SET_TEMPO:
              destination[index++] = events[i].tempo >> 16;
              destination[index++] = (events[i].tempo >> 8) & 0xff;
              destination[index++] = events[i].tempo & 0xff;
              break;

            case MIDIEvents.EVENT_META_SMTPE_OFFSET:
              if (strictMode && events[i].hour > 23)
                throw new Error('Event #' + i + ': SMTPE offset hour value must be part of 0-23.');
              destination[index++] = events[i].hour;

              if (strictMode && events[i].minutes > 59)
                throw new Error('Event #' + i + ': SMTPE offset minutes value must be part of 0-59.');
              destination[index++] = events[i].minutes;

              if (strictMode && events[i].seconds > 59)
                throw new Error('Event #' + i + ': SMTPE offset seconds value must be part of 0-59.');
              destination[index++] = events[i].seconds;

              if (strictMode && events[i].frames > 30)
                throw new Error('Event #' + i + ': SMTPE offset frames amount must be part of 0-30.');
              destination[index++] = events[i].frames;

              if (strictMode && events[i].subframes > 99)
                throw new Error('Event #' + i + ': SMTPE offset subframes amount must be part of 0-99.');
              destination[index++] = events[i].subframes;
              break;

            case MIDIEvents.EVENT_META_KEY_SIGNATURE:
              if (typeof events[i].key !== 'number' || events[i].key < -7 || events[i].key > 7) {
                throw new Error('Event #' + i + ':The key signature key must be between -7 and 7');
              }
              if (typeof events[i].scale !== 'number' || events[i].scale < 0 || events[i].scale > 1) {
                throw new Error('Event #' + i + ':The key signature scale must be 0 or 1');
              }
              destination[index++] = events[i].key;
              destination[index++] = events[i].scale;
              break;

            case MIDIEvents.EVENT_META_TIME_SIGNATURE:
            case MIDIEvents.EVENT_META_SEQUENCER_SPECIFIC:
            default:
              for (let k = 0; k < events[i].length; k++) destination[index++] = events[i].data[k];
              break;
          }
        } else {
          for (let k = 0; k < events[i].length; k++) destination[index++] = events[i].data[k];
        }
      }
    }
  }

  static getRequiredBufferLength(events: any[]): number {
    let bufferLength = 0;

    for (let i = 0, j = events.length; i < j; i++) {
      bufferLength += events[i].delta >>> 21 ? 4 : events[i].delta >>> 14 ? 3 : events[i].delta >>> 7 ? 2 : 1;

      if (events[i].type === MIDIEvents.EVENT_MIDI) {
        bufferLength += 2;
        if (MIDIEvents.MIDI_2PARAMS_EVENTS.indexOf(events[i].subtype) !== -1) bufferLength++;
      } else {
        bufferLength++;
        if (events[i].type === MIDIEvents.EVENT_META) bufferLength++;
        bufferLength +=
          events[i].length >>> 21 ? 4 : events[i].length >>> 14 ? 3 : events[i].length >>> 7 ? 2 : 1;
        bufferLength += events[i].length;
      }
    }
    return bufferLength;
  }
}

// Header
export class MIDIFileHeader {
  static HEADER_LENGTH = 14;
  static FRAMES_PER_SECONDS = 1;
  static TICKS_PER_BEAT = 2;

  datas: DataView;

  constructor(buffer?: ArrayBuffer) {
    let a: Uint8Array;

    if (!buffer) {
      a = new Uint8Array(MIDIFileHeader.HEADER_LENGTH);
      a[0] = 0x4d;
      a[1] = 0x54;
      a[2] = 0x68;
      a[3] = 0x64;
      a[4] = 0x00;
      a[5] = 0x00;
      a[6] = 0x00;
      a[7] = 0x06;
      a[8] = 0x00;
      a[9] = 0x01;
      a[10] = 0x00;
      a[11] = 0x01;
      a[12] = 0x00;
      a[13] = 0xc0;
      this.datas = new DataView(a.buffer, 0, MIDIFileHeader.HEADER_LENGTH);
    } else {
      this.datas = new DataView(buffer, 0, MIDIFileHeader.HEADER_LENGTH);

      if (
        !(
          'M' === String.fromCharCode(this.datas.getUint8(0)) &&
          'T' === String.fromCharCode(this.datas.getUint8(1)) &&
          'h' === String.fromCharCode(this.datas.getUint8(2)) &&
          'd' === String.fromCharCode(this.datas.getUint8(3))
        )
      ) {
        throw new Error('Invalid MIDIFileHeader : MThd prefix not found');
      }
      if (6 !== this.datas.getUint32(4)) {
        throw new Error('Invalid MIDIFileHeader : Chunk length must be 6');
      }
    }
  }

  getFormat(): number {
    const format = this.datas.getUint16(8);
    if (format !== 0 && format !== 1 && format !== 2) {
      throw new Error('Invalid MIDI file : MIDI format (' + format + '), format can be 0, 1 or 2 only.');
    }
    return format;
  }

  setFormat(format: number) {
    if (format !== 0 && format !== 1 && format !== 2) {
      throw new Error('Invalid MIDI format given (' + format + '), format can be 0, 1 or 2 only.');
    }
    this.datas.setUint16(8, format);
  }

  getTracksCount(): number {
    return this.datas.getUint16(10);
  }

  setTracksCount(n: number) {
    this.datas.setUint16(10, n);
  }

  getTickResolution(tempo?: number): number {
    if (this.datas.getUint16(12) & 0x8000) {
      return 1000000 / (this.getSMPTEFrames() * this.getTicksPerFrame());
    }
    tempo = tempo || 500000;
    return tempo / this.getTicksPerBeat();
  }

  getTimeDivision(): number {
    if (this.datas.getUint16(12) & 0x8000) return MIDIFileHeader.FRAMES_PER_SECONDS;
    return MIDIFileHeader.TICKS_PER_BEAT;
  }

  getTicksPerBeat(): number {
    const divisionWord = this.datas.getUint16(12);
    if (divisionWord & 0x8000) {
      throw new Error('Time division is not expressed as ticks per beat.');
    }
    return divisionWord;
  }

  setTicksPerBeat(ticksPerBeat: number) {
    this.datas.setUint16(12, ticksPerBeat & 0x7fff);
  }

  getSMPTEFrames(): number {
    const divisionWord = this.datas.getUint16(12);
    if (!(divisionWord & 0x8000)) throw new Error('Time division is not expressed as frames per seconds.');
    const smpteFrames = divisionWord & 0x7f00;
    if ([24, 25, 29, 30].indexOf(smpteFrames) === -1) {
      throw new Error('Invalid SMPTE frames value (' + smpteFrames + ').');
    }
    return smpteFrames === 29 ? 29.97 : smpteFrames;
  }

  getTicksPerFrame(): number {
    const divisionWord = this.datas.getUint16(12);
    if (!(divisionWord & 0x8000)) throw new Error('Time division is not expressed as frames per seconds.');
    return divisionWord & 0x00ff;
  }

  setSMTPEDivision(smpteFrames: number, ticksPerFrame: number) {
    if (smpteFrames === 29.97) smpteFrames = 29;
    if ([24, 25, 29, 30].indexOf(smpteFrames) === -1) {
      throw new Error('Invalid SMPTE frames value given (' + smpteFrames + ').');
    }
    if (ticksPerFrame < 0 || ticksPerFrame > 0xff) {
      throw new Error('Invalid ticks per frame value given (' + smpteFrames + ').');
    }
    this.datas.setUint8(12, 0x80 | smpteFrames);
    this.datas.setUint8(13, ticksPerFrame);
  }
}

// Track
export class MIDIFileTrack {
  static HDR_LENGTH = 8;
  datas: DataView;

  constructor(buffer?: ArrayBuffer, start = 0) {
    let a: Uint8Array;
    let trackLength: number;

    if (!buffer) {
      a = new Uint8Array(12);
      a[0] = 0x4d;
      a[1] = 0x54;
      a[2] = 0x72;
      a[3] = 0x6b;
      a[4] = 0x00;
      a[5] = 0x00;
      a[6] = 0x00;
      a[7] = 0x04;
      a[8] = 0x00;
      a[9] = 0xff;
      a[10] = 0x2f;
      a[11] = 0x00;
      this.datas = new DataView(a.buffer, 0, MIDIFileTrack.HDR_LENGTH + 4);
    } else {
      if (12 > buffer.byteLength - start) {
        throw new Error(
          'Invalid MIDIFileTrack (0x' + start.toString(16) + ') : Buffer length must size at least 12bytes'
        );
      }
      this.datas = new DataView(buffer, start, MIDIFileTrack.HDR_LENGTH);

      if (
        !(
          'M' === String.fromCharCode(this.datas.getUint8(0)) &&
          'T' === String.fromCharCode(this.datas.getUint8(1)) &&
          'r' === String.fromCharCode(this.datas.getUint8(2)) &&
          'k' === String.fromCharCode(this.datas.getUint8(3))
        )
      ) {
        throw new Error('Invalid MIDIFileTrack (0x' + start.toString(16) + ') : MTrk prefix not found');
      }

      trackLength = this.getTrackLength();
      if (buffer.byteLength - start < trackLength) {
        throw new Error(
          'Invalid MIDIFileTrack (0x' + start.toString(16) + ') : The track size exceed the buffer length.'
        );
      }
      this.datas = new DataView(buffer, start, MIDIFileTrack.HDR_LENGTH + trackLength);

      if (
        !(
          0xff === this.datas.getUint8(MIDIFileTrack.HDR_LENGTH + (trackLength - 3)) &&
          0x2f === this.datas.getUint8(MIDIFileTrack.HDR_LENGTH + (trackLength - 2)) &&
          0x00 === this.datas.getUint8(MIDIFileTrack.HDR_LENGTH + (trackLength - 1))
        )
      ) {
        throw new Error(
          'Invalid MIDIFileTrack (0x' +
            start.toString(16) +
            ') : No track end event found at the expected index (' +
            (MIDIFileTrack.HDR_LENGTH + (trackLength - 1)).toString(16) +
            ').'
        );
      }
    }
  }

  getTrackLength(): number {
    return this.datas.getUint32(4);
  }

  setTrackLength(trackLength: number) {
    this.datas.setUint32(4, trackLength);
  }

  getTrackContent(): DataView {
    return new DataView(
      this.datas.buffer,
      this.datas.byteOffset + MIDIFileTrack.HDR_LENGTH,
      this.datas.byteLength - MIDIFileTrack.HDR_LENGTH
    );
  }

  setTrackContent(dataView: DataView | Uint8Array) {
    const dv = dataView instanceof DataView ? dataView : new DataView(dataView.buffer, dataView.byteOffset, dataView.byteLength);
    const trackLength = dv.byteLength - dv.byteOffset;
    if (trackLength < 4) throw new Error('Invalid track length, must size at least 4bytes');

    this.datas = new DataView(new Uint8Array(MIDIFileTrack.HDR_LENGTH + trackLength).buffer);
    this.datas.setUint8(0, 0x4d);
    this.datas.setUint8(1, 0x54);
    this.datas.setUint8(2, 0x72);
    this.datas.setUint8(3, 0x6b);
    this.datas.setUint32(4, trackLength);

    const origin = new Uint8Array(dv.buffer, dv.byteOffset, dv.byteLength);
    const destination = new Uint8Array(this.datas.buffer, MIDIFileTrack.HDR_LENGTH, trackLength);
    for (let i = 0, j = origin.length; i < j; i++) destination[i] = origin[i];
  }
}

// Song model types
type Slide = { delta: number; when: number };
type Note = { when: number; pitch: number; duration: number; slides: Slide[] };
export type Track = {
  channelNum: number;
  trackNum: number;
  notes: Note[];
  volume: number;
  program: number;
  name?: string;
  info?: any;
  id?: any;
};
type BeatNote = { when: number };
type Beat = { n: number; notes: BeatNote[]; volume: number; info?: any; id?: any };
export type Song = {
  duration: number;
  tracks: Track[];
  beats: Beat[];
  name?: string;
};

// Utilities
function ensureArrayBuffer(buf?: ArrayBuffer | Uint8Array): ArrayBuffer {
  if (!buf) throw new Error('Unsupported buffer type, need ArrayBuffer or Uint8Array');
  if (buf instanceof ArrayBuffer) return buf;
  return new Uint8Array(buf).buffer;
}

// Main MIDIFile
export class MIDIFile {
  header: MIDIFileHeader;
  tracks: MIDIFileTrack[];

  constructor(buffer?: ArrayBuffer | Uint8Array, strictMode?: boolean) {
    if (!buffer) {
      this.header = new MIDIFileHeader();
      this.tracks = [new MIDIFileTrack()];
    } else {
      const abuf = ensureArrayBuffer(buffer);
      if (abuf.byteLength < 25) {
        throw new Error('A buffer of a valid MIDI file must have, at least, a size of 25bytes.');
      }
      this.header = new MIDIFileHeader(abuf);
      this.tracks = [];
      let curIndex = MIDIFileHeader.HEADER_LENGTH;

      for (let i = 0, j = this.header.getTracksCount(); i < j; i++) {
        if (strictMode && curIndex >= abuf.byteLength - 1) {
          throw new Error("Couldn't find datas corresponding to the track #" + i + '.');
        }
        const track = new MIDIFileTrack(abuf, curIndex);
        this.tracks.push(track);
        curIndex += track.getTrackLength() + 8;
      }
      if (strictMode && curIndex !== abuf.byteLength) {
        throw new Error('It seems that the buffer contains too much datas.');
      }
    }
  }

  // Helpers for song building
  private takeTrack(channelNum: number, trackNum: number, song: Song): Track {
    for (let i = 0; i < song.tracks.length; i++) {
      if (song.tracks[i].channelNum === channelNum && song.tracks[i].trackNum === trackNum) return song.tracks[i];
    }
    const track: Track = { channelNum, trackNum, notes: [], volume: 1, program: 0 };
    song.tracks.push(track);
    return track;
  }

  private takeTracks(trackNum: number, song: Song): Track[] {
    const result: Track[] = [];
    for (let i = 0; i < song.tracks.length; i++) {
      if (song.tracks[i].trackNum === trackNum) result.push(song.tracks[i]);
    }
    return result;
  }

  private takeBeat(n: number, song: Song): Beat {
    for (let i = 0; i < song.beats.length; i++) {
      if (song.beats[i].n === n) return song.beats[i];
    }
    const beat: Beat = { n, notes: [], volume: 1 };
    song.beats.push(beat);
    return beat;
  }

  private startNote(event: any, song: Song) {
    const track = this.takeTrack(event.channel, event.track, song);
    track.notes.push({ when: event.playTime / 1000, pitch: event.param1, duration: 0.0000001, slides: [] });
  }

  private closeNote(event: any, song: Song) {
    const track = this.takeTrack(event.channel, event.track, song);
    for (let i = 0; i < track.notes.length; i++) {
      if (
        track.notes[i].duration === 0.0000001 &&
        track.notes[i].pitch === event.param1 &&
        track.notes[i].when < event.playTime / 1000
      ) {
        track.notes[i].duration = event.playTime / 1000 - track.notes[i].when;
        break;
      }
    }
  }

  private addSlide(event: any, song: Song, pitchBendRange: number) {
    const track = this.takeTrack(event.channel, event.track, song);
    for (let i = 0; i < track.notes.length; i++) {
      if (track.notes[i].duration === 0.0000001 && track.notes[i].when < event.playTime / 1000) {
        track.notes[i].slides.push({
          delta: ((event.param2 - 64) / 64) * pitchBendRange,
          when: event.playTime / 1000 - track.notes[i].when,
        });
      }
    }
  }

  private startDrum(event: any, song: Song) {
    const beat = this.takeBeat(event.param1, song);
    beat.notes.push({ when: event.playTime / 1000 });
  }

  // Public API similar to original
  parseSong(): Song {
    const song: Song = { duration: 0, tracks: [], beats: [] };
    const events = this.getMidiEvents() as any[];
    // Default pitch-bend range is 2 semitones per channel
    let expectedPitchBendRangeMessageNumber = 1;
    let expectedPitchBendRangeChannel: number | null = null;
    const pitchBendRange = Array(16).fill(2);

    for (let i = 0; i < events.length; i++) {
      const e = events[i];
      const oldNum = expectedPitchBendRangeMessageNumber;

      if (song.duration < e.playTime / 1000) song.duration = e.playTime / 1000;

      if (e.subtype === MIDIEvents.EVENT_MIDI_NOTE_ON) {
        if (e.channel === 9) {
          if (e.param1 >= 35 && e.param1 <= 81) this.startDrum(e, song);
          else console.log('wrong drum', e);
        } else {
          if (e.param1 >= 0 && e.param1 <= 127) this.startNote(e, song);
          else console.log('wrong tone', e);
        }
      } else if (e.subtype === MIDIEvents.EVENT_MIDI_NOTE_OFF) {
        if (e.channel !== 9) this.closeNote(e, song);
      } else if (e.subtype === MIDIEvents.EVENT_MIDI_PROGRAM_CHANGE) {
        if (e.channel !== 9) {
          const track = this.takeTrack(e.channel, e.track, song);
          track.program = e.param1;
        } else {
          console.log('skip program for drums');
        }
      } else if (e.subtype === MIDIEvents.EVENT_MIDI_CONTROLLER) {
        if (e.param1 === 7) {
          if (e.channel !== 9) {
            const track = this.takeTrack(e.channel, e.track, song);
            track.volume = e.param2 / 127 || 0.000001;
          }
        } else if (
          (expectedPitchBendRangeMessageNumber === 1 && e.param1 === 0x65 && e.param2 === 0x00) ||
          (expectedPitchBendRangeMessageNumber === 2 && e.param1 === 0x64 && e.param2 === 0x00) ||
          (expectedPitchBendRangeMessageNumber === 3 && e.param1 === 0x06) ||
          (expectedPitchBendRangeMessageNumber === 4 && e.param1 === 0x26)
        ) {
          if (expectedPitchBendRangeMessageNumber > 1 && e.channel !== expectedPitchBendRangeChannel) {
            // ignore mismatch
          }
          expectedPitchBendRangeChannel = e.channel;
          if (expectedPitchBendRangeMessageNumber === 3) {
            pitchBendRange[e.channel] = e.param2;
            console.log('pitchBendRange', pitchBendRange);
          }
          if (expectedPitchBendRangeMessageNumber === 4) {
            pitchBendRange[e.channel] += e.param2 / 100;
            console.log('pitchBendRange', pitchBendRange);
          }
          expectedPitchBendRangeMessageNumber++;
          if (expectedPitchBendRangeMessageNumber === 5) expectedPitchBendRangeMessageNumber = 1;
        } else {
          // other controllers ignored
        }
      } else if (e.subtype === MIDIEvents.EVENT_MIDI_PITCH_BEND) {
        this.addSlide(e, song, pitchBendRange[e.channel]);
      } else {
        console.log('unknown', e.channel, e);
      }

      if (oldNum === expectedPitchBendRangeMessageNumber) {
        if (oldNum >= 2 && oldNum <= 3) {
          // ignore premature end
        }
        if (oldNum === 4) expectedPitchBendRangeMessageNumber = 1;
      }
    }

    const metaEvents = this.getEvents(MIDIEvents.EVENT_META) as any[];
    for (let i = 0; i < metaEvents.length; i++) {
      if (metaEvents[i].subtype === MIDIEvents.EVENT_META_TRACK_NAME) {
        const name = UTF8.getStringFromBytes(
          new Uint8Array(metaEvents[i].data),
          0,
          metaEvents[i].length,
          true
        );
        const trackNum = metaEvents[i].track;
        if (trackNum === 0) {
          song.name = name;
        } else {
          const tracks = this.takeTracks(trackNum, song);
          for (let j = 0; j < tracks.length; j++) tracks[j].name = name;
        }
      }
    }
    return song;
  }

  getEvents(type?: number, subtype?: number): ParsedEvent[] {
    let events: ReturnType<typeof MIDIEvents.createParser>;
    let event: any;
    let playTime = 0;
    let playTimeTicks = 0;
    const filteredEvents: any[] = [];
    const format = this.header.getFormat();
    let tickResolution = this.header.getTickResolution();

    if (format !== 1 || this.tracks.length === 1) {
      for (let i = 0, j = this.tracks.length; i < j; i++) {
        playTime = format === 2 && playTime ? playTime : 0;
        playTimeTicks = format === 2 && playTimeTicks ? playTimeTicks : 0;
        events = MIDIEvents.createParser(this.tracks[i].getTrackContent(), 0, false);
        event = events.next();
        while (event) {
          playTime += event.delta ? (event.delta * tickResolution) / 1000 : 0;
          playTimeTicks += event.delta ? event.delta : 0;
          if (event.type === MIDIEvents.EVENT_META) {
            if (event.subtype === MIDIEvents.EVENT_META_SET_TEMPO) {
              tickResolution = this.header.getTickResolution(event.tempo);
            }
          }
          if ((!type || event.type === type) && (!subtype || (event.subtype && event.subtype === subtype))) {
            event.playTime = playTime;
            event.playTimeTicks = playTimeTicks;
            filteredEvents.push(event);
          }
          event = events.next();
        }
      }
    } else {
      const trackParsers: { parser: ReturnType<typeof MIDIEvents.createParser>; curEvent: any }[] = [];
      let smallestDelta = -1;

      for (let i = 0, j = this.tracks.length; i < j; i++) {
        trackParsers[i] = { parser: MIDIEvents.createParser(this.tracks[i].getTrackContent(), 0, false), curEvent: null };
        trackParsers[i].curEvent = trackParsers[i].parser.next();
      }

      do {
        smallestDelta = -1;
        for (let i = 0, j = trackParsers.length; i < j; i++) {
          if (trackParsers[i].curEvent) {
            if (smallestDelta === -1 || trackParsers[i].curEvent.delta < trackParsers[smallestDelta].curEvent.delta) {
              smallestDelta = i;
            }
          }
        }
        if (smallestDelta !== -1) {
          for (let i = 0, j = trackParsers.length; i < j; i++) {
            if (i !== smallestDelta && trackParsers[i].curEvent) {
              trackParsers[i].curEvent.delta -= trackParsers[smallestDelta].curEvent.delta;
            }
          }
          event = trackParsers[smallestDelta].curEvent;
          playTime += event.delta ? (event.delta * tickResolution) / 1000 : 0;
          playTimeTicks += event.delta ? event.delta : 0;

          if (event.type === MIDIEvents.EVENT_META) {
            if (event.subtype === MIDIEvents.EVENT_META_SET_TEMPO) {
              tickResolution = this.header.getTickResolution(event.tempo);
            }
          }
          if ((!type || event.type === type) && (!subtype || (event.subtype && event.subtype === subtype))) {
            event.playTime = playTime;
            event.playTimeTicks = playTimeTicks;
            event.track = smallestDelta;
            filteredEvents.push(event);
          }
          trackParsers[smallestDelta].curEvent = trackParsers[smallestDelta].parser.next();
        }
      } while (smallestDelta !== -1);
    }

    return filteredEvents;
  }

  getMidiEvents(): ParsedEvent[] {
    return this.getEvents(MIDIEvents.EVENT_MIDI);
  }

  getLyrics() {
    const events = this.getEvents(MIDIEvents.EVENT_META) as any[];
    const texts: any[] = [];
    const lyrics: any[] = [];

    for (let i = 0, j = events.length; i < j; i++) {
      const event = events[i];
      if (event.subtype === MIDIEvents.EVENT_META_LYRICS) {
        lyrics.push(event);
      } else if (event.subtype === MIDIEvents.EVENT_META_TEXT) {
        if (String.fromCharCode(event.data[0]) === '@') {
          // ignore special markers
        } else if (String.fromCharCode(...event.data).indexOf('words') === 0) {
          texts.length = 0;
        } else if (event.playTime !== 0) {
          texts.push(event);
        }
      }
    }

    let chosen = texts;
    if (lyrics.length > 2) chosen = lyrics;
    else if (!texts.length) chosen = [];

    try {
      chosen.forEach((event: any) => {
        event.text = UTF8.getStringFromBytes(new Uint8Array(event.data), 0, event.length, true);
      });
    } catch (_e) {
      chosen.forEach((event: any) => {
        event.text = event.data.map((c: number) => String.fromCharCode(c)).join('');
      });
    }
    return chosen;
  }

  getTrackEvents(index: number) {
    if (index > this.tracks.length || index < 0) throw Error('Invalid track index (' + index + ')');
    const parser = MIDIEvents.createParser(this.tracks[index].getTrackContent(), 0, false);
    const events: any[] = [];
    let e = parser.next();
    do {
      events.push(e);
      e = parser.next();
    } while (e);
    return events;
  }

  setTrackEvents(index: number, events: any[]) {
    if (index > this.tracks.length || index < 0) throw Error('Invalid track index (' + index + ')');
    if (!events || !events.length) throw Error('A track must contain at least one event, none given.');
    const bufferLength = MIDIEvents.getRequiredBufferLength(events);
    const destination = new Uint8Array(bufferLength);
    MIDIEvents.writeToTrack(events, destination);
    this.tracks[index].setTrackContent(destination);
  }

  deleteTrack(index: number) {
    if (index > this.tracks.length || index < 0) throw Error('Invalid track index (' + index + ')');
    this.tracks.splice(index, 1);
    this.header.setTracksCount(this.tracks.length);
  }

  addTrack(index: number) {
    if (index > this.tracks.length || index < 0) throw Error('Invalid track index (' + index + ')');
    const track = new MIDIFileTrack();
    if (index === this.tracks.length) this.tracks.push(track);
    else this.tracks.splice(index, 0, track);
    this.header.setTracksCount(this.tracks.length);
  }

  getContent(): ArrayBuffer {
    let bufferLength = MIDIFileHeader.HEADER_LENGTH;
    for (let i = 0, j = this.tracks.length; i < j; i++) {
      bufferLength += this.tracks[i].getTrackLength() + 8;
    }
    const destination = new Uint8Array(bufferLength);

    let i = 0;
    let origin = new Uint8Array(this.header.datas.buffer, this.header.datas.byteOffset, MIDIFileHeader.HEADER_LENGTH);
    for (let k = 0; k < MIDIFileHeader.HEADER_LENGTH; k++) destination[i++] = origin[k];

    for (let k = 0, l = this.tracks.length; k < l; k++) {
      origin = new Uint8Array(this.tracks[k].datas.buffer, this.tracks[k].datas.byteOffset, this.tracks[k].datas.byteLength);
      for (let m = 0, n = this.tracks[k].datas.byteLength; m < n; m++) destination[i++] = origin[m];
    }
    return destination.buffer;
  }

  // Backward-compatible static refs
  static Header = MIDIFileHeader;
  static Track = MIDIFileTrack;
}