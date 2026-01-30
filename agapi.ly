\version "2.24"

\language "deutsch"

\header {
  title = "Η αγάπη"
  subtitle = "Εσμέ - Νικομήδεια"
  subsubtitle = \markup { \column { \line { "Από τη συλλογή \"Δημώδη Ελληνικά άσματα\"" } \line { "του Γεωργίου Παχτίκου, αρ 114 σελ. 172" } } }
  composer = "Φίλιππος Τσαλαχούρης"
}

taglineLanguage = "greek"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"

PartS = \relative c' {
  f4 g8 a8 a4 a4 |
  g4 c8( b8) a4( g4) |
  f4 g8 a8 a4 a4 |
  g8( f8 e8 d8) c2 |
  
  f4 g8 a8 a4 a4 |
  g4 c8( b8) a4( g4) |
  f4 g8 a8 a4 a4 |
  g8( a16 g16 f8 e8) f2 |
}

PartM = \relative c' {
  f4 f8 f8 f8( g8) f4 |
  f4 f8( g8) f8( e8 d4) |
  d4 e8 g8 f8( g8) f4 |
  f8( c8 c8 c8) c2 |
  
  f4 f8 f8 f8( g8) f4 |
  f4 f8( g8) f8( e8 d4) |
  d4 d8 e8 f8( g8) f4 |
  e4.( d8) c2 |
}

PartA = \relative c' {
  f4 f8 e8 f4 f4 |
  c4 c4 c2 |
  c4 c8 c8 c4 d4 |
  e8( c8 b4) c2 |
  
  f4 f8 e8 f4 f4 |
  f4 f4 c2 |
  c4 c8 c8 c4 c4 |
  c4.( b8) a2 |
}

PartB = \relative c {
  f4 f8 f8 f4 f4 |
  c4 c4 f8( e8 d4) |
  c4 c8 c8 c4 d4 |
  b4( c4) c2 |
  
  f4 f8 f8 f4 f4 |
  c4 c4 f8( e8 d4) |
  b4 b8 b8 c4 c4 |
  d4( c4) f2 |
}

LyricsOne = \lyricmode {
  θε να ’νε -- βώ στον ου -- ρα -- νό
  να πιά -- σω~έ -- να που -- λά -- κι
  να κά -- θο -- μαι να το ρω -- τώ
  πώς πιά -- νε -- ται η~α -- γά -- πη.
}

LyricsTwo = \lyricmode {
  Α -- πέ τα μά -- τια πιά -- νε -- ται,
  στα χεί -- λη κα -- τε -- βαί -- νει,
  κι~α -- πό τα χεί -- λη στην καρ -- διά
  ρι -- ζώ -- νει κι~α -- πο -- μέ -- νει.
}

\book {
  \score {
    <<
      \new ChoirStaff <<
        \time 2/4
        \new Staff = "S" <<
          \tempo "Andante"
          \clef "treble"
          \key f \major
          \new Voice = "PartS" { \PartS \PartS \bar "|." }
        >>
        \new Lyrics \lyricsto "PartS" {
          \LyricsOne \LyricsTwo
        }
        \new Staff = "M" <<
          \clef "treble"
          \key f \major
          \new Voice = "PartM" { \PartM \PartM }
        >>
        \new Lyrics \lyricsto "PartM" {
          \LyricsOne \LyricsTwo
        }
        \new Staff = "A" <<
          \clef "treble"
          \key f \major
          \new Voice = "PartA" { \PartA \PartA }
        >>
        \new Lyrics \lyricsto "PartA" {
          \LyricsOne \LyricsTwo
        }
      >>
    >>
    \layout {
    }
    \midi {
      \tempo 4 = 80
    }
  }
  \paper {
    system-count = #4
    page-count = #1
    ragged-last-bottom = #'t
  }
}

\book {
  \bookOutputSuffix "with-bass"
  \score {
    <<
      \new ChoirStaff <<
        \time 2/4
        \new Staff = "S" <<
          \tempo "Andante"
          \clef "treble"
          \key f \major
          \new Voice = "PartS" { \PartS \bar "|." }
        >>
        \new Lyrics \lyricsto "PartS" {
          \set stanza = "1. "
          \LyricsOne
        }
        \new Lyrics \lyricsto "PartS" {
          \set stanza = "2. "
          \LyricsTwo
        }
        \new Staff = "M" <<
          \clef "treble"
          \key f \major
          \new Voice = "PartM" { \PartM }
        >>
        \new Lyrics \lyricsto "PartM" {
          \set stanza = "1. "
          \LyricsOne
        }
        \new Lyrics \lyricsto "PartM" {
          \set stanza = "2. "
          \LyricsTwo
        }
        \new Staff = "A" <<
          \clef "treble"
          \key f \major
          \new Voice = "PartA" { \PartA }
        >>
        \new Lyrics \lyricsto "PartA" {
          \set stanza = "1. "
          \LyricsOne
        }
        \new Lyrics \lyricsto "PartA" {
          \set stanza = "2. "
          \LyricsTwo
        }
        \new Staff = "B" <<
          \clef "treble_8"
          \key f \major
          \new Voice = "PartB" { \PartB }
        >>
        \new Lyrics \lyricsto "PartB" {
          \set stanza = "1. "
          \LyricsOne
        }
        \new Lyrics \lyricsto "PartB" {
          \set stanza = "2. "
          \LyricsTwo
        }
      >>
    >>
    \layout {
      #(layout-set-staff-size 18)
    }
    \midi {
      \tempo 4 = 80
    }
  }
  \paper {
    system-system-spacing = #'((basic-distance . 0.1) (padding . 10))
  }
}