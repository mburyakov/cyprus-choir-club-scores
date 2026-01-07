\version "2.24"

\language "deutsch"

\header {
  title = "Can't Help Falling in Love"
  composer = "Weiss, Creatore, Peretti"
  arranger = "arr. Astoria Violin Show & Astoria Voices"
}

taglineLanguage = "english"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"

PartVerseTrimS = \relative c' {
  d2. a'2. |
  d,2.~ d4. e4 fis8 |
  g2. fis2. |
  e2.~ e4. a,4. |
  h2. cis2. |
  d2. e4 fis4 g4
}

PartVerseEndS = \relative c' {
  fis2. e2. |
  d2.~ d4.
}

PartVerseS = {
  \PartVerseTrimS \PartVerseEndS
}

PartMiddleS = \relative c' {
  cis4 fis8 a4 cis8 h2.
  cis,4 fis8 a4 cis8 h2.
  cis,4 fis8 a4 cis8 h2.
  a4 a8~ a4.~ a4 fis8 a4 fis8 |
  g4. fis4. e2.
}

PartFinalS = \relative c' {
  h2. cis2. |
  d2. e4 fis4 g4 |
  d'2. cis2. |
  <a d>2.~ <a d>4.
}

PartVerseTrimA = \relative c' {
  a2. cis2. |
  h2.~ h4. h4 d8 |
  d2. d2. |
  cis2.~ cis4. e,4. |
  g2. a2.|
  fis2. g4 a4 h4 |
}

PartVerseEndA = \relative c' {
  d2. cis2. |
  a2.~ a4.
}

PartVerseA = {
  \PartVerseTrimA \PartVerseEndA
}

PartMiddleA = \relative c' {
  cis4.( fis4. eis2.) |
  cis4.( fis4. eis2.) |
  cis4.( fis4. eis2.) |
  cis2.( cis2. |
  h2. cis2.) |
}

PartFinalA = \relative c' {
  g2. a2.|
  fis2. g4 a4 h4 |
  fis'2. e2. |
  d2.~ d4.
}

PartVerseTrimT = \relative c {
  fis2. fis2. |
  fis2.~ fis4. fis4 fis8 |
  h2. a2. |
  a2.~ a4. cis,4. |
  d2. e2. |
  d2. e4 d4 g4 |
}

PartVerseEndOneT = \relative c' {
  a2. a2. |
  fis2.~ fis4.
}

PartVerseEndTwoT = \relative c' {
  a2. a4.( g4.) |
  fis2.~ fis4.
}

PartVerseEndThreeT = \relative c' {
  a2. g2. |
  fis2.~ fis4.
}

PartFinalT = \relative c {
  d2. e2. |
  d2. e4 d4 g4 |
  a2. g2. |
  fis2.~ fis4.
}

PartMiddleT = \relative c {  
  fis2.( gis2.) |
  fis2.( gis2.) |
  fis2.( gis2.) |
  a2.( a2. |
  g2. a2.) |
}

PartVerseTrimB = \relative c {
  d2. fis2. |
  h,2.~ h4. h4 h8 |
  g2. d'2. |
  a2.~ a4. a4. |
  g2. a2. |
  h2. g4 g4 g4 |
}

PartVerseEndB = \relative c {
  d2. a2. |
  d2.~ d4.
}

PartVerseB = {
  \PartVerseTrimB \PartVerseEndB
}

PartMiddleB = \relative c {
  fis2.( cis2.) |
  fis2.( cis2.) |
  fis2.( cis2.) |
  fis2.( h,2. |
  e2. a,4.) a8 h8 cis8
}

PartFinalB = \relative c {
  g2. a2. |
  h2. g4 g4 g4 |
  d'2. a2. |
  d2.~ d4.
}

LyricsVerseOne = \lyricmode {
  Wise men say
  on -- ly fools rush in.
  But I can't help fall -- ing in love with you.
}
LyricsVerseTwo = \lyricmode {
  Shall I stay?
  Would it be a sin?
  If I can't help fall -- ing in
  \repeat unfold 3 { \skip 1 }
  love with you.
}

