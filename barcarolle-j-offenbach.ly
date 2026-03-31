\version "2.24.4"
\language "deutsch"

taglineLanguage = "français"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"

\header {
  title = "Barcarolle"
  subtitle = "extrait de \"Les Contes d'Hoffmann\""
  composer = "Jacques Offenbach"
  arranger = "arr. Peter Gritton"
}

\layout {
  \context { \Score
    skipBars = ##t
    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16)
  }
  \context { \Staff
    \dynamicUp
  }
  %#(layout-set-staff-size 19)
}

offsetPositions =
#(define-music-function (offsets) (number-pair?)
  #{
     \once \override Slur.control-points =
       #(lambda (grob)
          (match-let ((((_ . y1) _ _ (_ . y2))
                       (ly:slur::calc-control-points grob))
                      ((off1 . off2) offsets))
            (set! (ly:grob-property grob 'positions)
                  (cons (+ y1 off1) (+ y2 off2)))
            (ly:slur::calc-control-points grob)))
  #})

PartSmA = \relative d' {
  R2.*10
}
PartSmB = \relative d'' {
     a4 \p h8 h4 cis8 |
     cis4 d8 d4 cis8 |
     cis4 h8 h4 a8 |
     a4. a4 r8 |
     a4 h8 h4 cis8 |
     cis4 d8 d4 cis8 |
     cis4 h8 h4 a8 |
     a4.~ a4
}
PartSmC = \relative d'' {
     \breathe     
     a8\cresc |
     a4( h8) h4 c8 |
     
     d2.~ |
     d8 a8 h8 c8 h8 a8 |
     h4. h8 r8 h8 |
     h4( cis8) cis4 d8 |
     e2.~ |
     e8\> h8 cis8 d8 cis8 h8\! |
     a4 r8
}
PartSmD = \relative d'' {
     r4. |
     a4.(~ a8 cis8) h8 |
     a4 r8 r4. |
     a4.(~\< a8 cis8) h8\! |
     a4 r8 
}
PartSmE = \relative d'' {
     << \new Voice { s4. s4\> \hide b4\rest s4\!\p } { \oneVoice a4.~-- a2. } >> |
}
PartSmFG = \relative d' {
     R2. | % 41
}
PartSmG = \relative d'' {
     r4. a4. |
     r8 a8\< h8 cis8 d8 e8 |
     fis2.~(\!\f |
     fis8 e8) d8 cis8( d8) h8 |
     a4.~\> a4 h8\! |
     cis4.~ cis4 cis8 |
     d4 r8 
}
PartSmH = \relative d'' {
     a8(\p d4) |
     \offsetPositions #'(2 . 0.5)
     a8\=1( \=2( e'4~\=2) e4. |
     d8\=2( fis4\=2)\=1) a,8( d4) |
     \offsetPositions #'(1.0 . 0)
     a8\=1( \=2( e'4~\=2) e4. |
     d8\=2( fis4~\=2) fis4.\=1) |
}
PartSmI = \relative d'' {
     \offsetPositions #'(0.4 . 0)
     d8\=1(\=2(\pp fis4~\=2) fis4.\=1) |
     a,8\=1(\=2( d4~\=2) d4.\=1) |
     fis,8\=1(\=2( a4~\=2) a4.\=1) |
     a4.( fis4.) ( |
}
PartSmJ = \relative d' {
     d2.~) |
     d2.~ |
     d2.~ |
     d2.~ |
     d4 r8 r4. \bar "|."
}

PartAmA = \relative d' {
     R2.*2 |
     fis4 \pp  g8 g4  fis8 |
     fis8( e8) g8 g4  fis8 |
     fis8( e8) g8 g4  fis8 |
     fis4. fis4 r8 |
     fis4 g8 g4 fis8 |
     fis8( e8) g8 g4 fis8 |
     fis8( e8) g8 g4 fis8 |
     fis2. |
}
PartAmB = \relative d'' {
     a4 \p h8 h4 a8 |
     a4 h8 h4 a8 |
     a4 g8 g4 fis8 |
     fis4. fis4 r8 |
     a4 h8 h4 a8 |
     a4 h8 h4 a8 |
     a4 g8 g4 fis8 |
     fis4.~ fis4
}
PartAmC = \relative d' {
     r8 |
     r4. r4 fis8\cresc |
     fis4( g8) g4 a8 |
     a4 r8 d,8( e8) fis8 |
     g4 r8 r4. |
     r4. r4 gis8 |
     gis4 a8 a4 h8 |
     h4\> h8 e,8( fis8) gis8\! |
     a4 r8
}
PartAmD = \relative d'' {
     a,8( cis8) e8 |
     dis2.( |
     e4) r8 a,8( cis8) e8 |
     dis4.\< dis4 dis8\! |
     e4 r8
}
PartAmE = \relative d'' {
     << \new Voice { s4. s4\> \hide f,4\rest s4\!\p } { \oneVoice r4. g2.-- } >> |
}
PartAmF = \relative d' {
     fis4 g8  g4  fis8 | % 33
     fis8 (   e8 )  g8   g4  fis8 | % 34
     fis8 (   e8 )  g8   g4  fis8 | % 35
     fis4. fis4 r8 | % 36
     fis4  g8  g4  fis8 | % 37
     fis8 (   e8 )  g8   g4  fis8 | % 38
     fis8 (   e8 )  g8   g4  fis8 | % 39
     << { \oneVoice a2. } \new Voice { s4\sf\> s4. \hide a8\rest\! } >> |
}
PartAmG = \relative d' {
     r8 e8 fis8 g8 a8 h8 |
     a4.~ a4 r8 |
     R2. |
     r8 dis,8\f e8 fis8 g8 a8 |
     g4 g8 r4. |
     r8 fis8(\> e8) cis8( d8) h8\! |
     a4( g'8) fis4( e8) |
     d4 r8
}
PartAmH = \relative d' {
     r4. |
     r4. a8\=1(\=2(\p g'4\=2) |
     fis8\=2( d4\=2)\=1) r4. |
     r4. a8\=1(\=2(\> g'4\=2) |
     fis8\=2( d4~\=2) d4.\=1)\! |
}
PartAmI = \relative d' {
     r4. fis8\=1(\=2(\pp a4\=2) |
     fis4\=1) r8 d8\=1(\=2( fis4\=2) |
     d4\=1) r8 a8( d4) |
     fis4.(  d4.) ( |
}
PartAmJ = \relative d' {
     d2. ) ~ | % 57
     d2. ~ | % 58
     d2. ~ | % 59
     d2. ~ |
     d4 r8 r4. \bar "|."
}

