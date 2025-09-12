\version "2.24"

\language "deutsch"

taglineLanguage = "russian"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"

\header {
  title = "Да исправится молитва моя"
  composer = "П. Г. Чесноков"
}

\layout {
  \context {
    \Staff {
      \set autoBeaming=##f
    }
  }
}

PartSolo = \relative c {
  \partial 2 h4 h4 |
  fis'4. h,8 h4 d4 d4 cis8 cis8 cis4~ cis8 r8 |
  fis4 fis8 e8 d8 cis8 h8 d8 d4.( cis8) cis4 cis8 cis8 |
  d4. cis8 h8 d8 fis8 a8 a4.( gis8) g4~ g8 r8 |
  d2 e4 e4 fis4. fis8 fis4~ fis8 r8 |
  
  R1 | R1 | R1 | R1 | R1 | R1 | R1 | R1
  fis4. h,8 h4 d4 d4. cis8 cis4 g'4 |
  g4( fis2) h,4 d2( cis4) \breathe cis4 |
  d4.( cis8 h4 d8 fis8) a2 gis4 gis4 |
  g4 g8 g8 d4 e4 fis2~ fis4 \breathe fis4 |
  d'2( cis4) h4 h4. ais8 ais4 fis4 |
  a2( gis4) e4 g2( fis8) \breathe fis8 e8 d8 |
  cis4. cis8 cis4 d4 h2. r4 |
  
  R1 | R1 | R1 | R1 | R1 | R1 | R1
  
  r2 h4 h4 |
  fis'2. h,4 d4. cis8 cis4 g'4 |
  fis4. h,8 h4 d4 d4.( cis8) cis4 cis4 |
  d4.( cis8) h4 d8( fis8) a4. gis8 g4~ g8 r8 |
  d2. e4 fis4. fis8 fis4~ fis8 r8 |
  
  R1 | R1 | R1 | R1 | R1 | R1 | R1 | R1 |
  
  r4 h,4 d4 fis4 a2.( gis4) |
  g2 d4 e4 fis2 fis4 fis4 |
  d'2( cis4) h4 h4. ais8 ais4 fis8 fis8 |
  a2 gis4 e8 e8 g2 fis4 h,4 |
  cis2 cis4 d4 h2~ h4 r4 |
  
  R1 | R1 | R1 | R1 | R1 | R1 | R1 |
  
  r2 h4 h4 |
  fis'4. h,8 h4 d4 d4 cis8 cis8 cis4~ cis8 r8 |
  fis4 fis8 e8 d8 cis8 h8 d8 d4.( cis8) cis4 cis8 cis8 |
  d4. cis8 h8 d8 fis8 a8 a4.( gis8) g4~ g8 r8 |
  cis,2 cis4 d4 h4. h8 h4~ h8 r8 |
  
  R1 | R1 \bar "|."
}

BreatheChoir = {
  \time 4/4
  s2 | s1 s2. \breathe s4 s1 s1 |
  s1 s1 s1 s1 |
  s1 s1 s1 s1 |
  s1 s1 s1 s1 |
  s1 s1 s1 s1 |
  s1 s1 s1 s1 |
  s1 s1 s1 s1 |
  s1 s1 |
  s1 s1 s1 s2. \breathe s4 |
  s1 s1 s1 s1 |
  s1 s1 s1 s1 |
  s1 s1 s1 s1 |
  s1 s1 s1 s2. \breathe s4 |
  s1 s1 s1 s1 |
  s1 s1 s1 s1 |
  s1 s1 s1 s1 |
  s1 s1 |
  s1 s1 s1 s2. \breathe s4 |
  s1 s1 s1 s1 |
  s1 s2. \breathe s4 s1 s1 |
  s1 s1 s1 s1 |
  s1 s1 \bar "|."
}

