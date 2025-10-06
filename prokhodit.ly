\version "2.24"

\language "deutsch"

taglineLanguage = "russian"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"

\layout {
  \context {
    \Staff {
      \set autoBeaming=##f
      \dynamicUp
    }
  }
}

\header {
  title = "Проходит лето"
  composer = "Виктор Сергеевич Калинников (1870-1927)"
  poet = "Слова Н. А. Соколова"
}

Dynamics = {
  \time 2/4
  \tempo "Andante sostenuto"
  \partial 4 s4\p |
  s2 s2 s2 s2 s2 s2 s2 s2 s2\< s2 s16 s16\! s4. s2 s2\> s2 s2 s2\! s2
  \time 3/4
  \tempo "Più mosso"
  s4\p s8 \once\override DynamicTextSpanner.style = #'none s8\cresc s4
  \time 2/4
  s2 s2 s2
  
  s2\!\< s2 s2 s4 \tuplet 3/2 { s8 s8 s8\! } s2\f s4 s8 s8\p
  \tempo "Tempo I"
  s2 s2 s2
  \tempo "meno mosso"
  s2\> s2
  \tempo "rit. molto"
  s2 s2 s2\! \bar "|."
}

PartSpageA = \relative c'' {
  \partial 4 g4 |
  \repeat unfold 14 g2 g2~ |
  \tuplet 3/2 { g4 g8 } \tuplet 3/2 { g8 g8 g8 } |
  g4 g8\fermata
}

PartApageA = \relative c' {
  \partial 4 r4 |
  r8 es8 es8 f8 |
  d4 d4 |
  r8 d8 \tuplet 3/2 { f8 es8 d8 } |
  es4 es4 |
  r8 d8 d8 es8 |
  c4 c4 |
  r8 b8 \tuplet 3/2 { d8 c8 b8 } |
  c4 c4 |
  r8 f8 f8 g8 |
  e4 e4 |
  r8 es8 \tuplet 3/2 { g8 f8 es8 } |
  d4 d4 |
  r8 d8 d8 es8 |
  c4 c4 |
  r8 d8 \tuplet 3/2 { f8 es8 b8 } |
  es4 es4~ |
  es4.\fermata
}

PartAApageA = \relative c' {
  \partial 4 r4 |
  r8 es8 es8 f8 |
  d4 d4 |
  r8 d8 \tuplet 3/2 { f8 es8 d8 } |
  es4 es4 |
  r8 d8 d8 es8 |
  c4 c4 |
  r8 b8 \tuplet 3/2 { d8 c8 b8 } |
  c4 c4 |
  r8 f8 f8 g8 |
  e4 e4 |
  r8 es8 \tuplet 3/2 { g8 f8 es8 } |
  d4 d4 |
  r8 d8 d8 es8 |
  c4 c4 |
  r8 d8 \tuplet 3/2 { f8 es8 b8 } |
  b4 b4~ |
  b4.\fermata
}

PartTpageA = \relative c' {
  \partial 4 g4 |
  \repeat unfold 14 g2 g2~ |
  \tuplet 3/2 { g4 g8 } \tuplet 3/2 { g8 g8 g8 } |
  g4 g8\fermata
}

PartBpageA = \relative c {
  \partial 4 r8 g8 |
  a4 a4 |
  b4 b8 b8 |
  h4 \tuplet 3/2 { h4 h8 } |
  c4 c8 c8 |
  d4 d4 |
  es4 es8 es8 |
  d4 \tuplet 3/2 { d4 d8 } |
  c4 c8 c8 |
  des4 des4 |
  c4 c8 c8 |
  h4 \tuplet 3/2 { h4 h8 } |
  b4 b8 b8 |
  h4 b4 |
  a4 a8 a8 |
  b4 \tuplet 3/2 { c4 c8 } |
  cis4 cis4~ |
  cis4.\fermata
}

PartSpageB = \relative c' {
  r8 |
  r8 d8 g4. fis8 a4 \tuplet 3/2 { g8( a8) b8 } |
  c4 b8 a8 |
  b4 g8 g8 |
  c4. h8 |
  d4 \tuplet 3/2 { c8( d8) es8 } |
  f4 es8 d8 |
  es4 \tuplet 3/2 { es8( f8) g8 } |
  a!4. g8 |
  f8 es8 r8\fermata b8 |
  d2 d4. d8 |
  d4 g,4 |
  g2 |
  g2 |
  g4~ \tuplet 3/2 { g4 g8 } |
  g2 |
  g2\fermata
}

