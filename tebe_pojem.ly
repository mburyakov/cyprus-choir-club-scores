\version "2.24"

\language "deutsch"

taglineLanguage = "russian"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"

\layout {  
  \context {
    \Staff
    \omit TimeSignature
  }
}

\header {
  title = "Тебе поем"
  composer = "П. Г. Чесноков"
  opus = \markup { \fontsize #-2 \italic "Op. 27 №6" }
  % piece = "из «Милости мира» киевского знаменного распева"
}

PartS = \relative c' {
    \time 5/2
    \dynamicUp
    \tempo "Немного медленнее. Покойно."
    d2 \p d2 cis2 d1 |
    \time 7/2
    h2 d2 d2 d2 cis2 d1 |
    \time 17/2
    h2 d2 \< d2 d2 \! d2 e1~ \> e1 \! fis1 fis2( \> e2) fis1~ fis2 \! r2 |
    \time 8/2
    fis4( \p g4 a2) g2.( a4 g4 fis8 e8) fis4 g4 a2( d,2) |
    \time 15/2
    e4( d8 e8) fis4 e4 d4.( e8 d4) cis4 d2 e2 fis4.( e8 fis4 g4)
    a2 a4( h4 a8 g8 fis4 g2) g8( fis8) e4 fis1 |
    \time 7/2
    fis8( g8) a4 g4 fis4 e4.( fis8 e4 d8 cis8 d2 e4) e4 fis2 |
    \time 6/2
    fis2 \p e4( d4) e4 fis4 g4.( fis8  g4 fis8 e8 fis2) |
    \time 8/2
    e4 fis4 e4 d4 cis4( d4 g4 fis4 e2) e2 d2~ d4 r4 \bar "|."
}

