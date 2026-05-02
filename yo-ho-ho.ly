\version "2.24"

\language "deutsch"

\header {
  title = "Yo-Ho-Ho and a Bottle of Rum"
}

taglineLanguage = "english"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"

Part = \relative c \repeat volta 3 {
  \set Staff.instrumentName = "bass"
  a8 h8 c8 d16 d16 e8 e8 e8 r8 |
  \break
  \set Staff.shortInstrumentName = "all"
  a8 g8 f8 e16 e16 d16 d16 c8 h8
  \break
  \set Staff.shortInstrumentName = "bass"
  \slurDashed
  <<
    {
      \magnifyMusic 0.4 {
        \once \override NoteColumn.ignore-collision = ##t
        \once \override NoteColumn.X-offset = #2
        \parenthesize e8
      }
    } \new Voice {
      \once \override Rest.staff-position = #0
      \oneVoice r8
  } >> | a,8 h16^( h16) c16^( c16) d8 e16( e16) e16( e16)
  \slurSolid
  f8( e8) |
  \break
  \set Staff.shortInstrumentName = "all"
  <a, e' a>8 <a e' a>8 <a e' a>8 <h e h'>16 <h e h'>16 <c e c'>16 <c e c'>16 <h e h'>8 <a e' a>8
  \break
  
  \set Staff.shortInstrumentName = "solo1"
  e'8 | a,8 h8 c8 d16 d16 e8 e8 e8
  \break
  e8 | a8 a8 g8 g16 g16 f8 f8 e8
  \break
  e8 | a,8 h8 c8 d8 e8 e8 e8
  \break
  \set Staff.shortInstrumentName = "solo2"
  e8 | << {
    \override NoteColumn.force-hshift = #1.1
    \voiceFour a8 a8 a8 a8 g8 g8 g8
    \break
    g8 | f8 f8 f8 \once\slurDashed g16^( f16)
    \override NoteColumn.force-hshift = #1.9
    e8 e8 e8
    \oneVoice
  } \new Voice { \voiceTwo <e a>2 <d g>2 <c f>2 <h e>4. } \new Voice { \voiceOne a'2 h2 c2 d4. } >>
  \set Staff.shortInstrumentName = "bass"
  \break
  e,8-- | a,8 h8 c8 d16 d16 e8 e8 f8( e8) |
  \set Staff.shortInstrumentName = "all"
  \break
  \set Score.repeatCommands = #`((volta ,#{ \markup \normal-text \italic "on repeats" #}))
  <a, e' a>8 <a e' a>8 <a e' a>8 <h e h'>16 <h e h'>16 <c e c'>16 <c e c'>16 <h e h'>8 <a e' a>4
  \break
  \set Score.repeatCommands = #`((volta #f) (volta ,#{ \markup \normal-text \italic "last time" #}) end-repeat)
  <a e' a>4 <a e' a>4 <a e' a>4 <a e' a>8 <h e h'>8 <c e c'>8 <a e' a>8 <h e h'>4 <a e' a>2
  \set Score.repeatCommands = #'((volta #f))    
}

LyricsOne = \lyricmode {
  Fif -- teen men on a dead man's chest,
  Yo ho ho and a bot -- tle of rum!
  \skip 1 Drink and_the "de - vil" had done for_the rest,
  Yo ho ho and a bot -- tle of rum!

  The mate was fixed by the bo -- sun's pike,
  The bo -- sun brained with a mar -- lin -- spike,
  And coo -- key's throat was marked be -- like
  It had been gripped by fin -- gers ten;
  And there they lay, all good dead men
  Like break o' -- day in a boo -- zing ken
  Yo ho ho and a bot -- tle of rum!
}

LyricsTwo = \lyricmode {
  Fif -- teen men of them good and true,
  \repeat unfold 9 { \skip 1 }
  Every man jack could have sailed_with Old Pew,
  \repeat unfold 9 { \skip 1 }
  
  There_was chest on chest full of Spa -- nish gold
  With_a ton of plate in the mid -- dle hold
  And_the ca -- bins riot of loot un -- told,
  And there they lay that took the plum
  With sight -- less glare and_their lips struck dumb
  While we shared all by the rule of thumb,
  \repeat unfold 9 { \skip 1 }
}

LyricsThree = \lyricmode {
  Fif -- teen men on a dead man's chest,
  \repeat unfold 9 { \skip 1 }
  \skip 1 Drink and_the "de - vil" had done for_the rest,
  \repeat unfold 9 { \skip 1 }

  We wrapped them all in a main -- sail tight
  With twice ten turns of a haw -- ser's bight
  And_we heaved them over and out of sight,
  With_a
  \once \override LyricHyphen.minimum-distance = #0
  \markup{\italic\bold Yo} -- \markup{\italic\bold Heave} -- \markup{\italic\bold Ho!}
  and_a fare -- you -- well
  And_a sud -- den plunge in_the sul -- len swell...
  Ten fa -- thoms deep on the road to hell,
  \repeat unfold 9 { \skip 1 }
  Yo ho ho and a bot -- tle of rum!
}

LyrFull = \markup {
  \sans
  \override #'(baseline-skip . 3.7)
  \abs-fontsize #12
  \column {
    \line {
      \hspace #8
      \column {
        \vspace #1
        \line {
          1.
          \column {
            \line { Fifteen men on a dead man's chest, }
            \line { Yo ho ho and a bottle of rum! }
            \line { Drink and the devil had done for the rest, }
            \line { Yo ho ho and a bottle of rum! }
            \vspace #0.5
            \line { The mate was fixed by the bosun's pike, }
            \line { The bosun brained with a marlinspike, }
            \line { And cookey's throat was marked belike }
            \vspace #0.5
            \line { It had been gripped by fingers ten; }
            \line { And there they lay, all good dead men }
            \line { Like break o'day in a boozing ken }
            \line { Yo ho ho and a bottle of rum! }
          }
        }
        \vspace #2.5
        \line {
          2.
          \column {
            \line { Fifteen men of them good and true, }
            \line { Yo ho ho and a bottle of rum! }
            \line { Every man jack could have sailed with Old Pew, }
            \line { Yo ho ho and a bottle of rum! }
            \vspace #0.5
            \line { There was chest on chest full of Spanish gold }
            \line { With a ton of plate in the middle hold }
            \line { And the cabins riot of loot untold, }
            \vspace #0.5
            \line { And there they lay that took the plum }
            \line { With sightless glare and their lips struck dumb }
            \line { While we shared all by the rule of thumb, }
            \line { Yo ho ho and a bottle of rum! }
          }
        }
        \vspace #2.5
        \line {
          3.
          \column {
            \line { Fifteen men on a dead man's chest, }
            \line { Yo ho ho and a bottle of rum! }
            \line { Drink and the devil had done for the rest, }
            \line { Yo ho ho and a bottle of rum! }
            \vspace #0.5
            \line { We wrapped them all in a mainsail tight }
            \line { With twice ten turns of a hawser's bight }
            \line { And we heaved them over and out of sight, }
            \vspace #0.5
            \line { "With a" \bold \italic "Yo - Heave - Ho!" \hspace #0.5 "and a fare-you-well" }
            \line { And a sudden plunge in the sullen swell... }
            \line { Ten fathoms deep on the road to hell, }
            \line { Yo ho ho and a bottle of rum! }
          }
        }
      }
    }
  }
}

\book {
  \score {
    <<
      \new ChoirStaff <<
        \time 2/4
        \new Staff <<
          \clef "bass"
          \key a \minor
          \new Voice = "PartS" { \Part \bar "|." }
        >>
        \new Lyrics \lyricsto "PartS" {
          \LyricsOne
        }
        \new Lyrics \lyricsto "PartS" {
          \LyricsTwo
        }
        \new Lyrics \lyricsto "PartS" {
          \LyricsThree
        }
      >>
    >>
    \layout {
      indent = 0
      #(layout-set-staff-size 17.6)
      \context {
        \Score
        \autoBeamOff
        proportionalNotationDuration = #(ly:make-moment 1/16)
        \override Score.SpacingSpanner.strict-note-spacing = ##t
        \override BarNumber.break-visibility = ##(#f #f #f)
        barNumberVisibility = #(modulo-bar-number-visible 3 2)
      }
      \context {
        \Lyrics
        \override LyricText.font-size = #1
        \override VerticalAxisGroup.nonstaff-nonstaff-spacing.minimum-distance = #'2.2
      }
    }
    \midi {
      \tempo 4 = 80
    }
  }
  
  \LyrFull
  
  \paper {
    system-count = #12
    systems-per-page = #12
    system-system-spacing = #'((basic-distance . 10) (padding . 2))
    print-page-number = ##f
  }
}