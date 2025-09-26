\version "2.24"

\language "deutsch"

taglineLanguage = "english"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"
\include "include/lyrics-not-affecting-layout.ly"

\include "articulate.ly"

\header {
  title = "Yesterday"
  composer = "J. Lennon, P. McCartney"
  arranger = "arr: A. Nikiforov"
}

PartSoloVerse = \relative c' {
  g8 f8 f2. |
  r4 a8 h8 cis8 d8 e8 f8 |
  e4 d8 d8~ d2 |
  r4 d8 d8 c8 b8 a8 g8 b4 a8 a8~ a4. g8 |
  f4 a8 g8~ g4. d8 f4 a8 a8~
}

PartSoloThird = \relative c' {
  a2 a2 r4 d8 e8 f4 e8 d8 |
  e4. d8 c4 d8 a8~ a1
  a2 a2 d4 e4 a4 g8 f8 as4. g8 f4 des4 f1 |
}

PartSoloForth = \relative c' {
  g8 f8 f2. |
  r4 a8 h8 cis8 d8 e8 f8 |
  e4 d8 d8~ d2 |
  R1 R1 |
  f4 e4 d4 c4 b1 b1 a1~ a1
}

PartSolo = {
  \PartSoloVerse a2 \bar "||"
  \PartSoloVerse a2~ a1 \bar "||"
  \PartSoloThird \bar "||"
  \PartSoloForth \bar "|."
}

PartA = \relative c' {
  \numericTimeSignature
  \time 4/4
  r4\mf c2( g'4~ g2.) e4 |
  e4.-.\f f8~\p f2 c2(\mf f2) |
  e4.-.\f f8~\p f4 g4 |
  f2(\mf a2) f1 |
  e4.-.\f f8~\p f2 g2(\mf fis2) |
  e8( f8-!) g8-! a8~ a4 a4 c2( f,2) |
  f4.-.\f f8~\p f4 g4 f4(\mf a4) g2 |
  f1\mp f1\p |
  h2\ff a2 a4 d4 d2 |
  b2 g2 a1 |
  g2( h2) a2 h2 |
  c1 a2 g2\mf |
  a1 h1 |
  a4.-. f8~ f2-. f4.-. g8~ g2-. |
  f4 f8 f8~ f2-. a4 g4 f4 f4 |
  f1-_ \breathe g1 g1~ g1 |
}

PartAA = \relative c' {
  r2\mf d2~ d2 cis2 |
  c4.-.\f c8~\p c2 |
  d1\mf c4.-.\f c8~\p c2 |
  d1\mf d1 |
  c4.-.\f c8~\p c2 d2(\mf cis2) |
  c8( d8-!) e8-! f8~ f4 f4 d1 |
  des4.-.\f c8~\p c4 c4 c4(\mf f4) d2 |
  d1\mp c1\p |
  g'2\ff f2 f4 a4 a2 |
  a4( f4) e4( f4) f1 |
  e2( g2) f2 f2 |
  des1 f1 |
  r4\mf c4 d4 f4 g1 |
  f4.-. e8~ e2-. d4.-. es8~ es2-. |
  des4 des8 des8~ des2-. |
  c4 c4 c4 c4 |
  es1-_ \breathe f1 f1~ f1
  
}

PartS = \relative c'' {
  r2.\mf r4 a8 h4 h8~ h4 g4 |
  g4.-.\f a8~\p a2 f2(\mf b2) |
  g4.-.\f a8~\p a4 g4 a2(\mf h2) c2( b2) |
  g4.-.\f a8~\p a4. a8 h2(\mf b2) |
  g8( a8-!) c2 d4 f2( b,2) |
  as4.-.\f a8~\p a4 c4 a4(\mf c4) h2 |
  b1\mp a1\p |
  d2\ff cis2 d4 e4 f2 |
  d2 c4( b4) c1 |
  d2( cis2) d2 e2 |
  f1 des2 b2\mf |
  c1 d2( cis2) |
  c4.-. h8~ h2-. b4.-. a8~ a2-. |
  as4 as8 g8~ g2-. |
  f4 e4 d4 f4 |
  g1-_ \breathe d'1 c1~ c1
}