\addQuote "Sd" { \transpose h d' \PartS }
\addQuote "Se" { \transpose h e' \PartS }

PartA = \relative c' {
    d2 d2 cis2 d1 |
    h2 d2 d2 d2 cis2 d1 |
    h2 d2 d2 d2 d2 e1~ e1 fis1 fis2( e2) fis1~ fis2 r2 |
    e2( dis2) d1( cis2) cis4 cis4 c1 |
    h2 cis4 cis4 h2~ h4 h4 h2 cis2 d4( cis4 d4 e4)
    e4( dis4) e2.( dis4 e4 dis4) e4 cis4 d1 |
    e4 e4 dis4 dis4 d2.( h4~ h2 cis4) cis4 d2 |
    d2 e4( d4) e4 d4 d1~ d2 |
    h2 h2 h4( a4) h4( d4) d4( h4) cis2 d2~ d4 r4 |
}

\addQuote "Ad" { \transpose h d' \PartA }
\addQuote "Ae" { \transpose h e' \PartA }

PartTT = \relative c' {
    h2 h2 h2 h1 |
    h2 h2 h2 h2 h2 h1 |
    h2 h2 h2 h2 d2 d1( cis1) d1 h1 ais1~ ais2 r2 |
    a1 b1( a2) a4 g4 fis1 |
    d2 g4 g4 fis2( g4) g4 g2 g2 fis4( a4 d4 cis4)
    c2 c1( h2) h4 b4 a1 |
    a4 a4 a4 a4 gis1( g2.) g4 fis2 |
    a2 c2 c4 c4 h2( b2 a2) |
    g2 g2 g4( fis4) e4( fis4) g2 g2 fis2~ fis4 r4 |    
}

\addQuote "TTd" { \transpose h d' \PartTT }
\addQuote "TTe" { \transpose h e' \PartTT }

PartT = \relative c {
    fis2 g2 g2 fis1 |
    fis2 fis2 fis2 g2 g2 fis1 |
    fis2 fis2 fis2 g2 g2 g1~ g1 fis1 h1 ais1~ ais2 r2 |
    a1 b1( a2) a4 g4 fis1 |
    d2 g4 g4 fis2( g4) g4 g2 g2 fis4( a4 d4 cis4)
    c2 c1( h2) h4 b4 a1 |
    a4 a4 a4 a4 gis1( g2.) g4 fis2 |
    a2 c2 c4 c4 h2( b2 a2) |
    g2 g2 g4( fis4) e4( fis4) g2 g2 fis2~ fis4 r4 |    
}

\addQuote "Td" { \transpose h d' \PartT }
\addQuote "Te" { \transpose h e' \PartT }

PartBB = \relative c {
    h2 e2 e2 h1 |
    h2 h2 h2 e2 e2 h1 |
    h2 h2 h2 e2 e2 a,1~ a1 a2( d2) d2( cis2) cis1~ cis2 r2 |
    h1 e,2( e'2 a,2) a4 a4 d,1 |
    g2 a4 ais4 h2( e4) e4 a,2 a2 d,1~
    d2~ d1~ d1~ d2( d'4 cis4) |
    c4 c4 h4 h4 e,1( a2.) a4 d,2~ |
    d2~ d1~ d1~ d2 |
    g2 g2 a2 a2 a2 a2 a2~ a4 r4 |
}

\addQuote "BBd" { \transpose h d' \PartBB }
\addQuote "BBe" { \transpose h e' \PartBB }

PartB = \relative c, {
    h2 e2 e2 h1 |
    h2 h2 h2 e2 e2 h1 |
    h2 h2 h2 e2 e2 a,1~ a1 d1 g1 fis1~ fis2 r2 |
    h2( h,2) e2( e'2 a,2) a4 a4 d,1 |
    g2 a4 ais4 h2( e4) e4 a,2 a2 d,1~
    d2~ d1~ d1~ d2( d'4 cis4) |
    c4 c4 h4 h4 e,1( a2.) a4 d,2~ |
    d2~ d1~ d1~ d2 |
    g2 g2 a2 a2 a2 a2 d,2~ d4 r4 |
}

\addQuote "Bd" { \transpose h d' \PartB }
\addQuote "Be" { \transpose h e' \PartB }

LyrEnd = \lyricmode {
    мо -- лим    Ти    ся,    Бо -- же    наш.
}

Lyr = \lyricmode {
    Те -- бе    по -- ем,
    Те -- бе    бла -- го -- сло -- вим,
    Те -- бе    бла -- го -- да -- рим, Гос -- по -- ди,
    и    мо -- лим    Ти    ся,
    и    мо -- лим    Ти    ся,    Бо -- же    наш,
    и    мо -- лим    Ти    ся,
    мо -- лим    Ти    ся,    Бо -- же    наш,
    и    мо -- лим    Ти    ся,
    \LyrEnd
}

\addQuote "Lyr" { \Lyr }

LyrB = \lyricmode {
    Те -- бе    по -- ем,
    Те -- бе    бла -- го -- сло -- вим,
    Те -- бе    бла -- го -- да -- рим, Гос -- по -- ди,
    и    мо -- лим    Ти    ся,
    и    мо -- лим    Ти    ся,    Бо -- же    наш,
    __
    мо -- лим    Ти    ся,    Бо -- же    наш,
    __
    мо -- лим    Ти    ся,    Бо -- же    наш.
}

\book {
  \score {
    <<      
      \new ChoirStaff <<
        \new Staff = "S" <<
          \clef "treble"
          \key h \minor
          \new Voice = "PartS" { \PartS }
          \new Lyrics \lyricsto "PartS" { \Lyr }
        >>
        \new Staff = "A" <<
          \clef "treble"
          \key h \minor
          \new Voice = "PartA" { \PartA }
          \new Lyrics \lyricsto "PartA" { \Lyr }
        >>
        \new Staff = "T" <<
          \clef "treble_8"
          \key h \minor
          \new Voice = "PartTT" { \voiceOne\PartTT }
          \new Lyrics \lyricsto "PartTT" { \Lyr }
          \new Voice = "PartT" { \voiceTwo\PartT }
          %\new Lyrics \lyricsto "PartT" { \Lyr }
        >>
        \new Staff = "B" <<
          \clef "bass"
          \key h \minor
          \new Voice = "PartBB" { \voiceOne\PartBB } 
          \new Lyrics \lyricsto "PartBB" { \LyrB }
          \new Voice = "PartB" { \voiceTwo\PartB }
          %\new Lyrics \lyricsto "PartB" { \LyrB }
        >>
      >>
    >>
  }
}

\book {
  \bookOutputSuffix "adaptation_e"
  \score {
    <<      
      \new ChoirStaff <<
        \new Staff = "A" <<
          \clef "treble"
          \key e \minor
          \new NullVoice = "PartSV" {
            \PartS
          }
          \new Lyrics \with {
            alignAboveContext = "A"
            \override LyricHyphen.minimum-distance = #1.0
            \override VerticalAxisGroup.nonstaff-nonstaff-spacing =
      #'((basic-distance . 0))
          } \lyricsto "PartSV" {
            \repeat unfold 49 { \skip 1 }
            \LyrEnd
          }
          \new Voice = "PartS" \with {
            \remove Dynamic_engraver
          } {
            \voiceOne
            \quoteDuring "Ae" { s2*12 }
            \quoteDuring "Ae" { s2*11 }
            \quoteDuring "Ae" { s2*5 }
            \oneVoice
            \quoteDuring "Ae" { s2*1 }
            \voiceOne
            \quoteDuring "Se" { s2*16 }
            \bar "|"
            \quoteDuring "Se" { s2*28 }
          }
          \new Voice = "PartA" \with {
            \remove Dynamic_engraver
          } {
            \voiceTwo
            \quoteDuring "TTe" { s2*12 }
            \quoteDuring "TTe" { s2*11 }
            \quoteDuring "Se" { s2*5 }
            s2*1
            \quoteDuring "Ae" { s2*44 }
          }
          \new Lyrics \with {
            \override LyricHyphen.minimum-distance = #1.0
          } \lyricsto "PartA" { \Lyr }
        >>
        \new Dynamics = "D" \with { alignAboveContext = "A" } {
            \PartS
          }
        \new Staff = "T" <<
          \clef "treble_8"
          \key e \minor
          \new Voice = "PartT" {
            \oneVoice
            \quoteDuring "Te" { s2*12 }
            \quoteDuring "Te" { s2*11 }
            \quoteDuring "Te" { s2*5 }
            \quoteDuring "TTe" { s2*1 }
            \quoteDuring "TTe" { s2*44 }
          }
        >>
        \new Staff = "B" \with {
          printPartCombineTexts = ##f
        }  <<
          \clef "bass"
          \key e \minor     
          \partCombine {
            << {
            s2*37
            \quoteDuring "Te" { s2*1 }
            s2*10
            } 
            {
              \transpose h e' \PartBB
            } >>
          } {
            \transpose h e' \PartB
          }
          \new NullVoice = "PartB" <<
            \PartB  
          >>
          \new Lyrics \lyricsto "PartB" { \LyrB }
        >>
      >>
    >>  
    \layout {}
    \midi {
      \context {
        \Staff {
          \set midiInstrument = "viola"
          \tempo 4 = 250
        }
      }
    }
  }
  \paper {
    system-system-spacing =
    #'((basic-distance . 25) 
       (minimum-distance . 8)
       (padding . 1)
       (stretchability . 60)) % defaults: 12, 8, 1, 60
  }
}

\book {
  \bookOutputSuffix "adaptation_d"
  \score {
    <<      
      \new ChoirStaff <<
        \new Staff = "A" \with {
          \consists Merge_rests_engraver
        } <<
          \clef "treble"
          \key d \minor
          \new NullVoice = "PartSV" {
            \PartS
          }
          \new Lyrics \with {
            alignAboveContext = "A"
            \override LyricHyphen.minimum-distance = #1.0
            \override VerticalAxisGroup.nonstaff-nonstaff-spacing =
      #'((basic-distance . 0))
          } \lyricsto "PartSV" {
            \repeat unfold 49 { \skip 1 }
            \LyrEnd
          }
          \new Voice = "PartS" \with {
            \remove Dynamic_engraver
          } {
            \voiceOne
            \quoteDuring "Ad" { s2*12 }
            \quoteDuring "Ad" { s2*11 }
            \quoteDuring "Ad" { s2*5 }
            \quoteDuring "Ad" { s2*1 }
            \quoteDuring "Sd" { s2*16 }
            \bar "|"
            \quoteDuring "Sd" { s2*28 }
          }
          \new Voice = "PartA" \with {
            \remove Dynamic_engraver
          } {
            \voiceTwo
            \quoteDuring "TTd" { s2*12 }
            \quoteDuring "TTd" { s2*11 }
            \quoteDuring "Sd" { s2*5 }
            \quoteDuring "Sd" { s2*1 }
            \quoteDuring "Ad" { s2*44 }
          }
          \new NullVoice = "PartALyr" <<
            \PartA
          >>
          \new Lyrics \with {
            \override LyricHyphen.minimum-distance = #0.7
          } \lyricsto "PartALyr" { \Lyr }
        >>
        \new Dynamics = "D" \with { alignAboveContext = "A" } {
            \PartS
          }
        \new Staff = "T" <<
          \clef "treble_8"
          \key d \minor
          \new Voice = "PartT" {
            \quoteDuring "Td" { s2*12 }
            \quoteDuring "Td" { s2*11 }
            \quoteDuring "Td" { s2*5 }
            \quoteDuring "TTd" { s2*1 }
            \quoteDuring "TTd" { s2*44 }
          }
        >>
        \new Staff = "B" \with {
          printPartCombineTexts = ##f
          \consists Merge_rests_engraver
        }  <<
          \clef "bass"
          \key d \minor
          
          \new Voice = "PartBB" {
            \voiceOne
            s2*12
            s2*9
            \quoteDuring "BBd" { s2*2 }
            \quoteDuring "BBd" { s2*5 }
            \quoteDuring "BBd" { s2*1 }
            \quoteDuring "BBd" { s2*2 }
            \quoteDuring "BBd" { s2*4 }
            f1
            s2*35
          }
          \new Voice = "PartB" {
            \quoteDuring "BBd" { s2*1 }
            \quoteDuring "Bd" { s2*2 }
            \quoteDuring "BBd" { s2*5 }
            \quoteDuring "Bd" { s2*2 }
            \quoteDuring "BBd" { s2*5 }
            \quoteDuring "Bd" { s2*2 }
            \quoteDuring "BBd" { s2*4 }
            
            \voiceTwo
            \quoteDuring "Bd" { s2*2 }
            \quoteDuring "Bd" { s2*5 }
            \quoteDuring "Bd" { s2*1 }
            \quoteDuring "Bd" { s2*2 }
            g,1( c2)
            \quoteDuring "Bd" { s2*3 }
            \oneVoice
            <b,f>2
            \quoteDuring "Bd" { s2*33 }
            <f, c>2~ <f, c>4
          }
          \new NullVoice = "PartBLyr" <<
            \PartB  
          >>
          \new Lyrics \lyricsto "PartBLyr" { \LyrB }
        >>
      >>
    >>  
    \layout {}
    \midi {
      \context {
        \Staff {
          \set midiInstrument = "viola"
          \tempo 4 = 250
        }
      }
    }
  }
  \paper {
    system-system-spacing =
    #'((basic-distance . 25) 
       (minimum-distance . 8)
       (padding . 1)
       (stretchability . 60)) % defaults: 12, 8, 1, 60
  }
}