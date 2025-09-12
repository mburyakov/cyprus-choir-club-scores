\version "2.24"

\language "deutsch"

taglineLanguage = "ukrainian"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"

\header {
  title = "Павочка ходить"
  composer = "Обробка А. Авдiєвського"
}

\layout {  
  \context {
    \Lyrics
    \override VerticalAxisGroup.nonstaff-nonstaff-spacing.minimum-distance = ##f
  }
  \context {
    \Staff {
      \set autoBeaming=##f
    }
  }
}

PartSPre = \relative c' {
  f8 f8 f8 \tuplet 3/2 { g16[( f16 g16]) } as8[( b8])
}

PartAPre = \relative c' {
   c8 c8 c8 des8 es8[( des8])
}

PartTPre = \relative c' {
    as8 as8 as8 b8 c8[( b8])
}


PartBPre = \relative c {
  f8 f8 f8 f8 f4
}

PartSoloOne = \relative c' {
  f8 c'8 c8 h16[( g16]) c4
  g8 b8 as8 g8 f4
}

PartAOne = \relative c' {
  c4( as'8[ g8] as4
  f4. e8 f4)
}

PartTOne = \relative c' {
  as4( c8[ des8] c4
  des4 c8 b8 as8 c8)
}

PartBOne = \relative c {
  f2.(
  b,4 c4 f8[ es8])
}

PartSOneChorus = \relative c'' {
  g8 f8 g4 as8[( f8])
  g8 f8 g4 f4
}

PartAOneChorus = \relative c' {
  f8 f8 f4 f4
  f8 f8 e4 f4
}

PartTOneChorus = \relative c' {
  h8 h8 b4 as4
  b16[( c16]) des8 c8[( b8]) as4
}

PartBOneChorus = \relative c {
  d8 d8 des4 c4
  b8 b8 c4 f4
}

PartSTwo = \relative c' {
  f8 <as c>8 <as c>8 <g h>16[( g16]) <as c>4
  g8 b8 as8 g8 f4
}

PartATwo = \relative c' {
  f8 f8 f8 f8 f4
  f8 f8 f8 es8 f4
}

PartTTwo = \relative c' {
  f8 es8 d8 des8 c4
  b16[( c16]) des8 c16[( des16]) es8 f4
}

PartBTwo = \relative c' {
  R2.
  R2.
}

PartSTwoChorus = \relative c'' {
  g8 f8 g4 as8[( f8])
  g8 f8 g4 f4
}

PartATwoChorus = \relative c' {
  des8 des8 des8[( es16 des16]) c8[( es8])
  des8 f8 f8[( e8]) f4
}

PartTTwoChorus = \relative c' {
  b8 b8 b4 as8[( c8])
  b8 des8 c4
}

PartTTwoChorusEnd = \relative c' {
  f,4
}

PartBTwoChorus = \relative c' {
  b,8 b8 es4 as4
  b16[( as16]) g8
}

PartBTwoChorusEnd = \relative c' {
  c,4 f4
}

LyrStanzaOne = \lyricmode {
  Па -- воч -- ка    хо -- дить,
  пi -- р’яч -- ко    ро -- нить.
}

LyrChorus = \lyricmode {
  Щед -- рий    ве -- чiр,    доб -- рим    лю -- дям.
}

LyrStanzaTwo = \lyricmode {
  За    не -- ю    хо -- дить
  краc -- на    дi -- вонь -- ка.
}

LyrStanzaThree = \lyricmode {
  Пi -- р’я    зби -- ра -- є,
  в_ру -- кав    хо -- ва -- є.
}

LyrStanzaFour = \lyricmode {
  З_ру -- ка -- ва    бе -- ре,
  вi -- но -- чок    пле -- те.
}

LyrStanzaFive = \lyricmode {
  А    звив -- ши    вi -- нок,
  по -- нес -- ла    в_та -- нок.
}


