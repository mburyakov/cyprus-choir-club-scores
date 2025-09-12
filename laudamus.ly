\version "2.24"

\language "deutsch"

\header {
  title = "Laudamus te"
  composer = "Karl Jenkins"
}

taglineLanguage = "latin"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"

\layout {
    \context {
    \Staff {
      \set autoBeaming=##f
    }
  }
}

\paper {
  system-count = #6
}

PartS = \relative c' {
  es8[( f8 g8 as8]) g8[( f8]) es4 |
  g8[( b8)] as8 g8 c2 |
  f,8[( as8]) g8 as8 b2 |
  es,8[( f8]) g8[( as8]) g8 f8 es4 |
  es8[( f8 g8]) as8 g8 f8 es4 |
  es8[( f8]) g8[( as8]) b8[( es8 as,8 g8]) |
  f4~ f8. es16 es2 |
  
  es8[( f8 g8 as8] b8 es4.~ |
  es8) r8\fermata as,8[( g8] f4~ f8.[ es16])
  
  \pageBreak
  
  es8[( f8]) g8[( as8]) g8[( f8]) es4 |
  g8 b8 as8 g8 c2 |
  f,8 as8 g8 as8 b2 |
  es,8[( f8]) g8 as8 g8[( f8]) es4 |
  es8[( f8]) g8 as8 g8[( f8]) es4 |
  es8[( f8]) g8 as8 b8[( es8 as,8 g8] |
  f4~ f8.) es16 es2 |
  
  es8[( f8 g8 as8] b8 es4.~ |
  es8) r8\fermata as,8[( g8] f4~ f8.[ es16])
  
}

PartA = \relative c' {
  b4( c4) d4 b4 |
  f'4 f8 f8 e8[( g8] f4) |
  f4 f8 f8 d8[( f8] es4) |
  c4 d4 es8 es8 \tuplet 3/2 { es8[( d8 des8]) } |
  c4( d8) d8 d8 d8 d8[( c8]) |
  c4 d4 es2 |
  c4 d4 c8[( d8] b4) |
  
  c4( d4 es8 b'4.~ |
  b8) r8\fermata r4 c,4( d4)
  
  b4 b4 es4 es4 |
  f8 f8 f8 f8 e8[( g8] f4) |
  f8 f8 f8 f8 d8[( f8] es4) |
  c4 d8 d8 es4( \tuplet 3/2 { es8[ d8]) des8 } |
  c4 d8 d8 d4 d8[( c8]) |
  c4 d8 d8 es2( |
  c4) d4 c8[( d8] b4) |
  
  c4( d4 es8 b'4.~ |
  b8) r8\fermata r4 c,4( d4)
}

PartT = \relative c' {
  g4( as4) as4 g4 |
  des'4 des8 des8 c2 |
  h4 h8 h8 b4( g4) |
  es4 f4 g8 g8 g4 |
  es4( f8) f8 as8 as8 g4 |
  es4 f4 as2 |
  as4 as4 as8[( b8] g4) |
  
  es4( f4 as2~ |
  as8) r8\fermata r4 as2 |
  
  g4 g4 a4 as4 |
  des8 des8 des8 des8 c2 |
  h8 h8 h8 h8 b4( g4) |
  es4 f8 f8 g4 g4 |
  es4 f8 f8 as4 g4 |
  es4 f8 f8 as2( |
  as4) as4 as8[( b8] g4) |
  
  es4( f4 as2~ |
  as8) r8\fermata r4 as2 |
}

PartB = \relative c {
  es2 es4 es4 |
  es4 es8 es8 as2 |
  as4 as8 as8 g4( c,4) |
  as4 b4 c8 c8 b4 |
  as4( b8) b8 h8 h8 c8.[( b16]) |
  as4 b4 c4( ces4) |
  b4 b4 <es \parenthesize es,>2 |
  
  as,4( b4 c2~ |
  c8) r8\fermata r4 b2 |
  
  es4 d4 c4 ces4 |
  b8 b8 es8 es8 as2 |
  as8 as8 as8 as8 g4( c,4) |
  as4 b8 b8 c4 b4 |
  as4 b8 b8 h4 c8.[( b16]) |
  as4 b8 b8 c4( ces4 |
  b4) b4 <es \parenthesize es,>2 |
  
  as,4( b4 c2~ |
  c8) r8\fermata r4 b2 |
}