PartApageB = \relative c' {
  r8 |
  r4. d8 es8 es8 |
  d4 \tuplet 3/2 { d4 f8 } |
  es4 es8 es8 |
  d4 d4 |
  r8 g8 as8 as8 |
  g4 \tuplet 3/2 { g4 b8 } |
  as4 as8 as8 |
  g4 \tuplet 3/2 { es8( f8) es8 } |
  es4. es8 |
  b8 b8 r4\fermata |
  b'2 b4. b8 |
  b4 g4 |
  r8 d8 d8 d8 |
  es4 es4 |
  r8 << { es8 \tuplet 3/2 { f8 es8 b8 } } { s8.\< s8\!\> s16\! } >> |
  d2 d2\fermata
}

PartAApageB = \relative c' {
  r8 |
  r4. b8 c8 c8 |
  b4 \tuplet 3/2 { b4 d8 }
  c4 c8 c8 |
  b4 b4 |
  r8 es8 f8 f8 |
  es4 \tuplet 3/2 { es4 g8 } |
  f4 f8 f8 |
  es4 \tuplet 3/2 { es8( f8) g8 } |
  a!4. g8 |
  f8 es8 r4\fermata |
  g2 |
  fis4. fis8 |
  g4 g4 |
  r2 |
  b,2 |
  b4( \tuplet 3/2 { a4) b8 }
  b2 b2\fermata |
}

PartTpageB = \relative c' {
  r8 |
  r4. g8 a8 a8 |
  b4 \tuplet 3/2 { g4 g8 }
  g4 fis8 fis8 |
  g4 g4 |
  r8 c8 d8 d8 |
  es4 \tuplet 3/2 { c4 c8 } |
  c4 h8 h8 |
  c4 \tuplet 3/2 { c4 c8 } |
  b4. b8 |
  g8 g8 r8\fermata b8 |
  d2 c4. c8 |
  b4 g4 |
  g2 |
  g2 |
  g4( \tuplet 3/2 { g4) g8 } |
  g2 g2\fermata
}

PartBpageB = \relative c {
  cis8 |
  d2. d2 d2 d2 d2 d2 d2 d2
  c4. c8 |
  cis8 cis8 r4\fermata |
  d2 |
  d4. d8 |
  g4 g8 d8 |
  f4. f8 |
  es4 es8 b8 |
  des4 \tuplet 3/2 { c4 c8 }
  <g d'>2 <g d'>2 \fermata
}

LyrPageΑ = \lyricmode {
  Про -- хо -- дит    ле -- то,
  и    солн -- це    не    гре -- ет,
  и,   в_снег   о -- де -- та,
  зем -- ля   це -- пе -- не -- ет,
  и    мрак    уг -- рю -- мый
  пу -- га -- ет    нам    о -- чи,
  тре -- во -- жит    ду -- мы
  без -- мол -- ви -- е    но -- чи.
}

LyrPedalΑ = \lyricmode {
  Про -- хо -- дит    ле -- то,
  зем -- ля   це -- пе -- не -- ет,
  тре -- во -- жит    ду -- мы
  без -- мол -- ви -- е    но -- чи.
}

LyrPageB = \lyricmode {
  Про -- хо -- дят    грё -- зы
  о    друж -- бе,    о   сча -- стье,
  про -- хо -- дят    грё -- зы
  о    друж -- бе,    о   сча -- стье,
  и  льют -- ся   слё -- зы,
}

LyrPedalB = \lyricmode {
  Про -- хо -- дят    грё -- зы
  о   сча -- стье,
  и  льют -- ся   слё -- зы,
}

LyrSPageC = \lyricmode {
  и  нет   к_ним  у -- ча -- стья,
  и  нет   к_ним  у -- ча -- стья.
}

LyrAPageC = \lyricmode {
  нет   к_ним  у -- ча -- стья,
  и  льют -- ся   слё -- зы,
  и  нет   к_ним  у -- ча -- стья.
}

LyrAAPageC = \lyricmode {
  нет   к_ним  у -- ча -- стья,
  нет   к_ним  у -- ча -- стья.
}

