\version "2.24"

\language "deutsch"

taglineLanguage = "horvatian"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"

\header {
  title = "Vilo moja"
}

PartSolo = \relative c' {
  r2 c8 d8 f8 d8 |
  g2~ g8 r8 d8 f8 |
  g2~ g8 r8 r8 g8 |
  b4. a8 a2~ |
  a4. r8 c,8 d8 f8 d8 |
  g8 g4.~ g8 r8 d8 f8 |
  g2~ g8 r8 f8 g8 b4. a8 a2~ |
  a4 a8 h8 cis8 d8 e8 a,8 |
  f'2~ f8 e8 d8 f8 |
  e2~ e8 r8 c8 e8 |
  d4 b4 a4 g4 |
  b4. a8 a8. g16~ g8 f8 |
  g1~ |
  g2~ g8 r8 r4 |
}

PartS = \relative c' {
  R1
  d1 |
  e2.~ e8 r8 |
  f4. f8 e2 |
  f1 |
  g2 f2~ |
  f2 e2 |
  d'4. c8 c2 |
  d2 cis2 |
  r8 f,4 f8 f4 r4 |
  r8 e4 e8 e4 e8 e8 |
  f4 f4 f4 f4 |
  g4. r8 r4 r4 |
  r2 f'8 e4 d8 |
  e2~ e8 r8 r4 |
}

PartA = \relative c' {
  R1
  b1 |
  c2.~ c8 r8 |
  d4. c8 c2 |
  d1 |
  d1 |
  c1 |
  r8 d'4 d8 d4 r4 |
  r8 c4 c8 c4 c8 c8 |
  d4 d4 d4 d4 |
  e4. r8 r4 r4 |
  r2 c8 c4 c8 |
  c2~ c8 r8 r4 |
}

PartT = \relative c' {
  R1
  g1 |
  g2.~ g8 r8 |
  b4. a8 a2 |
  a1 |
  b1 |
  g1 |
  b4. a8 a2 |
  a1 |
  f4. f8 e2 |
  e1 |
  r8 a,4 a8 a4 r4 |
  r8 a4 a8 a4 a8 a8 |
  b4 b4 b4 b4 |
  b4. r8 r4 r4 |
  r2 c8 c4 c8 |
  c2~ c8 r8 r4 |
}


PartB = \relative c {
  R1
  g1 |
  c2.~ c8 r8 |
  b4. f8 a2 |
  d1 |
  g,2. b4 |
  c1 |
  b4. f8 f2 |
  a1 |
  r8 d4 d8 d4 r4 |
  r8 a4 a8 a4 a8 a8 |
  b4 b4 b4 b4 |
  a4. r8 r4 r4 |
  r2 c8 c4 c8 |
  c2~ c8 r8 r4 |
}

\book {
  \bookOutputSuffix "d"
  \score {
    <<
      \new Staff = "Solo" \with {
        %midiMaximumVolume = 1.0
        %midiInstrument = "viola"
      } <<
        \clef "treble"
        \key f \major
        \new Voice = "PartSolo" { \PartSolo }
      >>
      \new ChoirStaff <<
        \new Staff = "A" <<
          \clef "treble	"
          \key f \major
          \new Voice = "PartS" { \voiceOne \PartS }
          \new Voice = "PartA" { \voiceTwo \PartA }
        >>
        \new Staff = "B" <<
          \clef "bass"
          \key f \major
          \new Voice = "PartT" { \voiceOne \PartT }
          \new Voice = "PartB" { \voiceTwo \PartB }
        >>
      >>
    >>
    \layout {}
    \midi {
      \tempo 4 = 80
      \context {
        \Staff
        % midiInstrument = "viola"
      }
    }
  }
}