DynamicsChoir = {
  \time 4/4
  \tempo "Медленно"
  r2 | r1\pp r1 r1 r1
  r4 r4 r4 r4\< r4\! r4 \> r4\! r4 |
  r4 r2\> r4\!
  r2 r4 r4\pp
  r1 r1 r1 r1 |
  r2 r4 r8\< r8\! |
  r2\> r2\!
  r1 r4. r8\> r2\!
  r1 r1\pp
  r1 r1 r1 r1 r2 r4\> r4\! r2 r4\> r4\!
  r4 r4\mf r2
  r2\> r2\!
  r4 r4\p r2
  r4 r4\pp r2
  r1
  r2 r4 r4\mf
  r1 r1 r1 r1 r1 r1 r1 r1
  r2 r2\pp
  r1 r1 r1
  r4 r4\< r4 r4 |
  r4\! r4\> r4\! r4 |
  r1 |
  r2 r4 r4\pp
  r2 r4\< r4\!
  r1 |
  r2 r4 r8\< r8\! |
  r4.\> r8\! r2 |
  r2 r4 r8\< r8\! |
  r1 r1 r1 r1 |
  r4 r4\p r2 |
  r1 r1 |
  r4 r4\mf r2 |
  r1 |
  r4 r4\p r2 |
  r4 r4\pp r2 |
  r4 r4\p r2 |
  r2 r4 r4\p |
  r1 r1 r1 r1 r1 r1 r1 r1 |
  r2 r2\pp
  r1 r1 r1
  r2 r4\< r8 r8\! |
  r1 r4 r4\p r2 r4. r8\> r4\! r4 |
  r1\pp r1 \bar "|."
}


PartSChorus = \relative c'' {
  ais8 ais8 |
  h4. h8 h4 h4 h4 h8 h8 h4~ h8 r8 |
  h4 h8 h8 h8 h8 h8 h8 h4.( ais8) ais4 ais8 ais8 |
  h4. h8 h8 h8 h8 h8 h2 h4~ h8 r8 |
  h2 ais4 ais4 h4. h8 h2~ |
}

PartSChorusB = \relative c'' {
  h8 h8 |
  fis'4. fis8 e4 d4 d4 cis8 cis8 cis4~ cis8 r8 |
  d4 d8 d8 cis8 cis8 h8 h8 h4.( ais8) ais4 fis8 fis8 |
  a4. a8 gis8 gis8 e8 e8 g2 fis4~ fis8 r8 |
  cis2 cis4 d4 h4. h8 h4~ h8 r8 |
}

PartS = \relative c {
  \partial 2 r2 |
  d'2. d4 e4. e8 e4 e4 |
  d2 d4 d4 e2~ e4 r4 |
  r4 d2 d4 h'4 h4 h4 r4 |
  r4 h2 h4 h4 ais4 ais8 r8
  \PartSChorus
  h2~ h4 r4 g4 g4 g4 r4 |
  r4 fis4 fis4 fis4 r4 g4~ g8 r8 r4 |
  r4 fis4 fis4~ fis8 r8 r4 h4 h4~ h8 r8 |
  r4 h4 h4~ h8 r8 r4 h4 ais4~ ais8 r8 |
  r4 d4 cis4 cis4 cis2~ cis8 r8 r4 |
  r4 c4 h4~ h8 r8 r4 ais4 h8 r8 r4 |
  r4 h4 ais4 r4 r4 fis4 fis8 r8
  \PartSChorusB
  r2 d4 d4 e2~ e4 r4 |
  r4 d4 d4 d4 e4 e4 e4 r4 |
  r4 d4 d4 d4 h'4 h4 h4~ h8 r8 |
  r2 h4 h4 h2( ais4)
  \PartSChorus
  h4~ h8 r8 r2 r4 h4 h4 h4 | 
  h1~( h2 ais4) r4 |
  r4 d4 cis4 cis4 cis2~ cis4 r4 |
  r4 c8 c8 h4 h8 r8 r4 ais8 ais8 h4 h8 r8 |
  r4 h4 ais4 r4 r4 fis8 fis8 fis8 r8
  \PartSChorusB
  r2 d4 d4 e4. e8 e4 e4 |
  d2 d4 d4 e2~ e4 r4 |
  r4 d2 d4 h'4 h4 h4 r4 |
  r4 h4 ais4 ais4 h4. h8 h4~ h8 r8 |
  h2 ais4 ais4 h4. h8 h4~ h8 r8 |
}

PartAChorus = \relative c' {
  cis8 cis8 |
  d4. d8 d4 d4 d4 d8 d8 d4~ d8 r8 |
  d4 d8 d8 e8 e8 e8 e8 cis2 cis4 cis8 cis8 |
  d4. d8 d8 d8 d8 d8 d2 d4~ d8 r8 |
  e2 cis4 cis4 d4. d8 d2~ |
}

PartAChorusB = \relative c' {
  h'8 h8 |
  h4. h8 ais4 gis4 g4 g8 g8 g4~ g8 r8 |
  fis4 fis8 fis8 eis8 eis8 e8 e8 e2 e4 fis8 fis8 |
  fis4. fis8 fis8 fis8 e8 e8 e2 d4~ d8 r8 |
  h2 ais4 ais4 <fis h>4. <fis h>8 <fis h>4~ <fis h>8 r8 |
}

