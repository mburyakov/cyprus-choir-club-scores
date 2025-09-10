\version "2.24"

\language "deutsch"

taglineLanguage = "latin"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"

\include "include/cyprus-logo.ly"

\layout {
  \context {
    \Score
    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16)
  }
}

\paper {
  system-count = #2
  system-system-spacing =
  #'((basic-distance . 8)
     (minimum-distance . 4)
     (padding . 8)
     (stretchability . 60)) % defaults: 12, 8, 1, 60
}

\header {
  title = \markup { "Jubilate Deo" \vspace #2 }
  composer = "Michael Praetorius (1571–1621)"
}

PartS = \relative c'' {
  a2 h2 |
  cis4 a4 a4 gis4 |
  a4 fis4 e4. d8 |
  cis4( d4) h2 |
  a2 e'4 e4 |
  a,1
}

Lyr = \lyricmode {
    Ju -- bi -- la -- te    De -- o,
    ju -- bi -- la -- te    De -- o,
    Al -- le -- lu -- ia.
}

onelinescore = \score {
  <<      
    \new StaffGroup <<
      \override StaffGroup.SystemStartBracket.collapse-height = 4
      \override Score.SystemStartBar.collapse-height = 4
      \new Staff = "S" <<
          \override Score.BarNumber.break-visibility = ##(#f #t #t)
          \override Score.BarNumber.font-size = 0
          \override Score.BarNumber.stencil
            = #(make-stencil-circler 0.1 0.4 ly:text-interface::print)
        \numericTimeSignature
        \time 4/4
        \clef "treble"
        \key a \major
        \new Voice = "PartS" {
          \PartS
          \bar "|."
        }
        \new Lyrics \lyricsto "PartS" {
          \Lyr
        }
      >>
    >>
  >>
}

\book {
  \markup \vspace #0.7
  \onelinescore
}

\book {
  \bookOutputSuffix "full"
  
  \bookpart {
    \markup \vspace #0.7
    \onelinescore
  }
  
  \bookpart {
    \markup \vspace #0.7
    
    \score {
      <<      
        \new StaffGroup <<
          \numericTimeSignature
          \time 4/4
          \new Staff = "A" <<
            \clef "treble"
            \key a \major
            \new Voice = "PartA" {
              \PartS
              R1 R1 R1
              \bar "|."
            }
            \new Lyrics \lyricsto "PartA" {
              \Lyr
            }
          >>
          \new Staff = "D" <<
            \clef "treble"
            \key a \major
            \new Voice = "PartD" {
              R1 R1 R1
              \PartS
            }
            \new Lyrics \lyricsto "PartD" {
              \Lyr
            }
          >>
          \new Staff = "B" <<
            \clef "treble"
            \key a \major
            \new Voice = "PartB" {
              R1
              \PartS
              R1 R1
            }
            \new Lyrics \lyricsto "PartB" {
              \Lyr
            }
          >>
          \new Staff = "C" <<
            \clef "treble"
            \key a \major
            \new Voice = "PartC" {
              R1 R1
              \PartS
              R1
            }
            \new Lyrics \lyricsto "PartC" {
              \Lyr
            }
          >>
        >>
      >>
    }
  }
}