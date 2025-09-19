\version "2.24.0"

\language "deutsch"

\layout {  
  \context {
    \Score
    \accidentalStyle Score.choral
  }
  \context {
    \Staff
    \override VerticalAxisGroup.staff-staff-spacing.basic-distance = #12
  }
}

\header {
  title = \markup \center-column { \vspace #3 "Živijó" }
  subsubtitle = \markup \center-column { "Československý popěvek" \vspace #1.5 }
  %date = "2019"
  %composer = "М. Буряков"
  %tagline = \markup {\fontsize #-2 {"Набрано с помощью LilyPond" $(lilypond-version)}}
  tagline = \markup {\fontsize #-3 {"aranžování M. Buřakov"}}
}

PartS = \relative c' {
  \time 3/4 \key c \major
  c8. c16 c4 r4 |
  e8. e16 e4 r4 |
  g8. g16 g4 r4 |
  c8. c16 c4\fermata \breathe
}
PartSC = \relative c' {
  a'8 g8 | \break
  f4 f4 g8 f8 |
  e4 e4 f8 e8 |
  \time 2/4
  d4 c8( d8) |
  \numericTimeSignature
  \time 4/4
  e8. e16 e4 r4 a8 g8 |
  f4 f4 r2 |
  r4 g8 a8 b8 b8 d8[ c8] |
  b4 b4 r4 c8 b8 |
  a4 a4 c4( b8) a8 |
  g4. g8 g8( a4) g8 |
  \override TextSpanner.bound-details.left.text = "rit."
  f8 f8\startTextSpan g8 f8 e8( f16 e16) d4*2/3 \hide r8*2/3\stopTextSpan |
  \break
  
}
PartSF = \relative c' {
  \time 3/4
  \tempo "a tempo"
  c8. c16 c4 r4 |
  e8. e16 e4 r4 |
  g8. g16 g4 r4 |
  c4. c8 c4\fermata |
  \bar "|."
}

PartAA = \relative c' {
  \time 3/4 \key c \major
  c8. c16 c4 r4 |
  e8. e16 e4 r4 |
  f8. f16 f4 r4 |
  e8. e16 e4\fermata \breathe
}
PartAAC = \relative c' {
  f8 e8 |
  d4 d4 e8 d8 |
  c4 c4 d8 c8 |
  \time 2/4
  h4 c8( d8) |
  \time 4/4
  c8. c16 c4 r4 c8 b8 |
  a4 a4 r4 g'8 f8 |
  e4 e4 r4 f8 e8 |
  d4. d8 c8 d8 e8[ d8] |
  c8( a'4) g8 fis8( e8 d8) c8 |
  b8( d8 g8) f8 e8( a,8 h8) cis8 |
  d8 d8 d8 d8 \partCombineApart c4 h4 \partCombineAutomatic |
}
PartAAF = \relative c' {
  \time 3/4
  c8. c16 c4 r4 |
  e8. e16 e4 r4 |
  dis8. dis16 dis4 r4 |
  \partCombineApart
  e8[( d8 e8]) f8 e4\fermata |
  \bar "|."
}

PartA = \relative c' {
  \time 3/4 \key c \major
  c8. c16 c4 r4 |
  c8. c16 c4 r4 |
  d8. d16 d4 r4 |
  c8. c16 c4\fermata \breathe
}
PartAC = \relative c' {
  f8 e8 |
  d4 d4 e8 d8 |
  c4 c4 d8 c8 |
  \time 2/4
  \partCombineApart h4 a8( h8) |
  \numericTimeSignature
  \time 4/4
  c8. h16 b4 \partCombineAutomatic r4 c8 b8 |\pageBreak
  a4 a4 r4 g'8 f8 |
  e4 e4 r4 f8 e8 |
  d4. d8 c8 d8 e8 d8 |
  c8( a'4) g8 fis8( e8 d8) c8 |
  b8( d8 g8) f8 e8( a,8 h8) cis8 |
  d8 d8 d8 d8 c4 a4 |
}
PartAF = \relative c' {
  \time 3/4
  c8. c16 c4 r4 |
  c8. c16 c4 r4 |
  h8. h16 h4 r4 |
  c4. c8 c4\fermata |
  \bar "|."
}

