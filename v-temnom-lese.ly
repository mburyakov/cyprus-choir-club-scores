\version "2.24"

\language "deutsch"

taglineLanguage = "russian"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"

\header {
  title = "В тёмном лесе"
}

\layout {
    \context {
    \Staff {
      \set autoBeaming=##f
    }
  }
}

\paper {
  system-system-spacing =
    #'((basic-distance . 8) 
       (minimum-distance . 14)
       (padding . 1)
       (stretchability . 60)) % defaults: 12, 8, 1, 60
}

PartSA = \relative c'' {
  \time 3/4
  a8 a8 a4. a8
  g8 g8 g4. g8
  f8 f8 a4( g8) f8
  e8 e8 e4. e8 |
  \time 2/4
  f4 g4 a4.( b8)
  c4 c8[( b8]) a2
}

PartSB = \relative c'' {
  \time 3/4
  a8 a8 a8[( c8 b8]) a8
  g8 g8 g8[( b8 a8]) g8
  f8 f8 f8[( a8 g8]) f8
  e8 e8 e8[( g8 f8]) e8 |
  \time 2/4
  f4 g4 a4.( b8)
  c4 b8[( c16 b16]) a2
}

PartAA = \relative c' {
  f8 f8 f4. f8
  e8 e8 e4. e8
  d8 d8 f4( e8) d8
  cis8 cis8 cis4. cis8 |
  d4 e4 f4.( g8)
  a4 a8[( g8]) f2
}

PartAB = \relative c' {
  f8 f8 f8[( a8 g8]) f8
  e8 e8 e8[( g8 f8]) e8
  d8 d8 d8[( f8 e8]) d8
  cis8 cis8 cis8[( e8 d8]) cis8 |
  d4 e4 f4.( g8)
  a4 g8[( a16 g16]) f2
}

PartTA= \relative c' {
  c8 c8 c4. c8
  c8 c8 c4. c8
  a8 a8 a4. a8
  a8 a8 a4. a8 |
  a4 c4 c2
  c4 c4 c2
}

PartTB = \relative c' {
  c8 c8 c4. c8
  c8 c8 c4. b8
  a8 a8 a4. a8
  a8 a8 a4. a8 |
  a4 g8[( c8]) c2
  c4 c4 c2
}

PartBA = \relative c {
  f8 f8 f4. f8
  c8 c8 c4. a8
  d8 d8 d4. d8
  a8 a8 a4. a8 |
  d4 c4 f2
  f4 c4 f2
}

PartBB = \relative c {
  f8 f8 f4. f8
  c8 c8 c4. cis8
  d8 d8 d4. d8
  a8 a8 a4. a8 |
  d4 c4 f2
  f4 c4 f2
}

LyrA = \lyricmode {
  В_тём -- ном    ле -- се,
  в_тём -- ном    ле -- се,
  в_тём -- ном    ле -- се,
  в_тём -- ном    ле -- се,
  за ле -- сью,
  за ле -- сью,
}

LyrB = \lyricmode {
  рас -- па -- шу ль_я,
  рас -- па -- шу ль_я,
  рас -- па -- шу ль_я,
  рас -- па -- шу ль_я
  па -- шен -- ку,
  па -- шен -- ку.
}

LyrFull = \markup {
  \column {
    \line {
      \hspace #8
      \column {
        \line {
          1.
          \column {
            \line { В темном лесе, }
            \line { в темном лесе, }
            \line { в темном лесе, }
            \line { в темном лесе, }
            \line { за лесью, }
            \line { за лесью, }
          }
        }
        \vspace #1
        \line {
          2.
          \column {
            \line { Распашу ль я, }
            \line { распашу ль я, }
            \line { распашу ль я, }
            \line { распашу ль я }
            \line { пашенку, }
            \line { пашенку. }
          }
        }
      }
      \hspace #6
      \column {
        \line {
          3.
          \column {
            \line { Я посею, }
            \line { я посею, }
            \line { я посею, }
            \line { я посею }
            \line { лён-конопель, }
            \line { лён-зеленой. }
          }
        }
        \vspace #1
        \line {
          4.
          \column {
            \line { Уродился, }
            \line { уродился, }
            \line { уродился, }
            \line { уродился }
            \line { мой конопель, }
            \line { мой зеленой. }
          }
        }
      }
      \hspace #6
      \column {
        \line {
          5.
          \column {
            \line { Тонок, долог, }
            \line { тонок, долог, }
            \line { тонок, долог, }
            \line { тонок, долог, }
            \line { бел, волокнист, }
            \line { бел, волокнист. }
          }
        }
        \vspace #1
        \line {
          6.
          \column {
            \line { Как повадился, }
            \line { как повадился, }
            \line { как повадился, }
            \line { как повадился }
            \line { вор-воробей, }
            \line { вор-воробей. }
          }
        }
      }
      \hspace #6
      \column {
        \line {
          7.
          \column {
            \line { На коноплю, }
            \line { на коноплю, }
            \line { на коноплю, }
            \line { на коноплю }
            \line { летати, }
            \line { летати. }
          }
        }
        \vspace #1
        \line {
          8.
          \column {
            \line { Мою конопельку, }
            \line { мою зеленую, }
            \line { мою конопельку, }
            \line { мою зеленую }
            \line { клевати, }
            \line { клевати. }
          }
        }
      }
    }
  }
}


\book {
  
  \markup \vspace #0.7
  
  \score {
    <<      
      \new ChoirStaff <<
        \new Staff = "S+A" <<
          \clef "treble"
          \key f \major
          \new Voice = "PartS" {
            \voiceOne
            \PartSA
            \PartSB
            \bar ":|."
          }
          \new Voice = "PartA" {
            \voiceTwo
            \PartAA
            \PartAB
          }
        >>
        \new Lyrics \lyricsto "PartS" {
          \LyrA
          \LyrB
        }
        \new Staff = "B" <<
          \clef "bass"
          \key f \major
          \new Voice = "PartT" {
            \voiceOne
            \PartTA
            \PartTB
          }
          \new Voice = "PartB" {
            \voiceTwo
            \PartBA
            \PartBB
          }
        >>
      >>
    >>
    \layout {}
    \midi {
      \tempo 4=150
    }
  }

  \markup \vspace #4
  \LyrFull
}

\book {
  \bookOutputSuffix "full"
  
  \markup \vspace #0.7
  
  \score {
    <<      
      \new ChoirStaff <<
        \new Staff = "S+A" <<
          \clef "treble"
          \key f \major
          \new Voice = "PartS" {
            \voiceOne
            \PartSA
            \PartSB
            \bar ":|."
          }
          \new Voice = "PartA" {
            \voiceTwo
            \PartAA
            \PartAB
          }
        >>
        \new Lyrics \lyricsto "PartS" {
          \LyrA
          \LyrB
        }
        \new Staff = "T" <<
          \clef "treble_8"
          \key f \major
          \new Voice = "PartT" {
            \PartTA
            \PartTB
          }
        >>
        \new Lyrics \lyricsto "PartT" {
          \LyrA
          \LyrB
        }
        \new Staff = "B" <<
          \clef "bass"
          \key f \major
          \new Voice = "PartB" {
            \PartBA
            \PartBB
          }
        >>
      >>
    >>
    \layout {}
    \midi {
      \tempo 4=150
    }
  }

  \LyrFull
}