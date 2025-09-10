\version "2.24"

\language "deutsch"

taglineLanguage = "italian"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"

\header {
  title = "Contraponto bestiale alla mente"
  composer = "Adriano Banchieri (1568-1634)"
}

\layout {
  \context {
    \Staff
    \RemoveAllEmptyStaves
  }
}

PartSPre = \relative c'' {
  g4 g4 c4 a4. c8 a4
  g4 c4 h4 c8 h8 c8 d8 e4
  \break
  a,4 a4 a4 c4. d8 c4
  d4 d4 a4 h8 a8 h8 c8 d4
  \break
  c4 c4 g4 a4. g8 a4
  g4 g4 g4 g2.
}

PartAPre = \relative c' {
  e4 e4 e4 f4. g8 f4
  e4 g4 g4 g8 f8 g8 a8 g4
  f4 f4 f4 e4. d8 e4
  d4 d4 d4 d8 c8 d8 e8 d4
  e4 e4 e4 f4. g8 f4
  e4 e4 d4 e2.
}

PartTPre = \relative c' {
  c4 c4 g4 c4. c8 c4
  c4 c4 d4 e8 d8 e8 f8 e4
  c4 c4 c4 c4. g8 g4
  h4 g4 fis4 g2.
  g4 g4 c4 c4. c8 c4
  c4 c4 h4 c2.
}

PartBPre = \relative c {
  c4 c4 c4 f4. e8 f4
  c4 e4 g4 c,2.
  f4 f4 f4 c4. h8 c4
  g4 h4 d4 g,2.
  c4 c4 c4 f4. e8 f4
  c4. e8 g4 c,2.
}

PartBasso = \relative c {
  c2 c2( d2) c2 e2 f2 g2
  c,2 h2 a2 h2 c2 c2( f2) d2( c2)
  c2 c2( d2) c2 e2 f2 g2
  c,2 h2 a2 h2 c2 c2( f2) d2 c2
}

PartChiu = \relative c'' {
  r2 R1 g2 r2 a2 r2 g2 r2 a2 r2 g2 r2 a2 r2 g2
  r2 r2 r2 g2 r2 a2 r2 g2 r2 a2 r2 g2 r2 a2 r2 g2
}

PartCucco = \relative c'' {
  \autoBeamOff
  r2 | r1 | r4 r8 e8 c4 r8 e8 | c4 r4 r2 | r8 e8 c4 r2 | r8 e8 c4 r2 | r8 e8 c8 e8 c4 r8 e8 | c4 r4 
  r2 | e4 c4 r4 r8 e8 | c8 e8 c4 r2 | r8 e8 c4 r4 r8 e8 | c4 r4 r2 |  r8 e8 c4 r2 | r8 e8 c4 r2 | r8 e8 c8 e8 c4 r8 e8 | c4 r4 r2 | e4 c4 
}

PartGatto = \relative c' {
  \autoBeamOff
      r2 | r4 e4 r4 d4 | r4 e4 r4 e4 | r4 r8 f8( d4) g4 |
      r4 r8 e8( g8) d8( g4) |
      r4 r8 e8( g8) d8( g4) |
      r4 r8 e8( g8) e8( g4) |
      r4 r8 f8( a8) d,8( f4) | 
      r4 e4 r8 e8( g8) e8( | g4) e4 r4 d4 |
      r4 e4 r4 e4 |
      r4 r8 f8( d4) g4 |
      r4 r8 e8( g8) d8( g4) |
      r4 r8 e8( g8) d8( g4) |
      r4 r8 e8( g8) e8( g4) |
      r4 r8 f8( a8) d,8( f4) |
      r4 e4
}

PartCane = \relative c' {
  \repeat unfold 16 {
    r2 | r8 c8 c4
  }
}

LyrPre = \lyricmode {
  Fa la la la la la la la la la la la la la,
  Fa la la la la la la la la la la la la la,
  Fa la la la la la la la la la.
}

LyrBasso = \lyricmode {
  Nul -- la __ fi -- des    gob -- bis,
  si -- mi -- li -- ter    est    zop -- pis, __
  Si    squer -- zus    bo -- nus    est,
  su -- per    an -- na -- li -- a __ scri -- be.
}

LyrChiu = \lyricmode {
  chiù,   chiù,   chiù,   chiù,   chiù,   chiù,   chiù,
  chiù,   chiù,   chiù,   chiù,   chiù,   chiù,   chiù.
}

LyrCucco = \lyricmode {
  cu -- cu, cu -- cu, cu -- cu, cu -- cu, cu -- cu,
  cu -- cu, cu -- cu, cu -- cu, cu -- cu, cu -- cu,
  cu -- cu, cu -- cu, cu -- cu, cu -- cu, cu -- cu,
  cu -- cu, cu -- cu, cu -- cu.
}

LyrGatto = \lyricmode {
  miau, miau, miau, miau, miau, miau,
  miau, miau, miau, miau, miau, miau,
  miau, miau, miau, miau, miau, miau,
  miau, miau, miau, miau, miau, miau,
  miau, miau, miau, miau, miau, miau,
  miau, miau.
}

LyrCane = \lyricmode {
  \repeat unfold 15 {
    bau bau,
  }
  bau bau.
}

\book {
  
  \markup \vspace #0.7
  
  \score {
    <<      
      \new ChoirStaff <<
        
        \new Staff = "Cucco" <<
          \new Voice = "PartCucco" {
            s2.*12
            \PartCucco
          }
        >>
        \new Lyrics \lyricsto "PartCucco" {
          \LyrCucco
        }
        
        \new Staff = "Gatto" <<
          \new Voice = "PartGatto" {
            s2.*12
            \PartGatto
          }
        >>
        \new Lyrics \lyricsto "PartGatto" {
          \LyrGatto
        }
        
        \new Staff = "S" <<
          \clef "treble"
          \key c \major
          \time 3/4
          \new Voice = "PartS" {
            \voiceOne
            \PartSPre
          }
          \new Voice = "PartA" {
            \voiceTwo
            \PartAPre
          }
          \new Voice = "PartChiu" {
            s2.*12
            \time 2/2
            \partial 2
            \PartChiu
          }
          \new NullVoice = "time" {
            s2.*12
            \time 2/4
            \partial 2
            s2
            \time 4/4
            s1*15
            \time 2/4
          }
        >>
        \new Lyrics \lyricsto "PartS" {
          \LyrPre
        }
        \new Lyrics \lyricsto "PartChiu" {
          \LyrChiu
        }
        
        \new Staff = "T" <<
          \clef "treble_8"
          \key c \major
          \new Voice = "PartT" {
            \PartTPre
          }
          \new Voice = "PartCane" {
            s2.*12
            \PartCane
          }
        >>
        
        \new Lyrics \lyricsto "PartCane" {
          \LyrCane
        }
        
        \new Staff = "B" <<
          \clef "bass"
          \key c \major
          \new Voice = "PartB" {
            \repeat segno 2 {
              \PartBPre
              \fine
              s1*16
            }
          }
          \new Voice = "PartBasso" {
            s2.*12
            \bar "||"
            \break
            \PartBasso
            \bar "|."
          }
        >>
        \new Lyrics \lyricsto "PartBasso" {
          \LyrBasso
        }
      >>
    >>
    \layout {}
    \midi {
      \tempo 4=40
    }
  }
  \paper {
    system-system-spacing =
      #'((basic-distance . 8) 
         (minimum-distance . 4)
         (padding . 1)
         (stretchability . 60)) % defaults: 12, 8, 1, 60
  }
}