PartT = \relative c' {
  \time 3/4 \key c \major
  c8. c16 c4 r4 |
  h8. h16 h4 r4 |
  a8. a16 a4 r4 |
  g8. g16 g4\fermata \breathe
}
PartTC = \relative c' {
  r4 |
  r8 g8 h4 r4
  r8 a8 g4 f8 fis8
  \time 2/4
  g4 a8( g8) |
  \numericTimeSignature
  \time 4/4
  g8. g16 g4 r4 r4 |
  r4 c8 b8 a8 a8 b8[ a8] |
  g4 c4 r4 r4 |
  g8( a8 g8) f8 e8( d8) c4 |
  r4 r4 a'4. fis8 |
  g4. g8 a4. a8 |
  a4 g4 g16 a16 a8 g4 |
}
PartTF = \relative c' {
  \time 3/4
  c8. c16 c4 r4 |
  as8. as16 as4 r4 |
  f8. f16 f4 r4 |
  g4. a!8 g4\fermata |
  \bar "|."
}

PartB = \relative c {
  \time 3/4 \key c \major
  c8. c16 c4 r4 |
  c8. c16 c4 r4 |
  c8. c16 c4 r4 |
  c8. c16 c4\fermata \breathe
}
PartBC = \relative c {
  r4 |
  g4 r4 h4 |
  c4 c4 a8 a8 |
  \time 2/4
  g8( f'8) e8( d8) |
  \numericTimeSignature
  \time 4/4
  c8. c16 c4 r4 r4 |
  f4 c4 f8 f8 r4 |
  c4( e8) f8 g8 g8 r4 |
  r2 r4 g8 g8 |
  f8 c8 f8[ es8] d2( |
  d4) b4 a4. a8 |
  d8 c!8 h8 h8 c8 g'8 \tuplet 3/2 { f8-> e8-> d8-> } |
}
PartBF = \relative c {
  \time 3/4
  c8. c16 c4 r4 |
  c8. c16 c4 r4 |
  des8. des16 des4 r4 |
  c4. c8 c4\fermata |
  \bar "|."
}

words = \lyricmode {  
  Ži -- vi -- jó,
  ži -- vi -- jó,
  ži -- vi -- jó,
  ži -- vi -- jó!
}
wordsSC = \lyricmode {
  Mno -- ga lje -- ta,
  mno -- ga lje -- ta,
  mno -- ga lje -- ta,
  ži -- vi -- jó!
  Mno -- ga lje -- ta,
  mno -- ga lje -- ta,
  mno -- ga lje -- ta,
  zdra -- vi ži -- li,
  to jsme rá -- di,
  že jsme ta -- dy,
  že nás ta -- ___dy...
}
wordsAC = \lyricmode {
  Mno -- ga lje -- ta,
  mno -- ga lje -- ta,
  mno -- ga lje -- ta,
  ži -- vi -- jó!
  Mno -- ga lje -- ta,
  zdra -- vi by -- li, 
  mno -- ga mno -- ga lje -- ta,
  zdra -- vi ži -- li,
  to jsme rá -- di,
  že jsme ta -- dy,
  že nás ta -- ___dy...
}
wordsTC = \lyricmode {
  tm tm
  tm tm
  mno -- ga lje -- ta,
  ži -- vi -- jó!
  Mno -- ga lje -- ta,
  zdra -- vi by -- li,
  mno -- ga lje -- ta,
  to jsme rá -- di,
  že jsme ta -- dy,
  mno -- ga lje -- ta,  
}
wordsBC = \lyricmode {
  Mno -- ga lje -- ta,
  mno -- ga lje -- ta,
  ži -- vi -- jó!
  Mno -- ga lje -- ta,
  mno -- ga lje -- ta,
  zdra -- vi ži -- li,
  mno -- ga lje -- ta,
  že jsme ta -- dy,
  že nás ta -- _dy...
  ži -- vi -- jó.
}
wordsF = \lyricmode {  
  ži -- vi -- jó,
  ži -- vi -- jó,
  ži -- vi -- jó,
  ži -- vi -- jó!
}

\book {
  \score {
    \new ChoirStaff <<
      \new Staff = "upper" <<
        \set Staff.instrumentName = "S."
        \clef treble
        \new Voice = "soprano" {
          \oneVoice
          << \PartS >>
          << \PartSC >>
          << \PartSF >>
        }
        \new Lyrics \lyricsto "soprano" {
          \words \wordsSC \wordsF
        }
      >>
      \new Staff = "lower" <<
        \set Staff.instrumentName =  \markup {
          \column { "A1."
            \line { "A2." }
          }
        }
        \clef treble
        \new NullVoice = "alto" {
          << \PartAA >>
          << \PartAAC >>
          << \PartAAF >>
        }
        \new Lyrics {
          \lyricsto "alto" {
            \words \wordsAC \wordsF
          }
        }
        \set Staff.aDueText = #""        
        \partCombine {
          << \PartAA >>
          << \PartAAC >>
          << \PartAAF >>
        } {          
          << \PartA >>
          << \PartAC >>
          << \PartAF >>
        }        
      >>
      \new Staff = "tenor" <<
        \set Staff.instrumentName = "T."
        \clef "treble_8"     
        \new Voice = "tenor" {
          << \PartT >>
          << \PartTC >>
          << \PartTF >>
        }
        \new Lyrics {
          \lyricsto "tenor" {
            \words \wordsTC \wordsF
          }
        }        
      >>
      \new Staff = "bass" <<
        \set Staff.instrumentName = "B."
        \clef bass             
        \new Voice = "bass" {
          << \PartB >>
          << \PartBC >>
          << \PartBF >>
        }
        \new Lyrics \lyricsto "bass" {
          \words \wordsBC \wordsF
        }
      >>
    >>
    \layout {}
    \midi {}
  }

  \paper {
    ragged-bottom = ##t
    system-system-spacing.basic-distance = 17
  }
}

\book {
  \bookOutputSuffix "d"
  \score {
    \new ChoirStaff <<
      \new Staff = "upper" <<
        \set Staff.instrumentName = "S."
        \clef treble
        \new Voice = "soprano" {
          \transpose c d {
            \PartS
            \PartSC
            \PartSF
          }
        }
        \new Lyrics \lyricsto "soprano" {
          \words \wordsSC \wordsF
        }
      >>
      \new Staff = "lower" <<
        \set Staff.instrumentName =  \markup {
          \column { "A1."
            \line { "A2." }
          }
        }
        \clef treble
        \new NullVoice = "alto" {
          \transpose c d {
            \PartAA
            \PartAAC
            \PartAAF
          }
        }
        \new Lyrics {
          \lyricsto "alto" {
            \words \wordsAC \wordsF
          }
        }
        \set Staff.aDueText = #""        
        \partCombine {
          \transpose c d {
            \PartAA
            \PartAAC
            \PartAAF
          }
        } {
          \transpose c d {
            \PartA
            \PartAC
            \PartAF
          }
        }        
      >>
      \new Staff = "tenor" <<
        \set Staff.instrumentName = "T."
        \clef "treble_8"     
        \new Voice = "tenor" {
          \transpose c d {
            \PartT
            \PartTC
            \PartTF
          }
        }
        \new Lyrics {
          \lyricsto "tenor" {
            \words \wordsTC \wordsF
          }
        }        
      >>
      \new Staff = "bass" <<
        \set Staff.instrumentName = "B."
        \clef bass             
        \new Voice = "bass" {
          \transpose c d {
            \PartB
            \PartBC
            \PartBF
          }
        }
        \new Lyrics \lyricsto "bass" {
          \words \wordsBC \wordsF
        }
      >>
    >>
    \layout {}
    \midi {}
  }

  \paper {
    ragged-bottom = ##t
    system-system-spacing.basic-distance = 17
  }
}