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
  systems-per-page = 3
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
  
  \pageBreak
  
  es'4( \tuplet 3/2 { c8) d8 es8 } d8 b8 g4 |
  es8[( f8]) g8[( as8]) g8[( f8]) es4 |
  es'4( \tuplet 3/2 { c8[ d8 es8] } d8 b8) g4 |
  es8[( f8 g8 as8] g8) f8 es4 |
  es8[( f8 g8 as8] g8) f8 es4 |
  es8[( f8 g8]) as8 b8( es4.~ |
  es8) r8\fermata as,8[( g8] f4~ f8.[ es16])
  \time 2/4
  es4.( e8)
  \numericTimeSignature
  \time 4/4
  \bar "||"
  \key f \major
  
  f8[( g8 a8 b8]) a8[( g8]) f4 |
  a8[( c8)] b8 a8 d2 |
  g,8[( b8]) a8 b8 c2 |
  f,8[( g8]) a8 b8 a8[( g8]) f4 |
  f8[( g8]) a8 b8 \tuplet 6/4 { a16[( b16 a16 g16 a16 g16]) } f4 |
  f8[( g8]) a8[( b8]) c8[( f8 b,8 a8]) |
  g4~ g8. f16 f2 |
  
  f8[( g8 a8 b8]) c8 f4.~ |
  f8 r8\fermata b,8[( a8]) g4~ g8. f16
  
  f8[( g8 a8 b8] a8[ g8] f4~ |
  f1)\fermata
  
  \bar "|."
  
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
  
  g4( \tuplet 3/2 { g8) g8 g8 } g8 g4 es8 |
  c4 d4 d4. c8 |
  g'4.( ges8 f4.) e8 |
  c4( d4) es4. d16[( des16]) |
  c4( d4) d4. c8 |
  c4( d8) d8 es8( b'4.~ |
  b8) r8\fermata r4 c,4( d4)
  c8[( d8] b8[ h8])
  
  \key f \major
  
  c4( cis8[ d8]) e4 f8[( e8]) |
  es8[( f8]) g8 f16[( es16]) d8[( fis16 a16] g16[ f16 e16 d16]) |
  cis4 cis8 cis8 c8[( e16 g16] f16[ e16 d16 c16]) |
  \tuplet 3/2 { d8[( c8 d8]) } \tuplet 3/2 { e8[( d8]) e8 } f4. e16[( es16]) |
  d4 e8 e8 e4. d8 |
  \tuplet 3/2 { d8[( c8 d8]) } \tuplet 3/2 { e8[( d8 e8]) } \tuplet 3/2 { f8[( g8 f8]~ } \tuplet 3/2 { f8[ g8 f8]) } |
  d4 e4 d8[( e8] c4) |
  
  d4( e4) f8 c'4.~ |
  c8 r8\fermata r4 d,4 e8 e8 |
  
  f1(
  des2 c2)\fermata
  
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
  
  g8[( as8]) a8 b8 d8 d4 des8 |
  es8[( es,8]) f4 g4 g4 |
  c2( b4) b4 |
  es,4( f4) g4 g4 |
  es4( f4) as4 g4 |
  es4( f8) f8 as2( |
  as8) r8\fermata r4 g2 |
  c4.( b8)
  
  \key f \major
  
  a4( b4) b4 a4 |
  g8[( a32 b32 c32 d32]) es8 es8 fis,4( g4) |
  g4 g8 g16[( f16]) e4( a4) |
  f4 g8 g8 a4 a4 |
  f4 c'8 b8 \tuplet 6/4 { a16[( b a g a g]) } f4 |
  f4 g4 b2 |
  b4 b4 b8[( c8] a4) |
  
  f4( g4) b8 b4.~ |
  b8 r8\fermata r4 b4 b8 b8 |
  
  c2( h4 b4
  as2 a2)\fermata
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
  
  c4 c8 c8 b8 b4 a8 |
  as4 b4 h4( c8.) b16 |
  a4( d4 g,4) c4 |
  as4( b4) c4 b4 |
  as4( b4) h4 c8.[( b16])
  as4( b8) b8 c2~ |
  c8 r8\fermata r4 b2 |
  es4.( d8)
  
  \key f \major
  
  c2 c4 c4 |
  c4 f8 f8 b,2 |
  b4 b8 b8 a4( d4) |
  b4 c8 c8 d4 c4 |
  b4 c8 c8 cis4 d8.[( c16]) |
  b4 c4 d4( des4) |
  c4 c4 <f \parenthesize f,>2 |
  
  b,4( c4) d8 d4.~ |
  d8 r8\fermata r4 c4 c8 c8 |
  
  f4( e4 d4 des4
  f1)\fermata
}

LyricsLaudamus = \lyricmode {
  Lau -- da -- mus,
  lau -- da -- mus    te,
  lau -- da -- mus    te.
  Be -- ne -- di -- ci -- mus,
  be -- ne -- di -- ci -- mus,
  be -- ne -- di -- ci -- mus  te.
  
  \skip 1 \skip 1
  
  A -- do -- ra -- mus,
  a -- do -- ra -- mus te,
  a -- do -- ra -- mus te.
  Glo -- ri -- fi -- ca -- mus,
  glo -- ri -- fi -- ca -- mus,
  glo -- ri -- fi -- ca -- mus te.
  
  \skip 1 \skip 1
  
  Gra -- ti -- as a -- gi -- mus ti -- bi
  prop -- ter ma -- gnam
  glo -- ri -- am,
  glo -- ri -- am,
  glo -- ri -- am tu -- am.
  
  Lau -- da -- mus,
  lau -- da -- mus    te,
  lau -- da -- mus    te.
  
  Glo -- ri -- fi -- ca -- mus,
  glo -- ri -- fi -- ca -- mus,
  be -- ne -- di -- ci -- mus  te.
  
  Lau -- da -- mus,
  lau -- da -- mus    te.
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