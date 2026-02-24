\version "2.24"

\language "deutsch"

\header {
  title = "Und jetzt gang i ans Peters Brünnele"
  arranger = "arr: Igor Solovyev"
}

taglineLanguage = "deutch"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"

\layout {
  \context {
    \Staff {
      \set Timing.beamExceptions = #'()
    }
  }
}

PartChorus = \relative c' {
  f4 f8 c'8 a8 f8 |
  e4 e8 c'8 b4 |
  e,4 e8 c'8 b8 g8 |
  f4 f8 c'8 a4 |
  f4 f8 c'8 a8 f8 |
  e4 e8 c'8 b4 |
  e,4 e8 c'8 b8 g8 |
  f4
}

PartAltoOne = \relative c' {
  f4 c4 f8 c8 |
  e8 b8 c4 e8 g8 |
  c,4 e4 g8 c,8 |
  f4 c4 f4 |
  f4 c4 f8 c8 |
  e8 b8 c4 e8 g8 |
  c,4 e4 g8 c,8 |
  f4
}

PartTenorOne = \relative c' {
  a8 c8 a4 c4 |
  g4 b4 c4 |
  b8 g8 b4 b4 |
  a8 c8 a4 a8 c8 |
  a8 c8 a4 c4 |
  g4 b4 c4 |
  b8 g8 b4 b4 |
  a4
}

PartBassOne = \relative c {
  <f f,>4 r4 r4 |
  c4 r4 r4 |
  c4 d4 e4 |
  <f f,>4 r4 r4 |
  <f f,>4 r4 r4 |
  c4 r4 r4 |
  c4 d4 e4 |
  <f f,>4
}

PartAltoTwo = \relative c' {
  r4 f4 f4 |
  r4 e4 e4 |
  r4 g4 g4 |
  r4 f4 f4 |
  r4 f4 f4 |
  r4 e4 e4 |
  g4 g4 e4 |
  f4
}

PartAAltoTwo = \relative c' {
  r4 c4 c4 |
  r4 c4 c4 |
  r4 d4 e4 |
  r4 c4 c4 |
  r4 c4 c4 |
  r4 c4 c4 |
  d4 d4 b4 |
  a4
}

PartTenorTwo = \relative c' {
  r4 a4 a4 |
  r4 g4 g4 |
  r4 b4 b4 |
  r4 a4 a4 |
  r4 a4 a4 |
  r4 g4 g4 |
  b4 b4 g4 |
  f4
}

PartBassTwo = \relative c {
  <f f,>4 r4 r4 |
  c4 r4 r4 |
  <g' g,>4 r4 c,4 |
  <f f,>4 r4 r4 |
  <f f,>4 r4 r4 |
  c4 r4 r4 |
  <g' g,>4 r4 c,4 |
  <f f,>4
}

PartSopranoThree = \relative c'' {
  r8 c8-\fermata h8-\fermata b8-\fermata
}

PartSSopranoThree = \relative c' {
  r8 c4.
}

PartAltoThree = \relative c'' {
  r8 c4.
}

PartAAltoThree = \relative c' {
  r8 c4._\fermata
}

PartTenorThree = \relative c' {
  r8 c4_\fermata g8_\fermata
}

PartBassThree = \relative c {
  \stemUp
  r8 c8_\fermata d8_\fermata e8_\fermata
  \stemNeutral
}

PartAAltoFour = \relative c' {
  f4 c4 f8 c8 |
  e4 c4 e4 |
  c4 e4 g8 c,8 |
  f4 c4 f4 |
  f4 c4 f8 c8 |
  e4 c4 e4 |
  c4 e4 g8 c,8 |
  c4
}

PartAAltoFive = \relative c' {
  c8. c16 c4 r4 |
  c8. c16 c4 r4 |
  c8. c16 c4 r4 |
  c8. c16 c4 r4 |
  c8. c16 c4 r4 |
  c8. c16 c4 r4 |
}

PartAAltoFiveVoltaOne = \relative c' {
  c8. c16 c4 r4 |
  c4
}

PartAAltoFiveVoltaTwo = \relative c' {
  e2 g4 | f2 r4
}