PartA = \relative c' {
  \partial 2 r2 |
  fis2. fis4 g4. g8 g4 g4 |
  fis2 fis4 fis4 g2~ g4 r4 |
  r4 fis2 fis4 d4 d4 d4 r4 |
  r4 d2 cis4 cis4 cis4 cis8 r8
  \PartAChorus
  d2~ d4 r4 e4 e4 e4 r4 |
  r4 d4 d4 d4 r4 e4~ e8 r8 r4 |
  r4 d4 d4~ d8 r8 r4 d4 d4~ d8 r8 |
  r4 d4 d4( cis8) r8 r4 cis4 cis4~ cis8 r8 |
  r4 fis4 eis4 e4 e2~ e8 r8 r4 |
  r4 fis4 fis4( e8) r8 r4 e4 d8 r8 r4 |
  r4 e4 e4 r4 r4 d4 d8 r8
  \PartAChorusB
  r2 fis4 fis4 g2~ g4 r4 |
  r4 fis4 fis4 fis4 g4 g4 g4 r4 |
  r4 fis4 fis4 fis4 d4 d4 d4~ d8 r8 |
  r2 d4 cis4 cis2~ cis4
  \PartAChorus
  d4~ d8 r8 r2 r4 d4 d4 d4 | 
  d2.( cis4~ cis2~ cis4) r4 |
  r4 fis4 eis4 e4 e2~ e4 r4 |
  r4 fis8 fis8 fis4 e8 r8 r4 e8 e8 d4 d8 r8 |
  r4 e4 e4 r4 r4 d8 d8 d8 r8
  \PartAChorusB
  r2 fis4 fis4 g4. g8 g4 g4 |
  fis2 fis4 fis4 g2~ g4 r4 |
  r4 fis2 fis4 d4 d4 d4 r4 |
  r4 e4 e4 e4 d4. d8 d4~ d8 r8 |
  e2 cis4 cis4 d4. d8 d4~ d8 r8 |
}

PartTChorus = \relative c {
  fis8 fis8 | 
  fis4. fis8 fis4 fis4 g4 g8 g8 g4~ g8 r8 |
  fis4 fis8 fis8 g8 g8 g8 g8 fis2 fis4 fis8 fis8 |
  fis4. fis8 fis8 fis8 fis8 fis8 g2 g4~ g8 r8 |
  g2 fis4 fis4 fis4. fis8 fis2~ |
}

PartTChorusB = \relative c' {
  h8 h8 |
  fis'4. fis8 fis4 eis4 e4 e8 e8 e4~ e8 r8 |
  d4 d8 d8 cis8 cis8 cis8 cis8 cis2 cis4 fis,8 fis8 |
  c'4. c8 h8 h8 h8 h8 ais2 h4~ h8 r8 |
  e,2 e4 e4 d4. d8 d4~ d8 r8 |
}

PartT = \relative c {
  \partial 2 r2 |
  h'2. h4 h4. h8 h4 h4 |
  h2 h4 h4 h2~ h4 r4 |
  r4 h2 h4 e,4 e4 e4 r4 |
  r4 g2 g4 fis4 fis4 fis8 r8
  \PartTChorus
  fis2~ fis4 r4 h4 h4 h4 r4 |
  r4 h4 h4 h4 r4 h4~ h8 r8 r4 |
  r4 h4 h4~ h8 r8 r4 e,4 e4~ e8 r8 |
  r4 g4 g4~ g8 r8 r4 fis4 fis4~ fis8 r8 |
  r4 h8[( a8]) gis4 g4 fis2~ fis8 r8 r4 |
  r4 dis4 e4~ e8 r8 r4 cis4 d8 r8 r4 |
  r4 g4 fis4 r4 r4 h4 h8 r8
  \PartTChorusB
  r2 h4 h4 h2~ h4 r4 |
  r4 h4 h4 h4 h4 h4 h4 r4 |
  r4 h4 h4 h4 e,4 e4 e4~ e8 r8 |
  r2 g4 g4 fis2~ fis4
  \PartTChorus
  fis4~ fis8 r8 r2 r4 e4 e4 e4 | 
  e2( g2 fis2~ fis4) r4 |
  r4 h8[( a8]) gis4 g4 fis2~ fis8 r8 r4 |
  r4 dis8 dis8 e4 e8 r8 r4 cis8 cis8 d4 d8 r8 |
  r4 g4 fis4 r4 r4 h8 h8 h8 r8
  \PartTChorusB
  r2 h4 h4 h4. h8 h4 h4 |
  h2 h4 h4 h2~ h4 r4 |
  r4 h2 h4 e,4 e4 e4 r4 |
  r4 g4 fis4 fis4 g4. g8 g4~ g8 r8 |
  g2 fis4 fis4 fis4. fis8 fis4~ fis8 r8 |
}