LyricsMiddle = \lyricmode {
  Like a ri -- ver flows
  sure -- ly to the sea,
  dar -- ling, so it goes
  some things, you know, are meant to be...
}

Lyrics = \lyricmode {
  \repeat volta 2 {
    Take my hand,
    take my whole life too
    for I can't help fall -- ing in
    \alternative {
      \volta 1 {
        love with you.
      }
      \volta 2 {
        love with you,
      }
    }
  }
  for I can't help fall -- ing in love with you.
}

\book {
  \score {
    <<
      \new ChoirStaff <<
        \numericTimeSignature
        \time 12/8
        \new Staff = "SA" \with {
          \consists Merge_rests_engraver
        } <<
          \clef "treble"
          \key d \major
          \new Voice = "PartS" {
            \voiceOne 
            \repeat volta 2 {
              \PartVerseTrimS
              \alternative {
                \volta 1 {
                  \PartVerseEndS r4.
                }
                \volta 2 {
                  \PartVerseEndS r4.
                }
              }
            }
            \repeat volta 2 {
              \PartMiddleS
              \PartVerseTrimS
              \alternative {
                \volta 1 {
                  \PartVerseEndS r4.
                  \break
                }
                \volta 2 {
                  \PartVerseEndS a4.
                }
              }
            }
            \PartFinalS r4.
            \bar "|."
          }
          \new Voice = "PartA" {
            \voiceTwo
            \repeat volta 2 {
              \PartVerseTrimA
              \alternative {
                \volta 1 {
                  \PartVerseEndA r4.
                }
                \volta 2 {
                  \PartVerseEndA r4.
                }
              }
            }
            \repeat volta 2 {
              \PartMiddleA
              \PartVerseTrimA
              \alternative {
                \volta 1 {
                  \PartVerseEndA r4.
                }
                \volta 2 {
                  \PartVerseEndA e4.
                }
              }
            }
            \PartFinalA r4.
          }
        >>
        \new Lyrics {
          \lyricsto "PartS" {
            \set stanza = "1."
            \LyricsVerseOne
            \repeat unfold 26 { \skip 1 }
            \set stanza = "3."
            \once \override LyricText.self-alignment-X = #LEFT
            \Lyrics
          }
        }
        \new Lyrics \lyricsto "PartS" {
          \set stanza = "2."
          \LyricsVerseTwo
        }
        \new Lyrics \with {
          alignAboveContext = "SA"
        } \lyricsto "PartS" {
          \repeat unfold 21 { \skip 1 }
          \LyricsMiddle
        }
        \new Staff = "B" \with {
          \consists Merge_rests_engraver
        } <<
          \clef "bass"
          \key d \major
          \new Voice = "PartT" {
            \voiceOne
            \repeat volta 2 {
              \PartVerseTrimT
              \alternative {
                \volta 1 {
                  \PartVerseEndOneT r4.
                }
                \volta 2 {
                  \PartVerseEndTwoT r4.
                }
              }
            }
            \repeat volta 2 {
              \PartMiddleT
              \PartVerseTrimT
              \alternative {
                \volta 1 {
                  \PartVerseEndTwoT r4.
                }
                \volta 2 {
                  \PartVerseEndThreeT cis4.
                }
              }
            }
            \PartFinalT r4.
          }
          \new Voice = "PartB" {
            \voiceTwo
            \repeat volta 2 {
              \PartVerseTrimB
              \alternative {
                \volta 1 {
                  \PartVerseEndB r4.
                }
                \volta 2 {
                  \PartVerseEndB r4.
                }
              }
            }
            \repeat volta 2 {
              \PartMiddleB
              \PartVerseTrimB
              \alternative {
                \volta 1 {
                  \PartVerseEndB r4.
                }
                \volta 2 {
                  \PartVerseEndB a,4.
                }
              }
            }
            \PartFinalB r4.
          }
        >>
      >>
    >>
    \layout {
    }
    \midi {
    }
  }
  \paper {
    system-count = #5
    ragged-last-bottom = #'t
  }
}