PartTenorFive = \relative c' {
  a8. a16 a4 r4 |
  b8. b16 b4 r4 |
  g8. g16 g4 r4 |
  a8. a16 a4 r4 |
  a8. a16 a4 r4 |
  b8. b16 b4 r4 |
}

PartTenorFiveVoltaOne = \relative c' {
  g8. g16 g4 r4 |
  a4
}

PartTenorFiveVoltaTwo = \relative c' {
  g2 c4 | c2 r4
}

PartAltoFive = \relative c'' {
  r4. c8 a8 r8 |
  r4. b8 g8 r8 |
  r4. b8 g8 r8 |
  r4. c8 a8 r8 |
  r4. c8 a8 r8 |
  r4. b8 g8 r8 |
}

PartAltoFiveVoltaOne = \relative c'' {
  r4. b8 g8 r8 |
  r4
}


PartAltoFiveVoltaTwo = \relative c'' {
  c2 b4 | a2 r4
}

PartBassFive = \relative c {
  f4 c4 f8 c8 |
  e4 c4 e4 |
  c4 e4 g8 c,8 |
  f4 c4 f4 |
  f4 c4 f8 c8 |
  e4 c4 e4 |
}

PartBassFiveVoltaOne = \relative c {
  c4 e4 g8 c,8 |
  f4
}

PartBassFiveVoltaTwo = \relative c {
  c4( d4) e4 |
  f2 r4
}

PartSopranoFour = \relative c'' {
  a8. a16 a4 r4 |
  b8. b16 b4 r4 |
  b8. b16 b4 r4 |
  a8. a16 a4 r4 |
  a8. a16 a4 r4 |
  b8. b16 b4 r4 |
  b8. b16 b4 r4 |
  a4
}

PartSSopranoFour = \relative c' {
  f8. f16 f4 r4 |
  g8. g16 g4 r4 |
  g8. g16 g4 r4 |
  f8. f16 f4 r4 |
  f8. f16 f4 r4 |
  g8. g16 g4 r4 |
  g8. g16 g4 r4 |
  f4
}

PartTenorFour = \relative c' {
  r4 a4 c4 |
  g4 b4 c4 |
  r4 b4 b4 |
  r4 a4 c4 |
  r4 a4 c4 |
  g4 b4 c4 |
  r4 b4 b4 |
  a4
}

PartSopranoVersePickup = \relative c'' {
  \oneVoice r4 \voiceOne c8 b8 |
}

PartSopranoVerse = \relative c'' {
  a4 f8 a8 f8 a8 |
  g8. a16 b4 d8 c8 |
  b4 g4 g4 |
  a4 \breathe c4. b8 |
  a4 f4 a4 |
  \break
  g4 b4 d8. c16 |
  b4 g4 e4 |
  f4
}

PartAltoVersePickup = \relative c'' {
  s4 a8 g8 |
}

PartAltoVerse = \relative c' {
  f4 c8 f8 c8 f8 |
  e8. f16 g4 b8 a8 |
  g4 d4 e4 |
  f4 \breathe a4. g8 |
  f4 c4 f4 |
  e4 g4 b8. a16 |
  g4 d4 e4 |
  f4
}

PartChorusWords = \relative c' {
  f8. f16 f8 c'8 a8 f8 |
  e8. e16 e8 c'8 b4 |
  e,8. e16 e8 c'8 b8 e,8 |
  f8. f16 f8 c'8 a4 |
  f8. f16 f8 c'8 a8 f8 |
  e8. e16 e8 c'8 b4 |
}

PartChorusWordsVoltaOne = \relative c' {
  e8. e16 e8 c'8 b8 e,8 |
  f4
}

PartSopranoFiveVoltaTwo = \relative c'' {
  c2 c4 | <f c>2 r4 |
}

LyricsVersePickup = \lyricmode {
  Und jetzt
}

LyricsVerse = \lyricmode {
  gang i ans Pe -- ters Brün -- ne -- le,
  und da trink i an Wein,
  und da hör i an Gug -- gu aus der Moos -- bu -- den schrein.
}

LyricsThree = \lyricmode {
  Hol -- dri -- a
}

