\version "2.24"

\language "deutsch"

taglineLanguage = "croatian"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"

\include "articulate.ly"

\header {
  title = "Vilo moja"
  poet = \markup { \italic { "Stihovi: V. Juretić" } }
  composer = \markup { \italic { "Glazba: I. Badurina" } }
  arranger = \markup { \italic { "Obrada: I. Frleta ml." } }
}

\layout {
    \context {
    \Staff {
      \override Staff.DynamicText.stencil = ##f
      \set autoBeaming=##f
    }
  }
  \context {
    \Score
    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16)
  }
  \context {
    \Staff
    \consists Merge_rests_engraver
  }
}

PartSoloU = \relative c' {
  c8 d8 f8 d8 |
  g2~ g8 r8 d8 f8 |
  g2~ g8 r8 r8 g8 |
  b4. a8 a2~ |
  a4. r8 c,8 d8 f8 d8 |
  g8 g4.~ g8 r8 d8 f8 |
  g2~ g8 r8 f8 g8 b4.( a8) a2~ |
  a4 a8 h8 cis8 d8 e8 a,8 |
  f'2~ f8 e8 d8 f8 |
  e2~ e8 r8 c8 e8 |
  d4 b4 a4 g4 |
  b4. a8 a8. g16~ g8 f8 |
  g1~ |
  g2~ g8 r8 r4 |
}

PartSoloV = \relative c' {
  f2 g4. a8 |
  a2~ a8 b8 b8. a16 |
  a2~ a8 g8 g8. f16 |
  f4. f8 f8 g8 a8 c8 |
  \repeat volta 2 {
    f2 f8 e8 c8. a16 |
    c2 d8 c8 f,8 g8 |
    a2~ a8 g8 g8. f16 |
    \alternative {
      \volta 1 { f4. f8 f8 g8 a8 c8 }
      \volta 2 { f,2 r8 b8 b8. a16 }
    }
  }
  a2~ a8 g8 g8. f16 |
  f2~ f8 b8 b8. a16 |
  a2 r2 |
  R1 |
  \bar "|."
}

PartMandolin = \relative c' {
  r4. f8 f8 g8 a8 c8 |
  f2 f8 e8 c8. a16 |
  c2 d8 c8 f,8 g8 |
  a2~ a8 g8 g8. f16 |
  f4. r8
}

PartSU = \relative c' {
  R1
  d1 |
  e2.~ e8 r8 |
  f4. f8 e2 |
  f1 |
  g2. f4~ |
  f2 e2 |
  d'4.( c8) c2 |
  d2 cis2 |
  r8 d4 d8 d4 r4 |
  r8 c4 c8 c4 c8 c8 |
  d4 d4 d4 d4 |
  e4. r8 r2 |
  r2 f8 e4 d16( e16) |
  e2~ e8 r8 r4 |
}

PartSV = \relative c' {
  f2 g4. a8 |
  a2~ a8 d8 d8. c16 |
  c2~ c8 b8 b8. a16 |
  a4. r8 r2 |
  \repeat volta 2 {
    d2 d8 d8 d8. f16 |
    e2 b8 b8 b8 b8 |
    f2( e8) e8 e8 e8 |
    \alternative {
      \volta 1 { f4. r8 r2 }
      \volta 2 { f2 r8 d'8 d8. c16 }
    }
  }
  c2~ c8 b8 b8. a16 |
  a2~ a8 d8 d8. c16 |
  c2 r8 b8 b8 b8 |
  <c f>1 |
}

PartAU = \relative c' {
  R1
  b1 |
  c2.~ c8 r8 |
  d4. c8 c2 |
  d1 |
  d1 |
  c1 |
  f4.( f8) e2 |
  e1 |
  r8 f4 f8 f4 r4 |
  r8 e4 e8 e4 e8 e8 |
  f4 f4 f4 f4 |
  g4. r8 r2 |
  r2 <\parenthesize g c>8 <\parenthesize g c>4 <\parenthesize g c>8 |
  <\parenthesize g c>2~ <\parenthesize g c>8 r8 r4 |
}