LyricsLaudamus = \lyricmode {
  Lau -- da -- mus,
  lau -- da -- mus    te,
  lau -- da -- mus    te.
  Be -- ne -- di -- ci -- mus,
  be -- ne -- di -- ci -- mus,
  be -- ne -- di -- ci -- mus  te.
  
  _ _
  
  A -- do -- ra -- mus,
  a -- do -- ra -- mus te,
  a -- do -- ra -- mus te.
  Glo -- ri -- fi -- ca -- mus,
  glo -- ri -- fi -- ca -- mus,
  glo -- ri -- fi -- ca -- mus te.
  
  _ _
}

\book {
  \bookOutputSuffix "es"
  \score {
    <<
      \new ChoirStaff <<
        \new Staff = "S" <<
          \clef "treble"
          \key es \major
          \numericTimeSignature
          \time 4/4
          \new Voice = "PartS" { \transpose es es \PartS }
        >>
        \new Lyrics \lyricsto "PartS" {
          \LyricsLaudamus
        }
        \new Staff = "A" <<
          \clef "treble"
          \key es \major
          \numericTimeSignature
          \time 4/4
          \new Voice = "PartA" { \transpose es es \PartA }
        >>
        \new Lyrics \lyricsto "PartA" {
          \LyricsLaudamus
        }
        \new Staff = "T" <<
          \clef "treble_8"
          \key es \major
          \numericTimeSignature
          \time 4/4
          \new Voice = "PartT" { \transpose es es \PartT }
        >>
        \new Lyrics \lyricsto "PartT" {
          \LyricsLaudamus
        }
        \new Staff = "B" <<
          \clef "bass"
          \key es \major
          \numericTimeSignature
          \time 4/4
          \new Voice = "PartB" { \transpose es es \PartB }
        >>
        \new Lyrics \lyricsto "PartB" {
          \LyricsLaudamus
        }
      >>
    >>
    \layout {}
    \midi {
      \tempo 4 = 50
      \context {
        \Staff {
          %\set midiInstrument = "viola"
        }
      }
    }
  }
}

\book {
  \bookOutputSuffix "g"
  \score {
    <<
      \new ChoirStaff <<
        \new Staff = "S" <<
          \clef "treble"
          \key g \major
          \numericTimeSignature
          \time 4/4
          \new Voice = "PartS" { \transpose es g \PartS }
        >>
        \new Lyrics \lyricsto "PartS" {
          \LyricsLaudamus
        }
        \new Staff = "A" <<
          \clef "treble"
          \key g \major
          \numericTimeSignature
          \time 4/4
          \new Voice = "PartA" { \transpose es g \PartA }
        >>
        \new Lyrics \lyricsto "PartA" {
          \LyricsLaudamus
        }
        \new Staff = "T" <<
          \clef "treble"
          \key g \major
          \numericTimeSignature
          \time 4/4
          \new Voice = "PartT" { \transpose es g \PartT }
        >>
        \new Lyrics \lyricsto "PartT" {
          \LyricsLaudamus
        }
        \new Staff = "B" <<
          \clef "bass"
          \key g \major
          \numericTimeSignature
          \time 4/4
          \new Voice = "PartB" { \transpose es g \PartB }
        >>
        \new Lyrics \lyricsto "PartB" {
          \LyricsLaudamus
        }
      >>
    >>
    \layout {}
    \midi {
      \tempo 4 = 50
      \context {
        \Staff {
          %\set midiInstrument = "viola"
        }
      }
    }
  }
}