LyricsChorus = \lyricmode {
  hol -- dri -- o, hol -- dri -- a, hol -- dri -- o, gug -- gu,
  hol -- dri -- o, hol -- dri -- a, hol -- dri -- o, gug -- gu,
  hol -- dri -- o, hol -- dri -- a, hol -- dri -- o, gug -- gu,
}

LyricsChorusVoltaOne = \lyricmode {
  hol -- dri -- o, hol -- dri -- a, ho.
}

LyricsChorusVoltaTwo = \lyricmode {
  hol -- dri -- a.
}

MusicOne = <<
  \context Voice = "PartS" {
    \oneVoice
    \repeat unfold 7 R2. r4
    \voiceOne
  }
  \context Voice = "PartSS" {
    \repeat unfold 7 s2. s4
  }
  \context Lyrics = "LyrS" {
    \repeat unfold 22 r4
  }
  \context Voice = "PartA" {
    \PartChorus
  }
  \context Voice = "PartAA" {
    \PartAltoOne
  }
  \context Voice = "PartT" {
    \PartTenorOne
  }
  \context Voice = "PartB" {
    \PartBassOne
  }
>>

MusicTwoPickup = <<
  \context Voice = "PartS" {
    \autoBeamOff
    \PartSopranoVersePickup
  }
  \context Voice = "PartSS" {
    \autoBeamOff
    \PartAltoVersePickup
  }
  \context Lyrics = "LyrS" {
    \lyricsto "PartS" \LyricsVersePickup
  }
  \context Voice = "PartA" {
    r4 r4
  }
  \context Voice = "PartAA" {
    r4 r4
  }
  \context Voice = "PartT" {
    r4 r4
  }
  \context Voice = "PartB" {
    r4 r4
  }
>>

MusicTwo = <<
  \context Voice = "PartS" {
    \autoBeamOff
    \PartSopranoVerse
  }
  \context Voice = "PartSS" {
    \autoBeamOff
    \PartAltoVerse
  }
  \context Lyrics = "LyrS" {
    \lyricsto "PartS" \LyricsVerse
  }
  \context Voice = "PartA" {
    \PartAltoTwo
  }
  \context Voice = "PartAA" {
    \PartAAltoTwo
  }
  \context Voice = "PartT" {
    \PartTenorTwo
  }
  \context Voice = "PartB" {
    \PartBassTwo
  }
>>

MusicThree = <<
  \context Voice = "PartS" {
    \PartSopranoThree
  }
  \context Voice = "PartSS" {
    \PartSSopranoThree
  }
  \context Lyrics = "LyrS" {
    \lyricsto "PartS" \LyricsThree
  }
  \context Voice = "PartA" {
    \PartAltoThree
  }
  \context Voice = "PartAA" {
    \PartAAltoThree
  }
  \context Voice = "PartT" {
    \PartTenorThree
  }
  \context Voice = "PartB" {
    \PartBassThree
  }
>>

MusicFour = <<
  \context Voice = "PartS" {
    \bar "||"
    \PartSopranoFour
  }
  \context Voice = "PartSS" {
    \PartSSopranoFour
  }
  \context Voice = "PartA" {
    \autoBeamOff
    \PartChorusWords
    \PartChorusWordsVoltaOne
  }
  \context Lyrics = "LyrS" {
    \lyricsto "PartA" { \LyricsChorus \LyricsChorusVoltaOne }
  }
  \context Voice = "PartAA" {
    \PartAAltoFour
  }
  \context Voice = "PartT" {
    \PartTenorFour
  }
  \context Voice = "PartB" {
    \PartBassOne
  }
>>

MusicRest = <<
  \context Voice = "PartS" {
    r4
  }
  \context Voice = "PartSS" {
    r4
  }
  \context Lyrics = "LyrS" {
    r4
  }
  \context Voice = "PartA" {
    r4
  }
  \context Voice = "PartAA" {
    r4
  }
  \context Voice = "PartT" {
    r4
  }
  \context Voice = "PartB" {
    r4
  }
>>