\book {
  \score {
    <<      
      \new ChoirStaff <<
        \new Dynamics { \Dynamics }
        \new Staff = "S" <<
          \clef "treble"
          \key g \minor
          \new Voice = "PartS" { \PartSpageA \PartSpageB }
        >>
        \new Lyrics \lyricsto "PartS" {
          \LyrPedalΑ
          \LyrPageB
          \LyrSPageC
        }
        \new StaffGroup \with {
          systemStartDelimiter = #'SystemStartSquare
        } <<
          \new Staff = "A" <<
            \clef "treble"
            \key g \minor
            \new Voice = "PartA" { \PartApageA \PartApageB }
          >>
          \new Lyrics \lyricsto "PartA" {
            \LyrPageΑ
            \LyrPageB
            \LyrAPageC
          }
          \new Staff = "AA" <<
            \clef "treble"
            \key g \minor
            \new Voice = "PartAA" { \PartAApageA \PartAApageB }
          >>
          \new Lyrics \lyricsto "PartAA" {
            \LyrPageΑ
            \LyrPageB
            \LyrAAPageC
          }
        >>
        \new Staff = "T" <<
          \clef "treble_8"
          \key g \minor
          \new Voice = "PartT" { \PartTpageA \PartTpageB }
        >>
        \new Lyrics \lyricsto "PartT" {
          \LyrPedalΑ
          \LyrPageB
          \LyrSPageC
        }
        \new Staff = "B" <<
          \clef "bass"
          \key g \minor
          \new Voice = "PartB" { \PartBpageA \PartBpageB }
        >>
        \new Lyrics \lyricsto "PartB" {
          \LyrPageΑ
          \LyrPedalB
          \LyrAPageC
        }
      >>
    >>
    \layout {
      #(layout-set-staff-size 17) % Sets global staff size to 10
    }
    \midi {
      \tempo 4 = 50
      \context {
        \Staff {
          %\set midiInstrument = "viola"
        }
        
      }
      \context {
        \Staff
        \remove "Staff_performer"
      }
      \context {
        \Voice
        \consists "Staff_performer"
      }
    }
  }
  \paper {
    system-count = 6
  }
}


\book {
  \bookOutputSuffix "f"
  \score {
    <<      
      \new ChoirStaff <<
        \new Dynamics { \Dynamics }
        \new Staff = "S" <<
          \clef "treble"
          \key f \minor
          \new Voice = "PartS" { \transpose g f { \PartSpageA \PartSpageB } }
        >>
        \new Lyrics \lyricsto "PartS" {
          \LyrPedalΑ
          \LyrPageB
          \LyrSPageC
        }
        \new StaffGroup \with {
          systemStartDelimiter = #'SystemStartSquare
        } <<
          \new Staff = "A" <<
            \clef "treble"
            \key f \minor
            \new Voice = "PartA" { \transpose g f { \PartApageA \PartApageB } }
          >>
          \new Lyrics \lyricsto "PartA" {
            \LyrPageΑ
            \LyrPageB
            \LyrAPageC
          }
          \new Staff = "AA" <<
            \clef "treble"
            \key f \minor
            \new Voice = "PartAA" { \transpose g f { \PartAApageA \PartAApageB } }
          >>
          \new Lyrics \lyricsto "PartAA" {
            \LyrPageΑ
            \LyrPageB
            \LyrAAPageC
          }
        >>
        \new Staff = "T" <<
          \clef "treble_8"
          \key f \minor
          \new Voice = "PartT" { \transpose g f { \PartTpageA \PartTpageB } }
        >>
        \new Lyrics \lyricsto "PartT" {
          \LyrPedalΑ
          \LyrPageB
          \LyrSPageC
        }
        \new Staff = "B" <<
          \clef "bass"
          \key f \minor
          \new Voice = "PartB" { \transpose g f { \PartBpageA \PartBpageB } }
        >>
        \new Lyrics \lyricsto "PartB" {
          \LyrPageΑ
          \LyrPedalB
          \LyrAPageC
        }
      >>
    >>
    \layout {
      #(layout-set-staff-size 17)
    }
    \midi {
      \tempo 4 = 40
      \context {
        \Staff {
          %\set midiInstrument = "viola"
        }
        
      }
      \context {
        \Staff
        \remove "Staff_performer"
      }
      \context {
        \Voice
        \consists "Staff_performer"
      }
    }
  }
  \paper {
    system-count = 6
  }
}