PartBChorus = \relative c, {
  fis8 fis8 | 
  \set Staff.midiMaximumVolume = 1.0
  h4. h8 h4 h4 g4 g8 g8 g4~ g8 r8 |
  h4 h8 h8 e,8 e8 e8 e8 fis2 fis4 fis8 fis8 |
  h4. h8 h8 h8 h8 h8 g2 g4~ g8 r8 |
  e2 fis4 fis4 h4. h8 h2~ |
  \set Staff.midiMaximumVolume = 0.0
}

PartBChorusB = \relative c {
  \set Staff.midiMaximumVolume = 1.0
  h'8 h8 |
  d4. d8 cis4 h4 ais4 ais8 ais8 ais4~ ais8 r8 |
  a4 a8 a8 gis8 gis8 g8 g8 fis2 fis4 fis8 fis8 |
  dis4. dis8 e8 e8 e8 e8 cis2 d4~ d8 r8 |
  g,2 fis4 fis4 h4.
  \set Staff.midiMaximumVolume = 0.0
  h8 h4~ h8 r8 |
}

PartB = \relative c {
  \partial 2 r2 |
  \set Staff.midiMaximumVolume = 0.0
  h2. h4 h4. h8 h4 h4 |
  h2 h4 h4 h2~ h4 r4 |
  r4 h2 h4 e,4 e4 e4 r4 |
  r4 g2 g4 fis4 fis4 fis8 r8
  \PartBChorus
  h2~ h4 r4 h4 h4 h4 r4 |
  r4 h4 h4 h4 r4 h4~ h8 r8 r4 |
  r4 h4 h4~ h8 r8 r4 e,4 e4~ e8 r8 |
  r4 g4 g4~ g8 r8 r4 fis4 fis4~ fis8 r8 |
  r4 h'8[( a8]) gis4 g4 fis2~ fis8 r8 r4 |
  r4 dis4 e4~ e8 r8 r4 cis4 d8 r8 r4 |
  r4 g4 fis4 r4 r4 h,4 h8 r8
  \PartBChorusB
  r2 h4 h4 h2~ h4 r4 |
  r4 h4 h4 h4 h4 h4 h4 r4 |
  r4 h4 h4 h4 e,4 e4 e4~ e8 r8 |
  r2 g4 g4 fis2~ fis4
  \PartBChorus
  h4~ h8 r8 r2 r4 e,4 e4 e4 | 
  e2( g2 fis2~ fis4) r4 |
  r4 h'8[( a8]) gis4 g4 fis2~ fis8 r8 r4 |
  r4 dis8 dis8 e4 e8 r8 r4 cis8 cis8 d4 d8 r8 |
  r4 g,4 fis4 r4 r4 h8 h8 h8 r8
  \PartBChorusB
  r2 h4 h4 h4. h8 h4 h4 |
  h2 h4 h4 h2~ h4 r4 |
  r4 h2 h4 e,4 e4 e4 r4 |
  r4 g4 fis4 fis4 g4. g8 g4~ g8 r8 |
  e2 fis4 fis4 h4. h8 h4~ h8 r8 |
}

LyrSolo = \lyricmode {
  Да    ис -- пра -- вит -- ся    мо -- лит -- ва    мо -- я,
  я -- ко    ка -- ди -- ло    пред    То -- бо -- ю,
  воз -- де -- я -- ни -- е    ру -- ку    мо -- е -- ю,
  жерт -- ва    ве -- чер -- ня -- я.
  
  Гос -- по -- ди,   воз -- звах   к_Те -- бе   ус -- лы -- ши    мя,
  вон -- ми,   гла -- су    мо -- ле -- ни -- я    мо -- е -- го,
  вне -- гда    воз -- зва -- ти    ми    вон -- ми,   вон -- ми,
  вне -- гда    воз -- зва -- ти    ми   к_Те -- бе.
  
  По -- ло -- жи,   Гос -- по -- ди,
  хра -- не -- ни -- е    ус -- том    мо -- им,
  и    дверь    о -- граж -- де -- ни -- я
  о    уст -- нах    мо -- их.
  
  Не    ук -- ло -- ни    серд -- це    мо -- е,
  в_сло -- ве -- са    лу -- кав -- стви -- я
  не -- пще -- ва -- ти,
  не -- пще -- ва -- ти    ви -- ны    о    гре -- сех.
  
  Да    ис -- пра -- вит -- ся    мо -- лит -- ва    мо -- я,
  я -- ко    ка -- ди -- ло    пред    То -- бо -- ю,
  воз -- де -- я -- ни -- е    ру -- ку    мо -- е -- ю,
  жерт -- ва    ве -- чер -- ня -- я.
}

