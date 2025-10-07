\version "2.24"

\language "deutsch"

taglineLanguage = "ukrainian"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"

\header {
  title = "Щедрик — Carol of the Bells"
  composer = "Mykola Leontovich"
}

\layout {  
  \context {
    \Staff {
      \set autoBeaming=##f
    }
  }
  \context {
    \Lyrics
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.basic-distance = #0
  }
  \context {
    \Dynamics
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.basic-distance = #0
  }
  \context {
    \Staff
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.basic-distance = #0
  }
}

PartOstinato = \relative c'' {
  b4 a8 b8 g4
}

PartOstinatoBass = {
  \transpose g g, \PartOstinato
}

PartTheme = {
  \repeat unfold 4 \PartOstinato
}

PartThemeBass = {
  \repeat unfold 4 \PartOstinatoBass
}

PartThemeUpper = \relative g'' {
  \repeat unfold 4 { d4 c8 d8 b4 }
}

PartThemePedal = \relative g' {
  \repeat unfold 4 { g4 g8 g8 g4 }
}

PartThemePedalBass = \relative g' {
  \transpose g g, \PartThemePedal
}

PartCrescA = \relative g' {
  g2. f2. es2. d2.
}

PartCrescT = \relative g' {
  es2. d2. c2. g2.
}

PartHornT = \relative g {
  c4 c8 c8 c4 d4 d8 d8 d4 es4 es8 es8 es4 d4 d8 d8 d4
}

PartHornB = \relative g {
  es4 es8 es8 es4 g4 g8 g8 g4 c4 c8 c8 c4 g4 g8 g8 g4
}

PartCulmS = \relative g'' {
  g4 g8 g8 f8[( es8]) d4 d8 d8 c8[( b8])
  c4 c8 c8 d8[( c8]) g4 g8 g8 g4
}

PartCulmT = \relative g' {
  d4 es8 es8 d8[( c8]) d4 d8 d8 d4
  es4 es8 es8 f8[( es8]) d4 d8 d8 d4
}

PartDoricT = \relative g' {
  d2. e2.
  \volta #'() {
    \once\slurDotted f4( es4)
  }
  \unfolded {
    \volta 1 {
      f4( es4)
    }
    \volta 2 {
      f4 es4
    }
  }
  d4 g8( f8) es4 d4
}

PartScalesS = \relative g' {
  \repeat unfold 2 {
    d8 e8 fis8 g8 a8 b8 c8 d8 c4 b4
  }
}

PartScalesASingle = \relative g' {
  d2.
  \volta #'() {
    \once\slurDotted e4( fis4)
  }
  \unfolded {
    \volta 1 {
      e4 fis4
    }
    \volta 2 {
      e4( fis4)
    }
  }
  g4
}

PartScalesA = \relative g' {
  \PartScalesASingle \PartScalesASingle
}

PartScalesB = \relative g {
  d2.~ d2.~ d2.~ d2 es4
}

PartDimA = \relative g' {
  d2.( c2. f2. es2.
}

PartDimT = \relative g {
  g2.~ g2.~ g2.~
  \volta #'() {
    g2.~
  }
  \unfolded {
    \volta 1 {
      g2.~
    }
    \volta 2 {
      g2.
    }
  }
}

PartDimB = \relative g {
  f2.( es2. d2. c2.
}

PartS = \relative g' {
  \PartOstinato
  \repeat volta 2 {
    \PartOstinato \PartOstinato \PartOstinato
    \break
    \PartTheme
    \break
    \PartTheme
    \break
    \PartTheme
    \break
    \PartThemeUpper
    \break
    \PartCulmS
    \break
    \PartScalesS
    \break
    \PartTheme
    \break
    \alternative {
      \volta 1 {
        \PartOstinato
      }
      \volta 2 {
        g2.~
      }
    }
  }
  g2.~ g2.
  d'4 c8 d8 g,8 r8
  \bar "|."
}

PartA = \relative g' {
  R2.
  \repeat volta 2 {
    R2. R2. R2.
    \PartCrescA
    \PartCrescA
    \PartThemePedal
    \PartTheme
    \PartThemePedal
    \PartScalesA
    \PartDimA
    \alternative {
      \volta 1 {
        d2) r4
      }
      \volta 2 {
        \volta #'() {
          d2.~\repeatTie
        }
        \unfolded {
          d2.~)
        }
      }
    }
  }
  d2.~ d2.
  b'4 a8 b8 g8 r8
  \bar "|."
}