PartTmE = \relative d'' {
     << \new Voice { s4. s4\> \hide a4\rest s4\!\p } { \oneVoice cis4.~-- cis2. } >> |
}
PartTmF = \relative d'' {
     d4 a8 a4 a8 |
     cis4 a8 a4 a8 |
     cis4 a8 a4 a8 |
     a4. a4 r8 |
     d4 a8 a4 a8 |
     cis4 a8 a4 a8 |
     cis4 a8 a4 a8 |
     c4.~ \sf \> c4 c8\! |
}
PartTmFG = \relative d'' {
     h2. |
}
PartTmH = \relative d'' {
     r4. |
     r4. cis4.(\p |
     d4.) r4. |
     R2. |
     a2.~\pp |
     a2. |
}
PartTmJ = \relative d'' {
     a4.(\pp h4. |
     a4. g4. |
     a2.~ |
     a2.~ |
     a4) r8 r4. \bar "|."
}

PartBmC = \relative d' {
     r8 |
     r4. r4 d8 |
     d4( e8) e4 fis8 |
     fis4 r8 a8( g8) fis8 |
     g4 r8 r4. |
     r4. r4 e8 |
     e4 fis8 fis4 gis8 |
     gis4 gis8 h8( a8) gis8 |
     a4 r8
}
PartBmD = \relative d'' {
     a,8( cis8) e8 |
     a4. fis4 dis8 |
     e4 r8 a,8( cis8) e8 |
     a4.\< fis4 dis8\! |
     e4 r8
}
PartBmH = \relative d' {
     r4. |
     r4. 
     \offsetPositions #'(1.5 . 0)
     a8\=1(\=2(\p g'4\=2) |
     fis8\=2( d4\=2)\=1) r4. |
     r4. a8(\> g'4)\! |
     fis2.~\pp |
     fis2. |
}
PartBmJ = \relative d' {
     fis4.(\pp g4. |
     fis4. e4. |
     fis2.~ |
     fis2.~ |
     fis4) r8 r4. \bar "|."
}

