\version "2.24"

\language "deutsch"

\header {
  title = "Yo Ho Ho!"
}

taglineLanguage = "english"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"

Part = \relative c {
  a8 h8 c8 d16 d16 e8 e8 e8 r8 |
  \break
  a8 g8 f8 e16 e16 d16 d16 c8 h8 r8 |
  \break
  \slurDashed
  a16( a16) h16( h16) c16( c16) d16( d16) e16( e16) e16( e16)
  \slurSolid
  f8( e8) |
  \break
  a,8 a8 a8 a16 h16 c16 c16 h8 a8
  \break
  
  e'8 | a,8 h8 c8 d16 d16 e8 e8 e8
  \break
  e8 | a8 a8 g8 g16 g16 f8 f8 e8
  \break
  e8 | a,8 h8 c8 d8 e8 e8 e8
  \break
  e8 | a8 a8 a8 a8 g8 g8 g8
  \break
  g8 | f8 f8 f8 \once\slurDashed g16( f16) e8 e8 e8
  \break
  e8-- | a,8 h8 c8 d16 d16 e8 e8 f8( e8) |
  \break
  a,8 a8 a8 a16 h16 c16 c16 h8 a4 |
  
}

LyricsOne = \lyricmode {
  Fif -- teen men on a dead man's chest,
  Yo ho ho and a bot -- tle of rum!
  Drink and_the devil had done for_the rest,
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
  Every man jack could_have sailed_with Old Pew,
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
  Fif -- teen men on a dead man's chest,!
  \repeat unfold 9 { \skip 1 }
  Drink and_the devil had done for_the rest,
  \repeat unfold 9 { \skip 1 }

  We wrapped them all in a main -- sail tight
  With twice ten turns of a haw -- ser's bight
  And_we heaved them over and out of sight,
  With_a
  \once \override LyricHyphen.minimum-distance = #0
  \markup{\bold Yo} -- \markup{\bold Heave} -- \markup{\bold Ho!}
  and_a fare -- you -- well
  And_a sud -- den plunge in_the sul -- len swell...
  Ten fa -- thoms deep on the road to hell,
  \repeat unfold 9 { \skip 1 }
}

\book {
  \bookOutputSuffix "bass"
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
      \context {
        \Score
        \autoBeamOff
        \override SpacingSpanner.uniform-stretching = ##t
      }
    }
    \midi {
      \tempo 4 = 80
    }
  }
  \paper {
  }
}