PartT = \relative g {
  R2.
  \repeat volta 2 {
    R2. R2. R2.
    R2. R2. R2. R2.
    \PartCrescT
    \PartHornT
    \PartDoricT
    \PartCulmT
    \PartThemeBass
    \PartDimT
    \alternative {
      \volta 1 {
        g2 r4
      }
      \volta 2 {
        \PartOstinatoBass
      }
    }
  }
  \PartOstinatoBass
  \PartOstinatoBass
  R2.
  \bar "|."
}

PartB = \relative g, {
  R2.
  \repeat volta 2 {
    R2. R2. R2.
    R2. R2. R2. R2.
    R2. R2. R2. R2.
    \PartHornB
    \PartThemePedalBass
    \PartThemeBass
    \PartScalesB
    \PartDimB
    \alternative {
      \volta 1 {
        g2^) r4
      }
      \volta 2 {
        \volta #'() {
          g2.^~\repeatTie
        }
        \unfolded {
          g2.^~)
        }
      }
    }
  }
  g2.^~ g2. R2.
  \bar "|."
}

PartDynamics = {
  \textMark "solo"
  s2.\mf
  \repeat volta 2 {
    s2.
    \volta 1 {
      \textMark "tutti"
      s2.*0\pp
    }
    s2.
    s2.
    \volta 2 {
      s2.*0\pp
    }
    \override DynamicTextSpanner.style = #'none
    \once\set crescendoSpanner = #'text
    \once\set crescendoText = \markup { \italic { poco cresc. } }
    s2.\< s2.
    s2. s2.
    s2.\p s2. s2. s2.
    s2.\mp s2. s2. s2.
    s2.\mf
    s2.\< s2. s2 s4\!
    s2.\f s2. s2. s2.\dim
    s2.\mf\< s2\> s4\!
    s2.\pp\< s2\> s4\!
    s2.\mp s2. s2. s2.
    \volta 1 {
      s2.\mf
    }
    \volta 2 {
      s2.\pp
    }
  }
  s2. s2.
  \textMark "solo"
  s8. \textMark \markup { \italic "rit." } s16 s2
}

PartDynamicsA = {
  s2.
  \repeat volta 2 {
    s2.
    s2. s2. 
  
    \once\override DynamicText.X-offset = #5
    s2.\pp s2. s2. s2.
    \once\override DynamicText.X-offset = #5
    s2.\p s2. s2. s2.
    s2.\mp s2. s2. s2.
    s2. s2. s2. s2.
    s2. s2. s2. s2.
    s2. s2. s2. s2.
    s2. s2. s2. s2.
    s2.
  }
}

LyricsUkrInit = \lyricmode {
  Щед -- рик, щед -- рик,
}

LyricsUkrInitt = \lyricmode {
  щед -- рi -- воч -- ка,
  при -- ле -- тi -- ла лас -- тi -- воч  -- ка,
}

LyricsUkrCresc = \lyricmode {
  ста -- ла со -- бі ще -- бе -- та -- ти,
  гос -- по -- да -- ря ви -- кли -- ка -- ти,
}

LyricsUkrCrescc = \lyricmode {
  ви -- йди, ви -- йди, гос -- по -- да -- рю,
  по -- ди -- ви -- ся на ко -- ша -- ру,
}

LyricsUkrHorn = \lyricmode {
  там о -- веч -- ки по -- ко -- ти -- лись,
  а яг -- нич -- ки на -- ро -- ди -- лись.
}

LyricsUkrUpper = \lyricmode {
  В_те -- бе то -- вар весь хо -- ро -- ший,
  бу -- деш ма -- ти мір -- ку гро -- шей,
}

LyricsUkrCulm = \lyricmode {
  В_те -- бе то -- вар весь хо -- ро -- ший,
  бу -- деш ма -- ти мір -- ку гро -- шей.
}

LyricsUkrScalesT = \lyricmode {
  Хоч не гро -- ші, то по -- ло -- ва,
  в_те -- бе жін -- ка чор -- но -- бро -- ва.
}

LyricsUkrCodaT = \lyricmode {
  щед -- рi -- воч -- ка,
  при -- ле -- тi -- ла
}

LyricsUkrCodaS = \lyricmode {
  лас -- тi -- воч  -- ка.
}

LyricsUkrCrescA = \lyricmode {
  ста -- ла со -- бі
}

LyricsUkrCrescT = \lyricmode {
  ще -- бе -- та -- ти,
}