MusicFive = <<
  \context Voice = "PartS" {
    \oneVoice
    \break
    \PartChorusWords
    \voiceOne
  }
  \context Voice = "PartSS" {
    \repeat unfold 6 s2.
  }
  \context Lyrics = "LyrS" {
    \lyricsto "PartS" \LyricsChorus
  }
  \context Voice = "PartA" {
    \PartAltoFive
  }
  \context Voice = "PartAA" {
    \autoBeamOff
    \PartAAltoFive
  }
  \context Voice = "PartT" {
    \autoBeamOff
    \PartTenorFive
  }
  \context Voice = "PartB" {
    \PartBassFive
  }
>>

MusicFiveVoltaOne = <<
  \context Voice = "PartS" {
    \oneVoice
    \PartChorusWordsVoltaOne
    \voiceOne
  }
  \context Voice = "PartSS" {
    s2. s4
  }
  \context Lyrics = "LyrS" {
    \lyricsto "PartS" \LyricsChorusVoltaOne
  }
  \context Voice = "PartA" {
    \PartAltoFiveVoltaOne
  }
  \context Voice = "PartAA" {
    \autoBeamOff
    \PartAAltoFiveVoltaOne
  }
  \context Voice = "PartT" {
    \autoBeamOff
    \PartTenorFiveVoltaOne
  }
  \context Voice = "PartB" {
    \PartBassFiveVoltaOne
  }
>>

MusicFiveVoltaTwo = <<
  \context Voice = "PartS" {
    \oneVoice
    \PartSopranoFiveVoltaTwo
    \voiceOne
    \bar "|."
  }
  \context Voice = "PartSS" {
    s2. s2.
  }
  \context Lyrics = "LyrS" {
    \lyricsto "PartS" \LyricsChorusVoltaTwo
  }
  \context Voice = "PartA" {
    \PartAltoFiveVoltaTwo
  }
  \context Voice = "PartAA" {
    \autoBeamOff
    \PartAAltoFiveVoltaTwo
  }
  \context Voice = "PartT" {
    \autoBeamOff
    \PartTenorFiveVoltaTwo
  }
  \context Voice = "PartB" {
    \PartBassFiveVoltaTwo
  }
>>

MusicAll = {
  \MusicOne
  \MusicTwoPickup
  \repeat volta 2 {
    \MusicTwo
    \MusicThree
    \MusicFour
    \MusicRest
    \MusicRest
    \MusicFive
    \alternative {
      \volta 1 {
        \MusicFiveVoltaOne
        \MusicTwoPickup
      }
      \volta 2 {
        \MusicFiveVoltaTwo
      }
    }
  }
}

StavesFull = <<
  \time 3/4
  \new Staff = "S" <<
    \clef "treble"
    \key f \major
    \new Voice = "PartS" {
      \voiceOne
    }
    \new Voice = "PartSS" {
      \voiceTwo
    }
  >>
  \new Lyrics = "LyrS" {}
  \new Staff = "A" <<
    \clef "treble"
    \key f \major
    \new Voice = "PartA" {
      \voiceOne
    }
    \new Voice = "PartAA" {
      \voiceTwo
    }
  >>
  \new Staff = "T" <<
    \clef "treble_8"
    \key f \major
    \new Voice = "PartT" {}
  >>
  \new Staff = "B" <<
    \clef "bass"
    \key f \major
    \new Voice = "PartB" {}
  >>
>>

StavesCompact = <<
  \time 3/4
  \new Staff = "S" <<
    \clef "treble"
    \key f \major
    \new Voice = "S" {
      \voiceOne
    }
    \new Voice = "SS" {
      \voiceTwo
    }
  >>
  \new Staff = "A" <<
    \clef "treble"
    \key f \major
    \new Voice = "A" {
      \voiceOne
    }
    \new Voice = "AA" {
      \voiceTwo
    }
  >>
  \new Staff = "TB" <<
    \clef "bass"
    \key f \major
    \new Voice = "T" {
      \voiceOne
    }
    \new Voice = "B" {
      \voiceTwo
    }
  >>
>>

\book {
  \score {
    \new ChoirStaff <<
      \StavesFull
      \MusicAll
    >>
    \layout {
      #(layout-set-staff-size 19)
    }
    \midi {
      \tempo 4 = 100
    }
  }
  \paper {
    page-count = 2
  }
}