LyrFull = \markup {
  \fontsize #1
  \column {
    \line {
      \hspace #12
      \column {
        \line {
          1.
          \column {
            \line { Павочка ходить, }
            \line { пiр’ячко ронить. }
            \vspace #0.5
            \line { \italic { Щедрий вечiр, } }
            \line { \italic { добрим людям. } }
          }
        }
        \vspace #2
        \line {
          2.
          \column {
            \line { За нею ходить }
            \line { краcна дiвонька. }
            \vspace #0.5
            \line { \italic { Щедрий вечiр, } }
            \line { \italic { добрим людям. } }
          }
        }
      }
      \hspace #6
      \column {
        \line {
          3.
          \column {
            \line { Пiр’я збирає, }
            \line { в рукав ховає. }
            \vspace #0.5
            \line { Щедрий вечiр, }
            \line { добрим людям. }
          }
        }
        \vspace #2
        \line {
          4.
          \column {
            \line { З рукава бере, }
            \line { вiночок плете. }
            \vspace #0.5
            \line { \italic { Щедрий вечiр, } }
            \line { \italic { добрим людям. } }
          }
        }
      }
      \hspace #6
      \column {
        \line {
          5.
          \column {
            \line { А звивши вiнок, }
            \line { понесла в танок. }
            \vspace #0.5
            \line { \italic { Щедрий вечiр, } }
            \line { \italic { добрим людям. } }
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
        \new Staff = "S" <<
          \clef "treble"
          \key f \minor
          \time 3/4
          \new Voice = "PartSolo" {
            \voiceOne
            s2.*2
            \PartSoloOne
          }
          \new Voice = "PartS" {
            \voiceOne
            \PartAPre
            \PartSPre
            \textEndMark \markup \musicglyph "scripts.segno"
            \set Score.repeatCommands = #'((start-repeat))
            s2.*2
            \PartSOneChorus
            \once\override Score.BreakAlignment.break-align-orders = \break-align-orders-on-repeat
            \set Score.repeatCommands = #'((end-repeat) (start-repeat))
            \PartSTwo
            \PartSTwoChorus
            \textEndMark \markup \musicglyph "scripts.segno"
            \set Score.repeatCommands = #'((end-repeat))
          }
          \new Voice = "PartA" {
            \voiceTwo
            \PartAPre
            \PartAPre
            \PartAOne
            \PartAOneChorus
            \PartATwo
            \PartATwoChorus
          }
          \new NullVoice = "LyrTwo" {
            s2.*6
            \PartATwo
          }
          \new NullVoice = "LyrCommon" {
            \PartAPre
            \PartAPre
            s2.*2
            \PartAOneChorus
            s2.*2
            \PartATwoChorus
          }
        >>
        \new Lyrics \with {
          alignAboveContext = "S"
        } \lyricsto "PartSolo" {
          \set stanza = "1."
          \LyrStanzaOne
        }
        \new Lyrics \with {
          alignAboveContext = "S"
        } \lyricsto "PartSolo" {
          \set stanza = "2."
          \LyrStanzaTwo
        }
        \new Lyrics \with {
          alignAboveContext = "S"
        } \lyricsto "PartSolo" {
          \set stanza = "5."
          \LyrStanzaFive
        }
        \new Lyrics \lyricsto "LyrTwo" {
          \set stanza = "3."
          \LyrStanzaThree
        }
        \new Lyrics \lyricsto "LyrTwo" {
          \set stanza = "4."
          \LyrStanzaFour
        }
        \new Lyrics \lyricsto "LyrCommon" {
          \LyrStanzaOne
          \LyrChorus
          \LyrChorus
        }
        \new Staff = "B" <<
          \clef "bass"
          \key f \minor
          \new Voice = "PartT" {
            \voiceOne
            \PartTPre
            \PartTPre
            \PartTOne
            \PartTOneChorus
            \clef "treble_8"
            \PartTTwo
            \clef bass
            \PartTTwoChorus
            \PartTTwoChorusEnd
          }
          \new Voice = "PartB" {
            \voiceTwo
            \PartBPre
            \PartBPre
            \PartBOne
            \PartBOneChorus
            \PartBTwo
            \PartBTwoChorus
            \PartBTwoChorusEnd
          }
        >>
      >>
    >>
    \layout {}
    \midi {
      \tempo 4=40
    }
  }
  \paper {
    system-count = #4
    system-system-spacing =
      #'((basic-distance . 8) 
         (minimum-distance . 4)
         (padding . 8)
         (stretchability . 60)) % defaults: 12, 8, 1, 60
  }
}

\book {
  
  \bookOutputSuffix "full-g"
  
  \markup \vspace #0.7
  
  \score {
    <<      
      \new ChoirStaff <<
        \new Staff = "S" <<
          \clef "treble"
          \key g \minor
          \time 3/4
          \new Voice = "PartSolo" {
            s2.*2
            \transpose f g \PartSoloOne
          }
          \new Voice = "PartS" {
            \transpose f g {
              \PartAPre
              \PartSPre
              \textEndMark \markup \musicglyph "scripts.segno"
              \set Score.repeatCommands = #'((start-repeat))
              s2.*2
              \PartSOneChorus
              \once\override Score.BreakAlignment.break-align-orders = \break-align-orders-on-repeat
              \set Score.repeatCommands = #'((end-repeat) (start-repeat))
              \PartSTwo
              \PartSTwoChorus
              \textEndMark \markup \musicglyph "scripts.segno"
              \set Score.repeatCommands = #'((end-repeat))
            }
          }
          \new NullVoice = "LyrTwo" {
            s2.*6
            \PartATwo
          }
          \new NullVoice = "LyrCommon" {
            \PartAPre
            \PartAPre
            s2.*2
            \PartAOneChorus
            s2.*2
            \PartATwoChorus
          }
        >>
        \new Lyrics \with {
          alignAboveContext = "S"
        } \lyricsto "PartSolo" {
          \set stanza = "1."
          \LyrStanzaOne
        }
        \new Lyrics \with {
          alignAboveContext = "S"
        } \lyricsto "PartSolo" {
          \set stanza = "2."
          \LyrStanzaTwo
        }
        \new Lyrics \with {
          alignAboveContext = "S"
        } \lyricsto "PartSolo" {
          \set stanza = "5."
          \LyrStanzaFive
        }
        \new Lyrics \lyricsto "LyrTwo" {
          \set stanza = "3."
          \LyrStanzaThree
        }
        \new Lyrics \lyricsto "LyrTwo" {
          \set stanza = "4."
          \LyrStanzaFour
        }
        \new Lyrics \lyricsto "LyrCommon" {
          \LyrStanzaOne
          \LyrChorus
          \LyrChorus
        }
        \new Staff = "A" <<
          \clef "treble"
          \key g \minor
          \time 3/4
          \new Voice = "PartA" {
            \transpose f g {
              \PartAPre
              \PartAPre
              \PartAOne
              \PartAOneChorus
              \PartATwo
              \PartATwoChorus
            }
          }
        >>
        \new Staff = "T" <<
          \clef "treble"
          \key g \minor
          \new Voice = "PartT" {
            \transpose f g {
              \PartTPre
              \PartTPre
              \PartTOne
              \PartTOneChorus
              \PartTTwo
              \PartTTwoChorus
              \transpose g g' \PartTTwoChorusEnd
            }
          }
        >>
        \new Lyrics \lyricsto "LyrTwo" {
          \set stanza = "3."
          \LyrStanzaThree
        }
        \new Lyrics \lyricsto "LyrTwo" {
          \set stanza = "4."
          \LyrStanzaFour
        }
        \new Lyrics \lyricsto "LyrCommon" {
          \LyrStanzaOne
          \LyrChorus
          \LyrChorus
        }
        \new Staff = "B" <<
          \clef "bass"
          \key g \minor
          \new Voice = "PartB" {
            \transpose f g {
              \PartBPre
              \PartBPre
              \break
              \PartBOne
              \PartBOneChorus
              \break
              \PartBTwo
              \PartBTwoChorus
              c'4 f4
            }
          }
        >>
      >>
    >>
    \layout {}
    \midi {}
  }
  \paper {
    oddFooterMarkup = \markup {
      \unless \on-last-page {
        \fill-line { \hspace #1.0 } {
        \combine
        \path #0.2 #'((lineto 2 0) (curveto 4 0 4 2 2 2))
        \fontsize #4
        \arrow-head #X #LEFT ##f
        }
      }
    }
    system-count = #5
    system-system-spacing =
      #'((basic-distance . 8) 
         (minimum-distance . 4)
         (padding . 8)
         (stretchability . 60)) % defaults: 12, 8, 1, 60
  }
  
  \LyrFull
}