LyricsUkrUpperT = \lyricmode {
  в_те -- бе
  \set Lyrics.ignoreMelismata = ##t
  то -- _ вар
  \set Lyrics.ignoreMelismata = ##f
  хо -- ро -- ший,
}

LyricsUkrScalesA = \lyricmode {
  \set Lyrics.ignoreMelismata = ##t
  В_те -- бе жін -- ка чор -- но -- бро -- ва.
  \set Lyrics.ignoreMelismata = ##f
}

LyricsEngInit = \lyricmode {
  Hark! How the bells,
}

LyricsEngHorn = \lyricmode {
  One seems to hear, words of good cheer
  from ev' -- ry -- where, fill -- ing the air.
}

LyricsEngUpper = \lyricmode {
  Oh, how they pound, rais -- ing the sound
  o'er hill and dale, tell -- ing their tale.
}

LyricsEngCulm = \lyricmode {
  Gai -- ly they ring while peo -- ple sing
  songs of good cheer, Christ -- mas is here!
}

LyricsEngStart = \lyricmode {
  sweet sil -- ver bells,
  all seem to say, 'Throw cares a -- way'.

  Christ -- mas is here, bring -- ing good cheer
  to young and old, meek and the bold.

  Ding, dong, ding, dong, that is their song,
  with joy -- ful ring, all ca -- rol -- ing.

  \LyricsEngHorn
  \LyricsEngUpper
  \LyricsEngCulm
}

LyricsEngScales = \lyricmode {
  \repeat unfold 2 {
    Mer -- ry, mer -- ry, mer -- ry, mer -- ry Christ -- mas!
  }
}

LyricsEngEnd = \lyricmode {
  On, on they send, on with -- out end
  their joy -- ful tone to ev' -- ry home.
}

LyricsEngCresc = \lyricmode {
  ding, dong, ding, dong
}

LyricsEngUpperT = \lyricmode {
  ding, dong,
  \set Lyrics.ignoreMelismata = ##t
  ding, dong, ding,
  \set Lyrics.ignoreMelismata = ##f
  dong, ding, dong.
}

LyricsEngScalesA = \lyricmode {
  \set Lyrics.ignoreMelismata = ##t
  \repeat unfold 2 {
    ding, ding, _ dong,
  }
  \set Lyrics.ignoreMelismata = ##f
}

voltaLyric = #(define-music-function
         (current-lyrics-name volta-one volta-two)
         (string? ly:music? ly:music?)
   #{
  \repeat volta 2 {
    \volta #'() <<
      #volta-one
      \new Lyrics \with {
        alignBelowContext = #current-lyrics-name
      } {
        #volta-two
      }
    >>
    \unfolded {
      \volta 1 {
        #volta-one
      }
      \volta 2 {
        #volta-two
      }
    }
  }
   #})

LyricsInterleavedS = \lyricmode {
  \LyricsUkrInit
  \voltaLyric "LyrS" {
    \LyricsUkrInitt
    \LyricsUkrCresc
    \LyricsUkrCrescc
    \LyricsUkrHorn
    \LyricsUkrUpper
    \LyricsUkrCulm
    \LyricsEngScales
    \LyricsEngEnd
    \LyricsEngInit
  } {
    \LyricsEngStart
    \LyricsEngScales
    \LyricsUkrCresc
  }
  _
  \LyricsUkrCodaS
}

LyricsInterleavedA = \lyricmode {
  \voltaLyric "LyrA" {
    \LyricsUkrCrescA
    \LyricsUkrCrescT
    %\volta #'() {
      \repeat unfold 16 _
      \repeat unfold 16 _
      \repeat unfold 16 _
    %}
    %\unfolded {
    %  \LyricsUkrHorn
    %  \LyricsUkrUpper
    %  \LyricsUkrCulm
    %}
    
    \LyricsUkrScalesA
    _
  } {
    \LyricsEngCresc
    \LyricsEngCresc
    %\volta #'() {
      \repeat unfold 16 _
      \repeat unfold 16 _
      \repeat unfold 16 _
    %}
    %\unfolded {
    %  \LyricsEngHorn
    %  \LyricsEngUpper
    %  \LyricsEngCulm
    %}
    \LyricsEngScalesA
  }
  _
  \volta #'() {
    \repeat unfold 4 _
  }
  \unfolded {
    \LyricsUkrCodaS
  }
}