%\book {
%  \score {
%    <<
%    \new Staff <<            
%      \context Staff <<
%        \clef "treble" \time 6/8 \key d \major
%        \context Voice = "PartPOneVoiceOne" {
%          \PartSmA \PartSmB \PartSmC \PartSmD \PartSmE \PartAmF \PartSmFG \PartSmG \PartSmH \PartSmI \PartSmJ
%        }
%      >>
%    >>
%    \new Staff <<            
%      \context Staff << 
%        \clef "treble" \time 6/8 \key d \major
%        \context Voice = "PartPTwoVoiceOne" {
%          \PartAmA \PartAmB \PartAmC \PartAmD \PartAmE \PartAmF \PartAmG \PartAmH \PartAmI \PartAmJ
%        }
%      >>
%    >>      
%    >>
%    \layout {}
%  }
%}

LyricsS = \lyricmode {
  Bel -- le nuit, ô, nuit d'a -- mour, sou -- ris à nos i -- vres -- ses!
  Nuit plus dou -- ce que le jour! Ô bel -- le nuit d'a -- mour.
  Le temps fuit et sans re -- tour em -- por -- te nos ten -- dres -- ses;
  loin de cet heu -- reux sé -- jour, le temps fuit sans re -- tour!
  Zé -- phyrs em -- bra -- sés, ver -- sez_- nous vos ca -- res -- ses!
  Zé -- phyrs em -- bra -- sés, ver -- sez_- nous vos bai -- sers!
  Vos bai -- sers,
  vos bai -- sers,
  Ah!
  Bel -- le nuit, ô, nuit d'a -- mour, sou -- ris à nos i -- vres -- ses!
  Nuit plus dou -- ce que le jour! Ô bel -- le nuit d'a -- mour.
  Ah!
  Sou -- ris à nos i -- vres -- ses,
  nuit d'a -- mour, ô, nuit d'a -- mour!
  Ah! Ah! Ah! Ah! Ah! Ah! Ah! Ah!
}

LyricsA = \lyricmode {
  Bel -- le nuit, ô, nuit d'a -- mour, sou -- ris à nos i -- vres -- ses!
  Nuit plus dou -- ce que le jour! Ô bel -- le nuit d'a -- mour.
  Le temps fuit et sans re -- tour em -- por -- te nos ten -- dres -- ses;
  loin de cet heu -- reux sé -- jour, le temps fuit sans re -- tour!
  Zé -- phyrs em -- bra -- sés, ver -- sez_- nous,
  ver -- sez_- nous vos ca -- res -- ses!
  vos bai -- sers,
  Ver -- sez_- nous, ver -- sez_- nous vos bai -- sers!
  Ah!
  Bel -- le nuit, ô, nuit d'a -- mour, sou -- ris à nos i -- vres -- ses!
  Nuit plus dou -- ce que le jour! Ô bel -- le nuit d'a -- mour.
  O bel -- le nuit d'a -- mour,
  sou -- ris à nos i -- vres -- ses.
  O bel -- le nuit d'a -- mour!
  Ah! Ah! Ah! Ah! Ah! Ah!
}