PartB = \relative c {
  f1\mf e2 a,2
  d4.-.\f d8~\p d8 d8\mf c4 b2( c2) f4.-.\f f8~\p f4 e4
  d2(\mf g2) b,2( c2) |
  f4.-.\f f8~\p f8 c8\mf d8 f8 e2( a,2) |
  d4. d8~ d8 d8 c4 |
  b2( c2) es4.-.\f f8~\p f4 e4 |
  d4(\mf f4) g2 g2(\mp c2) f,1\p |
  e'2\ff es2 d4 c4 b2 |
  g4( b4) c2 f,4( c'4 es4 c8 b8) |
  a1 d4( c4) g2 |
  b1 es2 c2\mf |
  f,1 e2( a,2) |
  d4.-. g8~ g2-. c,4.-. f8~ f2-. |
  b,4 b8 es8~ es2-. f4 a4 b4 a4 |
  as1-_ \breathe c,1 f1~ f1 | 
}

LyricsSolo = \lyricmode {
  Yes -- ter -- day,
  all  my  trou -- bles  seemed  so  far  a -- way.
  Now_it_looks as though the're _ _ here  to  stay.
  Oh,  I  be -- leive 
  in  yes -- ter -- day.
  
  Sud -- den -- ly,
  I'm  not  half  the  man  I  used  to  be.
  There's  a  shad -- ow  hang -- ing  o -- ver me.
  Oh, yes -- ter -- day
  came  sud -- den -- ly.
  
  
  
  Why  she  had  to  go,
  I  don't  know,  she  would -- n't  say.
  
  I  said  some -- thing  wrong,
  now  I  long  for  yes -- ter -- day.
  
  Yes -- ter -- day,
  love  was  such  an  eas -- y  game  to  play...
  
  I  be -- lieve  in  yes -- ter -- day.
  
}

LyricsAA = \lyricmode {
  \set Lyrics.ignoreMelismata = ##t
  \repeat unfold 49 { _ }
  Oh, yes -- ter -- day
}

LyricsB = \lyricmode {
  \set Lyrics.ignoreMelismata = ##t
  \repeat unfold 6 { _ }
  a -- way
  \repeat unfold 13 { _ }
  Oh, sud -- den -- ly
  woo
  \repeat unfold 3 { _ }
  to be
}

LyricsTutti = \lyricmode {
  \set Lyrics.ignoreMelismata = ##t
  \repeat unfold 43 { _ }
  Why she had to go
  \repeat unfold 18 { _ }
  game play _
  need place _
  hide a -- way _
  I be -- lieve in yes -- ter -- day.
}

Music = {
    <<
      \new Staff = "Solo" \with {
        midiMaximumVolume = 0.0
      } <<
        \tempo 4 = 82
        \clef "treble_8"
        \key d \major
        \new Voice = "PartSolo" { \transpose f d \PartSolo }
      >>
      \new Lyrics \lyricsto "PartSolo" {
        \LyricsSolo
      }
      \new ChoirStaff <<
        \new Staff = "S" <<
          \tag #'enphasize-S {
            \set Staff.midiMaximumVolume = #1.0
            \set midiPanPosition = 0.7
          }
          \clef "treble"
          \key d \major
          \new Voice = "PartS" { \transpose f d \PartS }
        >>
        \new Staff = "A" <<
          \tag #'enphasize-A {
            \set Staff.midiMaximumVolume = #1.0
            \set midiPanPosition = 0.7
          }
          \clef "treble"
          \key d \major
          \new Voice = "PartA" { \transpose f d \PartA }
        >>
        \new Staff = "AA" <<
          \tag #'enphasize-AA {
            \set Staff.midiMaximumVolume = #1.0
            \set midiPanPosition = 0.7
          }
          \clef "treble"
          \key d \major
          \new Voice = "PartAA" { \transpose f d \PartAA }
        >>
        \new Lyrics \with {
          alignBelowContext = "AA"
        } \lyricsto "PartAA" {
          \LyricsAA
        }
        \new Staff = "B" <<
          \tag #'enphasize-B {
            \set Staff.midiMaximumVolume = #1.0
            \set midiPanPosition = 0.7
          }
          \clef "bass"
          \key d \major
          \new Voice = "PartB" { \transpose f d \PartB }
        >>
        \new Lyrics \lyricsto "PartB" {
          \LyricsB
        }
        \new Lyrics \with {
          alignBelowContext = "S"
        } \lyricsto "PartB" {
          \LyricsTutti
        }
        \new Lyrics \with {
          alignBelowContext = "A"
        } \lyricsto "PartB" {
          \LyricsTutti
        }
        \new Lyrics \with {
          alignBelowContext = "AA"
        } \lyricsto "PartB" {
          \LyricsTutti
        }
      >>
    >>
}

MusicArticulated = {
  #(define ac:staccatoFactor '(2 . 3))
  #(define ac:normalFactor '(1 . 1))
  \articulate {
    \Music
  }
}

SetLeftBalance = \midi {
  \set Staff.midiMaximumVolume = #0.6
  \set Staff.midiPanPosition = -1
}

\midi {
  \context {
    \Staff {
      \set midiInstrument = "acoustic grand"
    }
  }
}

\book {
  \bookOutputSuffix "d"
  \score {
    \Music
    \layout {
      %#(layout-set-staff-size 19)
      \context {
        \Lyrics {
          \set fontSize = #-2
          \override VerticalAxisGroup.nonstaff-nonstaff-spacing.minimum-distance = ##f
        }
      }
      \context {
        \Voice
        \remove "Script_engraver"
        \remove "New_fingering_engraver"
        \remove "Dynamic_engraver"
      }
    }
  }
  \paper {
    system-count = 6
  }
}

\book {
  \bookOutputSuffix "d-all"
  \score {
    \keepWithTag #'nothing {
      \MusicArticulated
    }
    \midi {
      \set Staff.midiMaximumVolume = #0.4
    }
  }
}

\book {
  \bookOutputSuffix "d-S"
  \score {
    \keepWithTag #'enphasize-S {
      \MusicArticulated
    }
    \SetLeftBalance
  }
}

\book {
  \bookOutputSuffix "d-A"
  \score {
    \keepWithTag #'enphasize-A {
      \MusicArticulated
    }
    \SetLeftBalance
  }
}

\book {
  \bookOutputSuffix "d-AA"
  \score {
    \keepWithTag #'enphasize-AA {
      \MusicArticulated
    }
    \SetLeftBalance
  }
}

\book {
  \bookOutputSuffix "d-B"
  \score {
    \keepWithTag #'enphasize-B {
      \MusicArticulated
    }
    \SetLeftBalance
  }
}

\book {
  \bookOutputSuffix "d-with-prefix"
  \score {
    {
      \tempo 4 = 82
      \articulate {
        d'4-! d'4-! d'16-!d'16-!d'16-!d'16-!d'16-!r8.
      }
      \keepWithTag #'nothing {
        \MusicArticulated
      }
    }
    \midi {}
  }
}