LyricsInterleavedT = \lyricmode {
  \voltaLyric "LyrT" {
    %\volta #'() {
      \repeat unfold 4 _
    %}
    %\unfolded {
    %  \LyricsUkrCrescT
    %}
    \LyricsUkrHorn
    \LyricsUkrUpperT
    \LyricsUkrCulm
    \LyricsUkrScalesT
    _
  } {
    %\volta #'() {
      \repeat unfold 4 _
    %}
    %\unfolded {
    %  \LyricsEngCresc
    %}
    \LyricsEngHorn
    \LyricsEngUpperT
    \LyricsEngCulm
    \LyricsUkrInit
    \LyricsUkrInitt
    _
  }
  \LyricsUkrInit
  \LyricsUkrCodaT
}

LyricsInterleavedB = \lyricmode {
  \voltaLyric "LyrB" {
    \volta #'() {
      \repeat unfold 16 _
      \repeat unfold 16 _
      \repeat unfold 16 _
    }
    \unfolded {
      \LyricsUkrHorn
      \LyricsUkrUpper
      \LyricsUkrCulm
    }
    _ _
    _
  } {
    \volta #'() {
      \repeat unfold 16 _
      \repeat unfold 16 _
      \repeat unfold 16 _
    }
    \unfolded {
      \LyricsEngHorn
      \LyricsEngUpper
        \LyricsEngCulm
    }
    _ _
    _
  }
}

Score = <<      
      \new ChoirStaff <<
        \new Dynamics {
          \PartDynamics
        }
        \new Staff = "S" <<
          \set Staff.instrumentName = "S"
          \set Staff.shortInstrumentName = "S"
          \clef "treble"
          \key g \minor
          \time 3/4
          \new Voice = "PartS" {
            \PartS
          }
        >>
        \new Lyrics = "LyrS" \lyricsto "PartS" {
          \LyricsInterleavedS
        }
        \new Staff = "A" <<
          \set Staff.instrumentName = "A"
          \set Staff.shortInstrumentName = "A"
          \clef "treble"
          \key g \minor
          \time 3/4
          \new Voice = "PartA" {
            \PartA
          }
        >>
        \new Dynamics {
          \override VerticalAxisGroup.nonstaff-nonstaff-spacing.minimum-distance = ##f
          \override VerticalAxisGroup.nonstaff-relatedstaff-spacing = ##f
          \PartDynamicsA
        }
        \new Lyrics = "LyrA" \lyricsto "PartA" {
          \LyricsInterleavedA
        }
        \new Staff = "T" <<
          \set Staff.instrumentName = "T"
          \set Staff.shortInstrumentName = "T"
          \clef "treble_8"
          \key g \minor
          \time 3/4
          \new Voice = "PartT" {
            \PartT
          }
        >>
        \new Lyrics = "LyrT" \lyricsto "PartT" {
          \LyricsInterleavedT
        }
        \new Staff = "B" <<
          \set Staff.instrumentName = "B"
          \set Staff.shortInstrumentName = "B"
          \clef "bass"
          \key g \minor
          \time 3/4
          \new Voice = "PartB" {
            \PartB
          }
        >>
        \new Lyrics = "LyrB" \lyricsto "PartB" {
          \LyricsInterleavedB
        }
      >>
    >>

\book {
  \score {
    \Score
    \layout {
      #(layout-set-staff-size 17)
      \context {
        \Staff
        \RemoveAllEmptyStaves
      }
    }
  }
  \paper {
    %page-count = 2
  }
}

\book {
  \bookOutputSuffix "unfolded"
  \score {
    \unfoldRepeats
    \Score
    \layout {
      %#(layout-set-staff-size 17)
      \context {
        \Staff
        \RemoveAllEmptyStaves
      }
    }
    \midi {
      \tempo 4=125
    }
  }
  \paper {
    %page-count = 4
  }
}

\book {
  \bookOutputSuffix "fis"
  \score {
    \transpose g fis {
      \Score
    }
    \layout {
      #(layout-set-staff-size 17)
      \context {
        \Staff
        \RemoveAllEmptyStaves
      }
    }
  }
  \paper {
    %page-count = 2
  }
}

\book {
  \bookOutputSuffix "fis-unfolded"
  \score {
    \unfoldRepeats
    \transpose g fis {
      \Score
    }
    \layout {
      \context {
        \Staff
        \RemoveAllEmptyStaves
      }
    }
    \midi {
      \tempo 4=125
    }
  }
  \paper {
    %page-count = 4
  }
}