LyricsT = \lyricmode {
  Bel -- le nuit, ô, nuit d'a -- mour, sou -- ris à nos i -- vres -- ses!
  Nuit plus dou -- ce que le jour! Ô bel -- le nuit d'a -- mour.
  Le temps fuit et sans re -- tour em -- por -- te nos ten -- dres -- ses;
  loin de cet heu -- reux sé -- jour, le temps fuit sans re -- tour!
  Zé -- phyrs em -- bra -- sés, ver -- sez_- nous vos ca -- res -- ses!
  Zé -- phyrs em -- bra -- sés, ver -- sez_- nous vos bai -- sers!
  Vos bai -- sers,
  vos bai -- sers,
  Ah!
  Bel -- le nuit, ô, nuit d'a -- mour, sou -- ris à nos i -- vres -- ses!
  Nuit plus dou -- ce que le jour! Ô bel -- le nuit d'a -- mour, d'a -- mour.
  Ah!
  Sou -- ris à nos i -- vres -- ses,
  nuit d'a -- mour, ô, nuit d'a -- mour!
  Ah! Ah! Ah!
}

LyricsB = \lyricmode {
  Bel -- le nuit, ô, nuit d'a -- mour, sou -- ris à nos i -- vres -- ses!
  Nuit plus dou -- ce que le jour! Ô bel -- le nuit d'a -- mour.
  Le temps fuit et sans re -- tour em -- por -- te nos ten -- dres -- ses;
  loin de cet heu -- reux sé -- jour, le temps fuit sans re -- tour!
  Zé -- phyrs em -- bra -- sés, ver -- sez_- nous,
  ver -- sez_- nous vos ca -- res -- ses!
  vos bai -- sers,
  Ver -- sez_- nous vos bai -- sers, ver -- sez_- nous vos bai -- sers!
  Ah!
  Bel -- le nuit, ô, nuit d'a -- mour, sou -- ris à nos i -- vres -- ses!
  Nuit plus dou -- ce que le jour! Ô bel -- le nuit d'a -- mour.
  O bel -- le nuit d'a -- mour,
  sou -- ris à nos i -- vres -- ses.
  O bel -- le nuit d'a -- mour!
  Ah! Ah! Ah! Ah!
}

WholeScore =
  {
    \new ChoirStaff <<
      \new Staff = "S" <<
        \clef "treble" \time 6/8 \key d \major
        \new Voice = "S" {
          \PartAmA \PartSmB \PartSmC \PartSmD \PartSmE \PartAmF \PartSmFG \PartSmG \PartSmH \PartSmI \PartSmJ
        }
        \new Lyrics \lyricsto "S" {
          \LyricsS
        }
        \new NullVoice {
          %R2.*6 \break
          %R2.*8 \break
          %R2.*8 \break
          %R2.*7 \break
          %R2.*8 \break
          %R2.*7 \break
          %R2.*8 \break
        }
      >>
      \new Staff = "A" <<
        \clef "treble" \time 6/8 \key d \major
        \new Voice = "A" {
          \PartAmA \PartAmB \PartAmC \PartAmD \PartAmE \PartAmF \PartAmG \PartAmH \PartAmI \PartAmJ
        }
        \new Lyrics \lyricsto "A" {
          \LyricsA
        }
      >>
      \new Staff = "T" <<
        \clef "treble_8" \time 6/8 \key d \major
        \new Voice = "T" { \transpose d d, {
          \PartAmA \PartSmB \PartSmC \PartSmD \PartTmE \PartTmF \PartTmFG \PartSmG \PartTmH R2.*3 \PartTmJ
        } }
        \new Lyrics \lyricsto "T" {
          \LyricsT
        }
      >>
      \new Staff = "B" <<
        \clef "bass" \time 6/8 \key d \major
        \new Voice = "B" { \transpose d d, {
          \PartAmA \PartAmB \PartBmC \PartBmD \PartAmE \PartAmF \PartAmG \PartBmH R2.*3 \PartBmJ
        } }
        \new Lyrics \lyricsto "B" {
          \LyricsB
        }
      >>
    >>
  }

%\book {
%  \bookOutputSuffix "choir"
%  \score {
%    \WholeScore
%    \layout {}
%    \midi {
%      \tempo 4=72
%    }
%  }
%}

\book {
  \bookOutputSuffix "choir-c"
  \score {
    \transpose d c \WholeScore
    \layout {}
    \midi {
      \tempo 4=72
    }
  }
  \paper {
    page-count = 4
  }
}