PartAV = \relative c' {
  f2 g4. a8 |
  a2~ a8 b8 b8. a16 |
  a2~ a8 g8 g8. f16 |
  f4. r8 r2 |
  \repeat volta 2 {
    f2 f8 f8 f8. f16 |
    a2 d,8 d8 d8 d8 |
    c2( c8) c8 c8 c8 |
    \alternative {
      \volta 1 { c4. r8 r2 }
      \volta 2 { c2 r8 b'8 b8. a16 }
    }
  }
  a2~ a8 g8 g8. f16 |
  f2~ f8 b8 b8. a16 |
  a2 r8
  <<
    { d,8 des8 des8 c1 }
    { f8 f8 f8 f1 }
  >>
}

PartTU = \relative c' {
  R1
  g1 |
  g2.~ g8 r8 |
  b4. a8 a2 |
  a1 |
  b1 |
  g1 |
  b4.( a8) a2 |
  a1 |
  r8 a4 a8 a4 r4 |
  r8 a4 a8 a4 a8 a8 |
  b4 b4 b4 b4 |
  a4. r8 r2 |
  r2 c8 c4 c8 |
  c2~ c8 r8 r4 |
}

PartTV = \relative c {
  r8 f8 f8. f16 f8 r8 r4 |
  r8 f8 f8. f16 f8 r8 r4 |
  r8 f8 f8. f16 f8 r8 r4 |
  R1 |
  \repeat volta 2 {
    a2 a8 a8 a8. a16 |
    c2 f,8 f8 f8 f8 |
    a2( g8) g8 g8 g8 |
    \alternative {
      \volta 1 { a4. r8 r2 }
      \volta 2 { a8 f8 f8. f16 f8 r8 r4 }
    }
  }
  r8 f8 f8. f16 f8 r8 r4 |
  r8 f8 f8. f16 f8 f8 f8. f16 |
  f2 r8 f8 f8 f16[( g16]) |
  a1 |
}


PartBU = \relative c {
  R1
  g1 |
  c2.~ c8 r8 |
  b4. f8 a2 |
  d1 |
  g,2. b4 |
  c1 |
  b4.( f8) f2 |
  a1 |
  r8 d4 d8 d4 r4 |
  r8 a4 a8 a4 a8 a8 |
  b4 b4 b4 b4 |
  a4. r8 r2 |
  r2 c8 c4 c8 |
  c2~ c8 r8 r4 |
}

