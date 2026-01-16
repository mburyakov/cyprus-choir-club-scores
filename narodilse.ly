\version "2.24"

\language "deutsch"

taglineLanguage = "czech"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
%\include "include/choir-setup.ly"
%\include "include/lyrics-not-affecting-layout.ly"

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
  title = \markup \center-column { "Narodil se Kristus Pán" }
  subsubtitle = \markup \center-column { "Vánoční píseň" \vspace #0.5 }
  copyright = \markup {\fontsize #-3 {"aranžování M. Buřakov"}}
}

PartS = \relative d' {
  f4 f8( g8) a4 h4 |
  \tag #`d { \once\slurDashed c4( c4) } \tag #`f { c4 c4 } \tag #`r { c2 } c2 |
  h4 c4 d2 |
  c2 r2 |
  c4 c4 b4 b4 |
  \tag #`d { \once\slurDashed a4( a4) } \tag #`f { a4 a4 } \tag #`r { a2 } g2 |
  a4 b4 a4( g4) |
  f1 |
  a4 g4 a4 b4 |
  c2 f,2 |
  a4 g4 a4 b4 |
  c2 f,2 |
  f2 d'2 |
  c4 b4 a4( g4) |
  f2 r2
}
PartA = \relative d' {
  c4 c4 f4 f4 |
  \tag #`d { \once\slurDashed e4( f4) } \tag #`f { e4 f4 } \tag #`r { e4( f4) } e2 |
  g4 g g4( f4) |
  e2 r2 |
  f4 a4 g4 e4 |
  \tag #`d { \once\slurDashed f4( f4) } \tag #`f { f4 f4 } \tag #`r { f2 } g4 d4~ |
  d4 des4 c2 |
  f1 |
  f4 e4 f4 d4 |
  c2 f2 |
  f4 e4 f4 d4 |
  c2 f2 |
  f2 f2 |
  f4 f4 e8( d8 c4) |
  c2 r2 
}
PartAA = \relative d' {
  a4 a8( b8) c4 d4 |
  c4 a4 c4 e4 |
  d4 c4 h2 |
  c2 r2 |
  c2. c4 |
  \tag #`d { \once\slurDashed c4( c4) } \tag #`f { c4 c4 } \tag #`r { c2 } b2 |
  r4 r4 c4( b4) |
  a4 b4 a2 |
  R1 |
  e'4 g4 f4 d4 |
  c2 f2 |
  e4 g4 f4 d4 |
  c4 a4
  \tag #`d \tag #`r { \once\slurDashed b4( b4) } \tag #`f { b2 } |
  a4 b4 c4( b4) |
  a2 r2
}
PartT = \relative d' {
  a4 a8( b8) c4 d4 |
  c4 a4 c4 e4 |
  d4 c4 h2 |
  c2 r2 |
  f,4 f4 g4 g4 |
  \tag #`d { \once\slurDashed a4( a4) } \tag #`f { a4 a4 } \tag #`r { a2 } b2 |
  r4 r4 c4( b4) |
  a4 b4 a2 |
  R1 |
  <<
    {
      e'4 g4 f4 d4 |
      c2 f,2 |
      e'4 g4 f4 d4 |
      c4 a4
    }
    \tag #`s { \new CueVoice {
      %\hide Stem
      \voiceOne \override NoteColumn.force-hshift = #1
      \parenthesize c4 \parenthesize c4 \parenthesize c4 \parenthesize c4
      s1
      \parenthesize c4 \parenthesize c4 \parenthesize c4 \parenthesize c4
      \parenthesize a4
    } }
  >>

  %<<
    %\new CueVoice { \repeat unfold 4 { \once\voiceTwo c'4 } \once\voiceTwo a4 \once\voiceTwo a4 }
  %  { \once\voiceOne e'4 \once\voiceOne g4 \once\voiceOne f4 \once\voiceOne d4 | \once\voiceOne c4 \once \override NoteColumn.force-hshift = #-1 \once\voiceOne a4 }
  %>>
  \tag #`d \tag #`r { \once\slurDashed b4( b4) } \tag #`f { b2 } |
  a4 b4 c4( b4) |
  a2 r2
}
PartB = \relative d {
  f4 f8( e8) d4 g4 |
  \tag #`d { \once\slurDashed c,4( c4) } \tag #`f { c4 c4 } \tag #`r { c2 } c2 |
  g'8( f8) e4 d4 g4 |
  c4 g4 e4 c4 |  
  r4 c4 r4 c4 |
  r4 c4 r4 c4 |
  f4 e2 e4 |
  f4 f4 f2 |
  R1 |
  g4 b4 a4 f4 |
  c2 f2 |
  g4 b4 a4 f4 |
  c4 c4 \tag #`d \tag #`r { \once\slurDashed b4( b4) } \tag #`f { b2 } |
  c4 d4 c2 |
  f2 r2
}

words = \lyricmode {
  Na -- ro -- dil    se
  \set ignoreMelismata = ##t
  Kris -- tus
  \unset ignoreMelismata
  Pán,
  ve -- sel -- me    se,
  z_rů -- že    kví -- tek
  \set ignoreMelismata = ##t
  vy -- kvet
  \unset ignoreMelismata
  nám,
  ra -- duj -- me    se.
  Z_ži -- vo -- ta    čis -- té -- ho,
  z_ro -- du    krá -- lov -- ské -- ho,
  nám,   nám    na -- ro -- dil    se.
}
wordsAA = \lyricmode {  
  Na -- ro -- dil    se    Pán  naš   Kris -- tus,
  ve -- sel -- me    se,
  z_rů -- že
  \set ignoreMelismata = ##t
  vy -- kvet
  \unset ignoreMelismata
  nám,
  ra -- duj -- me    se.
  Z_ži -- vo -- ta    čis -- té -- ho,
  z_ro -- du    krá -- lov -- ské -- ho,
  nám,   na -- ro -- dil    se.
}
wordsT = \lyricmode {  
  Na -- ro -- dil    se    Pán  naš   Kris -- tus,
  ve -- sel -- me    se,
  z_rů -- že    kví -- tek
  \set ignoreMelismata = ##t
  vy -- kvet
  \unset ignoreMelismata
  nám,
  ra -- duj -- me    se.
  Z_ži -- vo -- ta    čis -- té -- ho,
  z_ro -- du    krá -- lov -- ské -- ho,
  nám,   na -- ro -- dil    se.
}
wordsB = \lyricmode {  
  Na -- ro -- dil    se
  \set ignoreMelismata = ##t
  Kris -- tus
  \unset ignoreMelismata
  Pán,
  ve -- sel -- me    se,   ve -- sel -- me    se,
  z_rů -- že    kví -- tek...
  ra -- duj...  ra -- duj -- me    se.
  Z_ži -- vo -- ta    čis -- té -- ho,
  z_ro -- du    krá -- lov -- ské -- ho,
  nám,   na -- ro -- dil    se.
}

wordsSecond = \lyricmode {
  Ó mi -- los -- ti Bož -- ská,
  bu -- diž s_ná -- mi;
  dejž, ať zlost ďá -- bel -- ská
  nás ne -- má -- mí.
  Pro Sy -- na mi -- lé -- ho,
  nám na -- ro -- ze -- né -- ho,
  smi -- luj se nad ná -- mi!
}
wordsSecondAA = \lyricmode {
  Ó mi -- los -- ti Bož -- ská, Bož -- ská,
  bu -- diž s_ná -- mi;
  dejž, ďá -- bel -- ská
  nás ne -- má -- mí.
  Pro Sy -- na mi -- lé -- ho,
  nám na -- ro -- ze -- né -- ho,
  \set ignoreMelismata = ##t
  smi -- luj
  \unset ignoreMelismata
  se nad ná -- mi!
}
wordsSecondT = \lyricmode {
  Ó mi -- los -- ti Bož -- ská, Bož -- ská,
  bu -- diž s_ná -- mi;
  dejž, ať zlost ďá -- bel -- ská
  nás ne -- má -- mí.
  Pro Sy -- na mi -- lé -- ho,
  nám na -- ro -- ze -- né -- ho,
  \set ignoreMelismata = ##t
  smi -- luj
  \unset ignoreMelismata
  se nad ná -- mi!
}
wordsSecondB = \lyricmode {
  Ó mi -- los -- ti Bož -- ská,
  bu -- diž s_ná -- mi, bu -- diž s_ná -- mi;
  zlost ďá -- bel -- ská
  ne -- má -- mí, ne -- má -- mí.
  Pro Sy -- na mi -- lé -- ho,
  nám na -- ro -- ze -- né -- ho,
  \set ignoreMelismata = ##t
  smi -- luj
  \unset ignoreMelismata
  se nad ná -- mi!
}


wordsThird = \lyricmode {
  Dejž dob -- ré skon -- če -- ní,
  ó Je -- ží -- ši,
  věč -- né u -- tě -- še -- ní
  věr -- ných du -- ší!
  Přijď nám k_spo -- mo -- že -- ní,
  zbav nás za -- tra -- ce -- ní
  pro své na -- ro -- ze -- ní. 
}
wordsThirdAA = \lyricmode {
  Dejž dob -- ré, dob -- ré skon -- če -- ní,
  ó Je -- ží -- ši,
  u -- tě -- še -- ní věr -- ných du -- ší!
  Přijď nám k_spo -- mo -- že -- ní, zbav nás za -- tra -- ce -- ní
  pro na -- ro -- ze -- ní. 
}
wordsThirdT = \lyricmode {
  Dejž dob -- ré, dob -- ré skon -- če -- ní,
  ó Je -- ží -- ši,
  věč -- né u -- tě -- še -- ní věr -- ných du -- ší!
  Přijď nám k_spo -- mo -- že -- ní, zbav nás za -- tra -- ce -- ní
  pro na -- ro -- ze -- ní. 
}
wordsThirdB = \lyricmode {
  Dejž dob -- ré skon -- če -- ní,
  ó Je -- ží -- ši, ó Je -- ží -- ši,
  u -- tě -- še -- ní
  věr -- ných, věr -- ných du -- ší!
  Přijď nám k_spo -- mo -- že -- ní,
  zbav nás za -- tra -- ce -- ní
  pro na -- ro -- ze -- ní. 
}
wordsComplete = \markup {
  \column {
    \vspace #5
    \line {
      \hspace #4
      \column {
        \line {
          1.
          \column {
            \line { Narodil se Kristus Pán, veselme se, }
            \line { z růže  kvítek vykvet nám, radujme se. }
            \line { Z života čistého, }
            \line { z rodu královského, }
            \line { nám, nám narodil se. }
          }
        }
        \vspace #1
        \line {
          2.
          \column {
            \line { Jenž prorokován jest, veselme se, }
            \line { ten na svět poslán jest, radujme se. }
            \line { Z života čistého, }
            \line { z rodu královského, }
            \line { nám, nám narodil se. }
          }
        }
        \vspace #1
        \line {
          3.
          \column {
            \line { Člověčenství naše, veselme se, }
            \line { ráčil vzíti na se, radujme se. }
            \line { Z života čistého, }
            \line { z rodu královského, }
            \line { nám, nám narodil se. }
          }
        }
        \vspace #1
        \line {
          4.
          \column {
            \line { Goliáš oloupen, veselme se, }
            \line { člověk jest vykoupen, radujme se. }
            \line { Z života čistého, }
            \line { z rodu královského, }
            \line { nám, nám narodil se. }
          }
        }
      }
      \hspace #6
      \column {
        \line {
          5.
          \column {
            \line { Ó milosti Božská, budiž s námi; }
            \line { dejž, ať zlost ďábelská nás nemámí. }
            \line { Pro Syna milého, }
            \line { nám narozeného, }
            \line { smiluj se nad námi! }
          }
        }
        \vspace #1
        \line {
          6.
          \column {
            \line { Dejž dobré skončení, ó Ježíši, }
            \line { věčné utěšení věrných duší! }
            \line { Přijď nám k spomožení, }
            \line { zbav nás zatracení }
            \line { pro své narození. }
          }
        }
      }
    } 
  }
}

\book {
  \bookOutputSuffix "compact"
  \score {
    \new ChoirStaff <<
      \new Staff = "upper" <<
        \set Staff.instrumentName = \markup {
          \column { "S."
            \line { "A." }
          }
        }
        \clef treble
        \time 4/4 \key f \major
        \new Voice = "soprano" {
          \voiceOne
          \keepWithTag #'d \PartS
          \bar "|."
        }
        \new Voice = "alto" {
          \voiceTwo
          \keepWithTag #'d \PartA
          \bar "|."
        }        
        \new Lyrics \with { alignAboveContext = "upper" } {
          \lyricsto "alto" {
            \words
          }
        }
        \new Lyrics \with { alignAboveContext = "upper" } {
          \lyricsto "alto" {
            \wordsSecond
          }
        }
        \new Lyrics \with { alignAboveContext = "upper" } {
          \lyricsto "alto" {
            \wordsThird
          }
        }
      >>
      \new Staff = "lower" <<
        \set Staff.instrumentName = \markup {
          \column { "T."
            \line { "B." }
          }
        }
        \clef bass
        \time 4/4 \key f \major
        \new Voice = "tenor" {
          \voiceOne
          \keepWithTag #'d \PartT
          \bar "|."
        }
        \new Lyrics \with { alignAboveContext = "lower" } {
          \lyricsto "tenor" {
            \wordsT
          }
        }
        \new Lyrics \with { alignAboveContext = "lower" } {
          \lyricsto "tenor" {
            \wordsSecondT
          }
        }
        \new Lyrics \with { alignAboveContext = "lower" } {
          \lyricsto "tenor" {
            \wordsThirdT
          }
        }
        \new Voice = "bass" {
          \voiceTwo
          \keepWithTag #'d \PartB
          \bar "|."
        }
        \new Lyrics {
          \lyricsto "bass" {
            \wordsB
          }
        }
        \new Lyrics {
          \lyricsto "bass" {
            \wordsSecondB
          }
        }
        \new Lyrics {
          \lyricsto "bass" {
            \wordsThirdB
          }
        }
      >>
    >>
    \layout {}
    \midi {
      \tempo 4 = 120
    }
  }

  \paper {
    system-system-spacing.basic-distance = 32
    systems-per-page = #3
  }
}

\book {
  \score {
    \new ChoirStaff <<
      \new Staff = "S" <<
        \clef treble
        \time 4/4 \key f \major
        \new Voice = "soprano" {
          \keepWithTag #'f \PartS
          \bar "||"
          \keepWithTag #'r \PartS
          \bar "|."
        }
        \new Lyrics {
          \lyricsto "soprano" {
            \words
            \wordsSecond
          }
        }
        \new Lyrics {
          \lyricsto "soprano" {
            \repeat unfold 40 { \skip 1 }
            \wordsThird
          }
        }
      >>
      \new Staff = "A" <<
        \clef treble
        \time 4/4 \key f \major
        \new Voice = "alto" {
          \keepWithTag #'f \PartA
          \keepWithTag #'r \PartA
          \bar "|."
        }
        \new Lyrics {
          \lyricsto "alto" {
            \words
            \wordsSecond
          }
        }
        \new Lyrics {
          \lyricsto "alto" {
            \repeat unfold 40 { \skip 1 }
            \wordsThird
          }
        }
      >>
      \new Staff = "T" <<
        \clef "treble"
        \time 4/4 \key f \major
        \new Voice = "tenor" {
          \keepWithTag #'f \PartAA
          \keepWithTag #'r \PartAA
          \bar "|."
        }
        \new Lyrics {
          \lyricsto "tenor" {
            \wordsAA
            \wordsSecondAA
          }
        }
        \new Lyrics {
          \lyricsto "tenor" {
            \repeat unfold 38 { \skip 1 }
            \wordsThirdAA
          }
        }
      >>
      \new Staff = "B" <<
        \clef bass
        \time 4/4 \key f \major
        \new Voice = "bass" {
          \keepWithTag #'f \PartB
          \keepWithTag #'r  \PartB
          \bar "|."
        }
        \new Lyrics {
          \lyricsto "bass" {
            \wordsB
            \wordsSecondB
          }
        }
        \new Lyrics {
          \lyricsto "bass" {
            \repeat unfold 42 { \skip 1 }
            \wordsThirdB
          }
        }
      >>

    >>
    \layout {}
  }
  
  \pageBreak
  
  \wordsComplete

  \paper {
    system-system-spacing.basic-distance = 17
    systems-per-page = #3
  }
}

\book {
  \bookOutputSuffix "with-tenor"
  \score {
    \new ChoirStaff <<
      \new Staff = "S" <<
        \set Staff.instrumentName = "S"
        \clef treble
        \time 4/4 \key f \major
        \new Voice = "soprano" {
          \keepWithTag #'f \PartS
          \bar "||"
          \keepWithTag #'r \PartS
          \bar "|."
        }
        \new Lyrics {
          \lyricsto "soprano" {
            \words
            \wordsSecond
          }
        }
        \new Lyrics {
          \lyricsto "soprano" {
            \repeat unfold 40 { \skip 1 }
            \wordsThird
          }
        }
      >>
      \new Staff = "A" <<
        \set Staff.instrumentName = "A"
        \clef treble
        \time 4/4 \key f \major
        \new Voice = "alto" {
          \keepWithTag #'f \PartA
          \keepWithTag #'r \PartA
          \bar "|."
        }
        \new Lyrics {
          \lyricsto "alto" {
            \words
            \wordsSecond
          }
        }
        \new Lyrics {
          \lyricsto "alto" {
            \repeat unfold 40 { \skip 1 }
            \wordsThird
          }
        }
      >>
      \new Staff = "T" <<
        \set Staff.instrumentName = "T"
        \clef "treble_8"
        \time 4/4 \key f \major
        \new Voice = "tenor" {
          \keepWithTag #'(f s) \PartT
          \keepWithTag #'(r s) \PartT
          \bar "|."
        }
        \new Lyrics {
          \lyricsto "tenor" {
            \wordsT
            \wordsSecondT
          }
        }
        \new Lyrics {
          \lyricsto "tenor" {
            \repeat unfold 40 { \skip 1 }
            \wordsThirdT
          }
        }
      >>
      \new Staff = "B" <<
        \set Staff.instrumentName = "B"
        \clef bass
        \time 4/4 \key f \major
        \new Voice = "bass" {
          \keepWithTag #'f \PartB
          \keepWithTag #'r \PartB
          \bar "|."
        }
        \new Lyrics {
          \lyricsto "bass" {
            \wordsB
            \wordsSecondB
          }
        }
        \new Lyrics {
          \lyricsto "bass" {
            \repeat unfold 42 { \skip 1 }
            \wordsThirdB
          }
        }
      >>

    >>
    \layout {}
  }
  
  \pageBreak
  
  \wordsComplete

  \paper {
    system-system-spacing.basic-distance = 17
    systems-per-page = #3
  }
}

\book {
  \bookOutputSuffix "s"
  \score {
      \new Staff = "upper" <<
        \new Voice = "soprano" {
          \voiceOne
          r1\fff
          \keepWithTag #'f \PartS
        }
        \new Voice = "alto" {
          \voiceTwo
          r1\ppppp
          \keepWithTag #'f \PartA
        }
        \new Voice = "tenor" {
          \voiceThree
          r1\pppp
          \keepWithTag #'f \PartT
        }
        \new Voice = "bass" {
          \voiceFour
          r1\pppp
          \keepWithTag #'f \PartB
        }
      >>
    \midi {
      \tempo 4 = 120
    }
  }
}

\book {
  \bookOutputSuffix "a"
  \score {
      \new Staff = "upper" <<
        \new Voice = "soprano" {
          \voiceOne
          r1\pppp
          \keepWithTag #'f \PartS
        }
        \new Voice = "alto" {
          \voiceTwo
          r1\ff
          \keepWithTag #'f \PartA
        }
        \new Voice = "tenor" {
          \voiceThree
          r1\pppp
          \keepWithTag #'f \PartT
        }
        \new Voice = "bass" {
          \voiceFour
          r1\pppp
          \keepWithTag #'f \PartB
        }
      >>
    \midi {
      \tempo 4 = 120
    }
  }
}

\book {
  \bookOutputSuffix "t"
  \score {
      \new Staff = "upper" <<
        \new Voice = "soprano" {
          \voiceOne
          r1\pppp
          \keepWithTag #'f \PartS
        }
        \new Voice = "alto" {
          \voiceTwo
          r1\pppp
          \keepWithTag #'f \PartA
        }
        \new Voice = "tenor" {
          \voiceThree
          r1\ff
          \keepWithTag #'f \PartT
        }
        \new Voice = "bass" {
          \voiceFour
          r1\pppp
          \keepWithTag #'f \PartB
        }
      >>
    \midi {
      \tempo 4 = 120
    }
  }
}

\book {
  \bookOutputSuffix "b"
  \score {
      \new Staff = "upper" <<
        \new Voice = "soprano" {
          \voiceOne
          r1\pppp
          \keepWithTag #'f \PartS
        }
        \new Voice = "alto" {
          \voiceTwo
          r1\pppp
          \keepWithTag #'f \PartA
        }
        \new Voice = "tenor" {
          \voiceThree
          r1\pppp
          \keepWithTag #'f \PartT
        }
        \new Voice = "bass" {
          \voiceFour
          r1\ff
          \keepWithTag #'f \PartB
        }
      >>
    \midi {
      \tempo 4 = 120
    }
  }
}