LyrChoir = \lyricmode {
  Да    ис -- пра -- вит -- ся    мо -- лит -- ва    мо -- я,
  да    ис -- пра -- вит -- ся,
  да    ис -- пра -- вит -- ся,
  
  да    ис -- пра -- вит -- ся    мо -- лит -- ва    мо -- я,
  я -- ко    ка -- ди -- ло    пред    То -- бо -- ю,
  воз -- де -- я -- ни -- е    ру -- ку    мо -- е -- ю,
  жерт -- ва    ве -- чер -- ня -- я.
  
  Гос -- по -- ди,   ус -- лы -- ши    мя,
  вон -- ми,   вон -- ми,   вон -- ми,   вон -- ми,
  ус -- лы -- ши    мя,
  вон -- ми,   вон -- ми,   вон -- ми,   вон -- ми:
  
  Да    ис -- пра -- вит -- ся    мо -- лит -- ва    мо -- я,
  я -- ко    ка -- ди -- ло    пред    То -- бо -- ю,
  воз -- де -- я -- ни -- е    ру -- ку    мо -- е -- ю,
  жерт -- ва    ве -- чер -- ня -- я.
  
  По -- ло -- жи,
  по -- ло -- жи,   Гос -- по -- ди,
  по -- ло -- жи,   Гос -- по -- ди,
  по -- ло -- жи.
  
  Да    ис -- пра -- вит -- ся    мо -- лит -- ва    мо -- я,
  я -- ко    ка -- ди -- ло    пред    То -- бо -- ю,
  воз -- де -- я -- ни -- е    ру -- ку    мо -- е -- ю,
  жерт -- ва    ве -- чер -- ня -- я.
  
  Не    ук -- ло -- ни,
  не    ук -- ло -- ни,
  не -- пще -- ва -- ти,
  не -- пще -- ва -- ти    ви -- ны    о    гре -- сех.
  
  Да    ис -- пра -- вит -- ся    мо -- лит -- ва    мо -- я,
  я -- ко    ка -- ди -- ло    пред    То -- бо -- ю,
  воз -- де -- я -- ни -- е    ру -- ку    мо -- е -- ю,
  жерт -- ва    ве -- чер -- ня -- я.
  
  Да    ис -- пра -- вит -- ся    мо -- лит -- ва    мо -- я,
  да    ис -- пра -- вит -- ся,
  жерт -- ва    ве -- чер -- ня -- я,
  жерт -- ва    ве -- чер -- ня -- я.
}


\book {
  \score {
    <<
      \new Staff = "Solo" \with {
        midiInstrument = "viola"
      } <<
        \clef "treble_8"
        \key h \minor
        \new Voice = "PartSolo" { \PartSolo }
      >>
      \new Lyrics \lyricsto "PartSolo" {
        \LyrSolo
      }
      \new ChoirStaff <<
        \new Dynamics { \DynamicsChoir }
        \new Staff = "S" <<
          \clef "treble"
          \key h \minor
          \new Voice = "PartS" { \PartS }
          \new Voice { \BreatheChoir }
        >>
        \new Lyrics \lyricsto "PartS" {
          \LyrChoir
        }
        \new Staff = "A" <<
          \clef "treble"
          \key h \minor
          \new Voice = "PartA" { \PartA }
          \new Voice { \BreatheChoir }
        >>
        \new Dynamics { \DynamicsChoir }
        \new Staff = "T" <<
          \clef "treble_8"
          \key h \minor
          \new Voice = "PartT" { \PartT }
          \new Voice { \BreatheChoir }
        >>
        \new Lyrics \lyricsto "PartT" {
          \LyrChoir
        }
        \new Staff = "B" <<
          \clef "bass"
          \key h \minor
          \new Voice = "PartB" { \PartB }
          \new Voice { \BreatheChoir }
        >>
      >>
    >>
    \layout {
      #(layout-set-staff-size 19)
    }
    \midi {
      \tempo 4 = 50
      \context {
        \Staff {
          
        } 
      }
    }
  }
}