PartBV = \relative c {
  r8 f8 f8. f16 f8 r8 r4 |
  r8 f8 f8. f16 f8 r8 r4 |
  r8 f8 f8. f16 f8 r8 r4 |
  R1 |
  \repeat volta 2 {
    d2 d8 d8 d8. d16 |
    a2 b8 b8 b8 b8 |
    f'2( c8) c8 c8 c8 |
    \alternative {
      \volta 1 { f,4. r8 r2 }
      \volta 2 { f8 f'8 f8. f16 f8 r8 r4  }
    }
  }
  r8 f8 f8. f16 f8 r8 r4 |
  r8 f8 f8. f16 f8 f8 f8. f16 |
  f2 r8 b,8 b8 b8 |
  f1 |
}

PartGuitarV = {
  \autoBeamOn
  << { r16 g \pppp b g d' g b g } \\ { g,2 } >>
  << { r16 g b g d' g b g } \\ g,2 >>
  |
  << { r16 g c' g e' g c' g } \\ c2 >>
  << { r16 g c' g e' g c' g } \\ c2 >>
  |
  << { r8 \repeat unfold 2 <f b d'>8\ppppp r8 r8 \repeat unfold 3 <a c' e'>8 } \\ { b,4. f,8 a,2 } >>
  |
  << { r8 <a d' f'>8 <a d' f'>8 <a_~ d'~ f'~>8_- \repeat unfold 4 <a d' f'>8 } \\ d1 >>
  |
  << { r8 \voiceFour \repeat unfold 3 <b d'>8 } \\ g,2 >>
  << { \voiceFour s8 <b d'>8 s8 <b d'>8 } \\ { g,4 b,4 } \\ { g'4 \ppp f'4 } >>
  |
  << { \voiceFour s8 \repeat unfold 3 <g c'>8 } \\ c2 \\ { f'2 } >>
  << { \voiceFour s8 \repeat unfold 3 <g c'>8 } \\ c2 \\ { e'2 } >>
  |
  << { r8 \repeat unfold 2 <f b d'>8 r8 r8 \repeat unfold 3 <e a e'>8 } \\ { b,4. f,8 f,2 } >>
  |
  << { r8 \repeat unfold 3 <a d' e'>8 <a cis' e'>8 e8 <a cis' e'>4 } \\ { a,1 } >>
  |
  << { r8 <a d' f'>4-> <a d' f'>8 } \\ d2 >>
  << { r8 <a d' f'>4-> <a d' f'>8 } \\ d2 >>
  |
  << { r8 <a c' e'>4-> <a c' e'>8 } \\ a,2 >>
  << { r8 <a c' e'>4-> <a c' e'>8 } \\ a,2 >>
  |
  << { r8 <f b d'>4 \cresc <f b d'>8 } \\ b,2 >>
  << { r8 <f b d'>4 <f b d'>8 } \\ b,2 >>
  |
  \set Staff.connectArpeggios = ##t
  \once\override Staff.Arpeggio.stencil =
    #ly:arpeggio::brew-chord-bracket
  << { <a cis' e'>4.\arpeggio \! } \\ { a,4.\arpeggio } >>
  << { \oneVoice r8 r2 } \\ { s8 s2 } >>
  |
  << { r8 \repeat unfold 3 <g c' e'>8 \ppppp } \\ c2 >>
  << { r8 \repeat unfold 3 <g c' e'>8 } \\ c2 >>
  |
  << { r8 \repeat unfold 7 <g c' e'>8 } \\ c1 >>
}

PartGuitarF = {
  << { r8 <a c' f'>8\ppppp <a c' f'>8 <a c' f'>8 <a c' f'>4 r4 } \\ { f,2. r4 } >>
}

PartGuitarPre = {
  << { r8 \repeat unfold 3 <a\ppppp d' f'>8 } \\ d2 >>
  << { r8 \repeat unfold 3 <a d' f'>8 } \\ d2 >>
  |
  << { r8 \repeat unfold 3 <a c' e'>8 } \\ a,2 >>
  << { r8 \repeat unfold 3 <f b d'>8 } \\ b,2 >>
  |
  << { r8 <a c' f'>16 f16 <a c' f'>8 <f a c' f'>8 } \\ f,2 >>
  << { r8 \repeat unfold 3 <g c' e'>8 } \\ c2 >>
}

PartGuitarU = {
  \autoBeamOn
  << { r8 \repeat unfold 3 <a c' f'>8 } \\ f,2 >>
  << { r8 \repeat unfold 3 <g c' e'>8 } \\ c2 >>
  |
  << { r8 <a c' f'>16 f16 <a c' f'>8 <f a c' f'>8 } \\ f,2 >>
  << { r8 <b d' f'>4 <b d' f'>8 } \\ b,2 >>
  |
  << { r8 <a c' f'>16 f16 <a c' f'>8 <f a  c' f'>8 } \\ f,2 >>
  << { r8 \repeat unfold 3 <g c' e'>8 } \\ c2 >>
  |
  << { r8 <a c' f'>16 f16 <a c' f'>8 <f a c' f'>8 } \\ f,2 >>
  << { r8 <a c' f'>8 r8 <a c' f'>8 } \\ { f4 e4 } >>
  |
  
  \repeat volta 2 {
    \PartGuitarPre
    |
    \alternative {
      \volta 1 {
        << { r8 <a c' f'>16 f16 <a c' f'>8 <f a c' f'>8 } \\ f,2 >>
        << { r8 <a c' f'>8 r8 <a c' f'>8 } \\ { f4 e4 } >>
      }
      \volta 2 {
        << { r8 \repeat unfold 3 <a c' f'>8 } \\ f,2 >>
        << { r8 \repeat unfold 3 <b d' f'>8 } \\ b,2 >>
      }
    }
  }
  |
  << { r8 \repeat unfold 3 <a c' f'>8 } \\ f,2 >>
  << { r8 \repeat unfold 3 <g c' e'>8 } \\ c2 >>
  |
  << { r8 \repeat unfold 3 <a c' f'>8 } \\ f,2 >>
  << { r8 \repeat unfold 3 <b d' f'>8 } \\ b,2 >>
  |
  << s2 \\ s2 \\ { \oneVoice <f, c f a c' f'>4\arpeggio r4 } >>
  << s4 \\ s4 \\ { \oneVoice <b, f b d' f' b'>8\arpeggio r8 } >>
  << s4 \\ s4 \\ { \oneVoice <b, f b des' f' b'>8\arpeggio r8 } >>
  |
  << <a c' f'>1:32 \\ <f, c f>1 >>
}

LyricsSolo = \lyricmode {
  Sko -- ro sva -- ki put
  kad se mi
  po -- gle -- da -- mo
  ti i ne od -- zdra -- viš
  ko da se ne po -- zna -- mo
  a da mi te k_se -- bi zvat
  kad ćeš za -- spat
  pr -- vo sna da ti re -- čen
  da vo -- lin te još.
  
  Vi -- lo mo -- ja
  ti si moj san, ti si moj san,
  al la -- gje bi -- lo
  \repeat volta 2 {
    bi
    da si tu -- ja mi
    da te ne po -- znan
    da te ne \alternative {
      \volta 1 { znan, al la -- gje bi -- lo }
      \volta 2 { znan. Vi -- lo mo -- }
    }
  }
  ja,
  vi -- lo mo -- ja,
  vi -- lo mo -- ja.
}

LyricsS = \lyricmode {
  _ _
  gle -- da -- mo
  _ _ _ _
  zna -- mo
  _ _
  se -- bi zvat
  ćeš za -- spat
  pr -- vo sna da ti re -- čen
  vo -- lin te još.
  
  Vi -- lo mo -- ja
  ti si moj san, ti si moj san,
  
  \repeat volta 2 {
    bi
    da si tu -- ja mi
    da te ne po -- znan
    da te ne \alternative {
      \volta 1 { znan, }
      \volta 2 { znan. Vi -- lo mo -- }
    }
  }
  ja,
  vi -- lo mo -- ja,
  vi -- lo mo -- ja,
  vi -- lo mo -- ja.
}

LyricsB = \lyricmode {
  _ _
  _ _ _
  _
  _ _
  _ _
  _
  _ _ _
  _ _ _
  _ _ _ _ _ _ _
  _ _ _ _
  
  Vi -- lo mo -- ja,
  vi -- lo mo -- ja,
  vi -- lo mo -- ja
  
  \repeat volta 2 {
    bi
    da si tu -- ja mi
    da te ne po -- znan
    da te ne \alternative {
      \volta 1 { znan. }
      \volta 2 { znan. Vi -- lo mo -- }
    }
  }
  ja,
  vi -- lo mo -- ja,
  vi -- lo mo -- ja,
  vi -- lo mo -- ja,
  vi -- lo mo -- ja.
}

PartTempoPre = {
  \tempo 4 = 70
  s1*4
}

PartTempo = {
  \tempo 4 = 70
  s1*29
  s2
  \tempo 4 = 35
  s2
  \tempo 4 = 70
}

use-treble-key-for-bass-and-tenor = #'t

Music = {
    <<
      \new Staff = "Solo" <<
        \clef "treble"
        \key f \major
        \new Voice = "PartSolo" { r2 \PartSoloU \PartSoloV }
      >>
      \new Lyrics \lyricsto "PartSolo" {
        \LyricsSolo
      }
      \new ChoirStaff <<
        \new Staff = "A" <<
          \clef "treble"
          \key f \major
          \new Voice = "PartS" { \voiceOne \PartSU \PartSV }
          \new Voice = "PartA" { \voiceTwo \PartAU \PartAV }
        >>
        \new Lyrics \lyricsto "PartS" {
          \LyricsS
        }
        \new Staff = "B" <<
          \tag #'use-treble-key-for-bass-and-tenor {
            \clef "treble_8"
          }
          \tag #'use-bass-key-for-bass-and-tenor {
            \clef "bass"
          }
          \key f \major
          \new Voice = "PartT" { \voiceOne \PartTU \PartTV }
          \new Voice = "PartB" { \voiceTwo \PartBU \PartBV }
        >>
        \new Lyrics \lyricsto "PartT" {
          \LyricsB
        }
      >>
    >>
}

MusicFourLines = {
    <<
      \new Staff = "Solo" <<
        \clef "treble"
        \key f \major
        \new Voice = "PartSolo" { r2 \PartSoloU \PartSoloV }
      >>
      \new Lyrics \lyricsto "PartSolo" {
        \LyricsSolo
      }
      \new ChoirStaff <<
        \new Staff = "S" <<
          \clef "treble"
          \key f \major
          \new Voice = "PartS" { \PartSU \PartSV }
        >>
        \new Lyrics \lyricsto "PartS" {
          \LyricsS
        }
        \new Staff = "A" <<
          \clef "treble"
          \key f \major
          \new Voice = "PartA" { \PartAU \PartAV }
        >>
        \new Staff = "T" <<
          \clef "treble_8"
          \key f \major
          \new Voice = "PartT" { \PartTU \PartTV }
        >>
        \new Lyrics \lyricsto "PartT" {
          \LyricsB
        }
        \new Staff = "B" <<
          \clef "bass"
          \key f \major
          \new Voice = "PartB" { \PartBU \PartBV }
        >>
      >>
    >>
}

ChordsGuitar = \chordmode {
          \set chordNameSeparator = \markup { "/" }
          \set noChordSymbol = "—"
          s1
          d2:m d2:m
          a2:m b2
          f2 c2
          f1
          g2:m g2:m
          c2 c2
          b4. f8
          a2:m
          d1:m
          g2:m g4:m g4:m/b
          c2 c2
          b4. f8 f2:maj7
          a2:sus a2 |
          d2:m d2:m
          a2:m a2:m
          b2 b2
          a2 r2
          c2 c2
          c1
          f2 c2
          f2 b2
          f2 c2
          f2 f4 f4/e
          \repeat volta 2 {
            d2:m d2:m
            a2:m b2
            f2 c2
            \alternative {
              \volta 1 {
                f2 f4 f4/e
              }
              \volta 2 {
                f2 b2
              }
            }
          }
          f2 c2
          f2 b2
          f2
          b4 b4:m
          f1
}

MusicWithGuitar = {
    <<
      \new Staff = "Solo" <<
        \clef "treble"
        \key f \major
        \new Voice = "PartMandolin" { \PartMandolin }
        \new Voice = "PartSolo" { s1*4 s2 \PartSoloU \PartSoloV }
      >>
      \new Lyrics \lyricsto "PartSolo" {
        \LyricsSolo
      }
      \new ChoirStaff <<
        \new Staff = "A" <<
          \clef "treble"
          \key f \major
          \new Voice = "PartS" { R1*4 \voiceOne \PartSU \PartSV }
          \new Voice = "PartA" { s1*4 \voiceTwo \PartAU \PartAV }
        >>
        \new Lyrics \lyricsto "PartS" {
          \LyricsS
        }
        \new Staff = "B" <<
          \tag #'use-treble-key-for-bass-and-tenor {
            \clef "treble_8"
          }
          \tag #'use-bass-key-for-bass-and-tenor {
            \clef "bass"
          }
          \key f \major
          \new Voice = "PartT" { R1*4 \voiceOne \PartTU \PartTV }
          \new Voice = "PartB" { s1*4 \voiceTwo \PartBU \PartBV }
        >>
        \new Lyrics \lyricsto "PartT" {
          \LyricsB
        }
      >>
      \new Staff = "Guitar" \with {
        \consists "Span_arpeggio_engraver"
        autoBeaming=##t
      } <<
        \clef "treble_8"
        \key f \major
        { R1 \PartGuitarPre \PartGuitarF \PartGuitarV \PartGuitarU }
      >>
      \new ChordNames = "Chords" {
        \ChordsGuitar
      }
    >>
}

MusicGuitar = {
    <<
      \new Staff = "Solo" <<
        \clef "treble"
        \key f \major
        \new Voice = "PartMandolin" { \PartMandolin }
        \new Voice = "PartSolo" { s1*4 s2 \PartSoloU \PartSoloV }
      >>
      \new Lyrics \lyricsto "PartSolo" {
        \LyricsSolo
      }
      \new Staff = "Guitar" \with {
        \consists "Span_arpeggio_engraver"
        autoBeaming=##t
      } <<
        \clef "treble_8"
        \key f \major
        { R1 \PartGuitarPre \PartGuitarF \PartGuitarV \PartGuitarU }
      >>
      \new ChordNames = "Chords" {
        \ChordsGuitar
      }
    >>
}

\book {
  \score {
    \Music
    \layout {}
  }
  \paper {
    systems-per-page = 4
    system-count = 8
  }
}

\book {
  \bookOutputSuffix "guitar"
  \score {
    <<
      \unfoldRepeats {
        \MusicGuitar
      }
      \context Staff = "Guitar" <<
        { s1*9 \break s1*4 \break s1*6 \break s1*4 \break s1*4 \break s1*4 \break s1*4 }
      >>
    >>
    \layout {}
  }
  \score {
    <<
      #(define ac:normalFactor '(1 . 1))
      \articulate {
        \unfoldRepeats \MusicGuitar
      }
      \context Staff = "Guitar" <<
        \set Staff.midiInstrument = "acoustic guitar (nylon)"
      >>
      \context Staff = "A" <<
        \set Staff.midiMaximumVolume = 0.2
      >>
      \context Staff = "B" <<
        \set Staff.midiMaximumVolume = 0.2
      >>
      \context Voice = "PartSolo" <<
        \set Voice.midiMaximumVolume = 0.5
      >>
      \context Voice = "PartMandolin" <<
        \set Staff.midiInstrument = "tenor sax"
        \set Voice.midiMaximumVolume = 0.8
      >>
      \context ChordNames = "Chords" <<
        \set ChordNames.midiMaximumVolume = 0.0
      >>
      { \PartTempoPre \PartTempo }
    >>
    \midi {}
  }
  \paper {
    page-count = 2
  }
}

\book {
  \bookOutputSuffix "treble"
  \score {
    \keepWithTag #'use-treble-key-for-bass-and-tenor {
      \Music
    }
    \layout {}
  }
  \paper {
    systems-per-page = 4
    system-count = 8
  }
}

\book {
  \bookOutputSuffix "full"
  \score {
    \MusicFourLines
    \layout {}
  }
  \score {
    <<
      {
        \unfoldRepeats
        \MusicFourLines
      }
      \PartTempo
    >>
    \midi {}
  }
  \paper {
    system-count = 8
  }
}

\book {
  \bookOutputSuffix "S"
  \score {
    <<
      {
        \unfoldRepeats
        \MusicFourLines
      }
      \context Staff = "S" <<
        \set Staff.midiMaximumVolume = 0.8
        \set Staff.midiInstrument = "soprano sax"
        \PartTempo
      >>
    >>
    \midi {}
  }
}

\book {
  \bookOutputSuffix "A"
  \score {
    <<
      {
        \unfoldRepeats
        \MusicFourLines
      }
      \context Staff = "A" <<
        \set Staff.midiMaximumVolume = 0.8
        \set Staff.midiInstrument = "soprano sax"
        \PartTempo
      >>
    >>
    \midi {}
  }
}

\book {
  \bookOutputSuffix "AA"
  \score {
    <<
      {
        \unfoldRepeats
        \MusicFourLines
      }
      \context Staff = "A" <<
        {
          s1*15
          \set Staff.midiMaximumVolume = 0.8
          \set Staff.midiInstrument = "soprano sax"
          s1*4
          \unset Staff.midiMaximumVolume
          \set Staff.midiInstrument = "acoustic grand"
          s1*7 s8
          \set Staff.midiMaximumVolume = 0.8
          \set Staff.midiInstrument = "soprano sax"
        }
        \PartTempo
      >>
      \context Staff = "T" <<
        {
          \set Staff.midiMaximumVolume = 1.0
          \set Staff.midiInstrument = "tenor sax"
          s1*15
          \unset Staff.midiMaximumVolume
          \set Staff.midiInstrument = "acoustic grand"
          s1*4
          \set Staff.midiMaximumVolume = 1.0
          \set Staff.midiInstrument = "tenor sax"
          s1*7 s8
          \unset Staff.midiMaximumVolume
          \set Staff.midiInstrument = "acoustic grand"
        }
      >>
    >>
    \midi {}
  }
}

\book {
  \bookOutputSuffix "T"
  \score {
    <<
      {
        \unfoldRepeats
        \MusicFourLines
      }
      \context Staff = "T" <<
        \set Staff.midiMaximumVolume = 1.0
        \set Staff.midiInstrument = "soprano sax"
        \PartTempo
      >>
    >>
    \midi {}
  }
}

\book {
  \bookOutputSuffix "B"
  \score {
    <<
      {
        \unfoldRepeats
        \MusicFourLines
      }
      \context Staff = "B" <<
        \set Staff.midiMaximumVolume = 1.0
        \set Staff.midiInstrument = "soprano sax"
        \PartTempo
      >>
    >>
    \midi {}
  }
}