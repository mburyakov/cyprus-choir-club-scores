\version "2.24"

\language "deutsch"

taglineLanguage = "english"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"

\include "articulate.ly"

\header {
  title = "We wish you a merry Christmas +"
}

PartIS = \relative c' {
  \autoBeamOn
  d4 |
  g4. h8~ h4 g4 |
  e4. c'8~ c4 c4 |
  h4 h8 a8~ a8 g4 h8~ |
  h8 a4. r4 d,4 |
  g4. h8~ h4 g4 |
}

PartIVS = \relative c' {
  e4. c'8~ c4 c4 |
  h4 h8 a8~ a8 g8 fis4 |
  g2.
}

%PartISS = \relative c' {
%  \autoBeamOn
%  s4 |
%  s4. s8~ s4 s4 |
%  s4. s8~ s4 s4 |
%  s4 s8 s8~ s8 s4 s8~ |
%  s8 s4. s4 s4 |
%  d4. g8~ g4 d4 |
%  e4. g8~ g4 g4 |
%  g4 g8 e8~ e8 e8 d4 |
%  d2.
%}

PartIA = \relative c' {
  \autoBeamOn
  d4 |
  h4. d8~ d4 h4 |
  c4. e8~ e4 e4 |
  d4 d8 e8~ e8 d4 cis8~ |
  cis8 c4. r4 c4 |
  h4. d8~ d4 h4 |
}

PartIVAA = \relative c' {
  c4. e8~ e4 e4 |
  d4 d8 c8~ c8 c8 c4 |
  h2.
}

PartIVBA = \relative c' {
  c4. e8~ e4 e4 |
  d4 d8 c8~ c8 c8 c4 |
  c8^( h8 a8 h8^~ h4)
}

PartIT = \relative c {
  \autoBeamOn
  d4 |
  g4. g8~ g4 g4 |
  g4. g8~ g4 g4 |
  g4 g8 g8~ g8 g4 g8~ |
  g8 fis4. r4 d4 |
  g4. g8~ g4 g4 |
}

PartIVT = \relative c' {
  g4. g8~ g4 g4 |
  g4 g8 e8~ e8 e8 a4 |
  g2.
}

PartIB = \relative c {
  \autoBeamOn
  d4 |
  d4. g8~ g4 d4 |
  g4. g8~ g4 g4 |
  g4 g8 c8~ c8 h4 e,8~ |
  e8 d4. r4 d4 |
  g,4. g8~ g4 d'4 |
}

PartIVAB = \relative c {
  c4. a8~ a4 a4 |
  d4 d8 d8~ d8 d8 d4 |
  g4( fis4 e4)  
}

PartIVBB = \relative c {
  c4. a8~ a4 a4 |
  d4 d8 d8~ d8 d8 d4 |
  g4( d4 g,4)  
}

PartFS = \relative c' {
  \autoBeamOn
  e4. c'8~ c4 c4 |
  h4 c8 d8 r8 d4.~ |
  d4 r8 d,8 d8 e8 fis4 |
  g1~ |
  g2. r8 a8 |
  h4 c8 d8~ d8 e4 <d fis>8~ |
  <d fis>8 <d g>4.~ <d g>2
}

PartFA = \relative c' {
  \autoBeamOn
  c4. e8~ e4 e4 |
  g4 g8 g8 r8 g4.~ |
  g4 r8 d8 d8 d8 d4 |
  d4 d8 h8 r8 d4. |
  e4 e8 c8 r8 e8 r8 e8 |
  g4 a8 h8~ h8 c4 c8~ |
  c8 h4.~ h2
}

PartFT = \relative c' {
  \autoBeamOn
  g4. g8~ g4 e4 |
  g4 g8 g8 r8 g4.~ |
  g4 r8 d8 d8 e8 fis4 |
  g1~ |
  g2. r8 g8 |
  g4 g8 g8~ g8 g4 g8~ |
  g8 g4.~ g2
}

PartFB = \relative c {
  \autoBeamOn
  c4. a8~ a4 a'4 |
  g4 a8 h8 r8 h4.~ |
  h4 r4 r2 |
  h,4 h8 g8 r8 h4. |
  c4 c8 e8 r8 c8 r8 c8 |
  d4 es8 d8~ d8 d4 d8~ |
  d8 g,4.~ g2
}

PartXS = \relative c' {
  \autoBeamOn
  d4 |
  g4. g8~ g4 g4 |
  fis2 r4 fis4 |
  g4. fis8~ fis4 e4 |
  d2 r4 a'4
  h4. a8~ a4 g4 |
  d'4 fis,4 g4 a4 |
  h4 d4 cis4. d8~ |
  d2 r4
}

PartXA = \relative c' {
  \autoBeamOn
  d4 |
  h4. c8~ c4 d4 |
  d2 r4 d4 |
  d4. cis8~ cis4 cis4 |
  d2 r4 d4 |
  d4. d8~ d4 d4 |
  d4 d4 d4 d4 |
  d4 d4 e4. d8~ |
  d2 r4
}

PartXT = \relative c {
  \autoBeamOn
  d4 |
  g4. g8~ g4 g4 |
  a2 r4 a4 |
  h4. a8~ a4 g4 |
  fis2 r4 a4 |
  h4. c8~ c4 h4 |
  a4 a4 h4 a4 |
  g4 g4 g4. fis8~ |
  fis2 r4
}

PartXB = \relative c {
  \autoBeamOn
  d4 |
  g,4. a8~ a4 h4 |
  d2 r4 d4 |
  e4. a8~ a4 a4 |
  d,2 r4 fis4
  g4. fis8~ fis4 g4 |
  fis4 d4 e4 fis4 |
  g4 e4 a,4. d8~ |
  d2 r4
}

PartWS = \relative c' {
  \autoBeamOn
  d4
  g4 g8 a8 g8 fis8 |
  e4 e4 e4 |
  a4 a8 h8 a8 g8 |
  fis4 d4 d4 |
  h'4 h8 c8 h8 a8 |
  g4 e4 d4 |
  e4 a4 fis4 |
}

PartWVS = \relative c'' {
  g2
}

PartWA = \relative c' {
  \autoBeamOn
  d4
  h4 d4 h4 |
  c4 c4 c4 |
  cis4 a4 cis4 |
  d4 d4 d4 |
  dis4 dis4 h4 |
  h4 c4 d4 |
  c4 c4 c4 |
}

PartWVA = \relative c' {
  h2
}

PartWT = \relative c {
  \autoBeamOn
  d4
  g4 g4 g4 |
  g4 g4 g4 |
  a4 a4 a4 |
  a4 a4 a4 |
  h4 h4 h4 |
  h4 g4 g4 |
  a4 a4 a4 |
}

PartWVT = \relative c' {
  g2
}

PartWB = \relative c {
  \autoBeamOn
  d4
  g,4 h4 d4 |
  c4 c4 h4 |
  a4 cis4 e4 |
  d4 fis4 a4 |
  h4 h,4 dis4 |
  e4 c4 h4 |
  a4 d4 d4 |
}

PartWVB = \relative c {
  g2
}

PartJS = \relative c'' {
  \autoBeamOff
  d4 cis8. h16 |
  a4. g8 |
  fis4 e4 |
  d4. a'8 |
  h4. h8 |
  cis4. cis8 |
  d2~ |
  d4.\breathe d8 |
  d8([ cis8)] h8([ a8)] |
  a8.([ g16 fis8)] d'8 |
  d8([ cis8)] h8([ a8)] |
  a8.([ g16 fis8)] fis8 |
  fis8 fis8 fis8 fis16([ g16)] |
  a4. g16([ fis16)] |
  e8 e8 e8 e16([ fis16)] |
  g4. fis16([ e16)] |
  d8 d'4 h8 |
  a8.([ g16)] fis8 g8 |
  fis4 e4 |
  d2
}

PartJA = \relative c' {
  \autoBeamOff
  fis4 a8. g16 |
  fis4. e8 |
  d4 cis4 |
  d4. a'8 |
  g4. g8 |
  g4. g8 |
  fis2~ |
  fis4.\breathe fis8 |
  fis8([ a8)] g8([ fis8)] |
  fis8.([ e16 d8)] fis8 |
  fis8([ a8)] g8([ fis8)] |
  fis8.([ e16 d8)] d8 |
  d8 d8 d8 d16([ e16)] |
  fis4. e16([ d16)] |
  cis8 cis8 cis8 cis16([ d16)] |
  e4. d16([ cis16)] |
  d8 fis4 g8 |
  fis8.([ e16]) d8 e8 |
  d4 cis4 |
  d2
}

PartJT = \relative c' {
  \autoBeamOff
  d4 d8. d16 |
  d4. h8 |
  a4 g4 |
  fis4. d'8 |
  d4. d8 |
  a4. a8 |
  a2~ |
  a4. r8 |
  r2 |
  r2 |
  r2 |
  r2 |
  r4 r8 a8 |
  a8 a8 a8 a8 |
  a2~ |
  a4. a8 |
  fis8 a4 d8 |
  d4 d8 h8 |
  a4 a8([ g8)] |
  fis2
}

PartJB = \relative c {
  \autoBeamOff
  d4 d8. d16 |
  d4. g,8 |
  a4 a4 |
  d4. fis8 |
  g4. g8 |
  a4. a8 |
  d,2~ |
  d4. r8 |
  d2~ |
  d2~ |
  d2~ |
  d4 r4 |
  r4 r8 d8 |
  d8 d8 d8 d8 |
  a4. a8 |
  a8 a8 a8 a8 |
  d4. d8 |
  d4 d8 g,8 |
  a4 a4 |
  d2
}

PartNS = \relative c'' {
  \autoBeamOff
  \dynamicUp
  g4\pp g8 g4 g8 |
  g4. g4 g8 |
  g4.~ g4 r8 |
  c4.~( c8.[ d16)] c8 h2. |
  e,4 e8 g8. fis16 e8 |
  d8. e16 d8 g8. a16 g8 |
  e4 e8 g8. fis16 e8 |
  d8. e16 d8 r8 g8( h8 |
  a4) a8 c8. a16 fis8 |
  g4.( h4.) |
  g8.([ d16)] h8 a8. d16 fis8 |
  g4.
}

PartNA = \relative c' {
  \autoBeamOff
  h4 h8 h4 h8 |
  d8.([ e16)] d8 h4. |
  d8. e16 d8 h4. |
  a'4 a8 fis4. |
  g4 g8 d4. |
  c4 c8 e8. d16 c8 |
  h8. c16 d8 h4. |
  c4 c8 e8. d16 c8 |
  h8. c16 d8 h4. |
  c4 c8 e8 d8 c8 |
  h4.( g'4.) |
  h,4 d8 d8. c16 a8 |
  h4.
}

PartNT = \relative c {
  \autoBeamOff
  d4 d8 d4 d8 |
  d4 d8 d4 d8 |
  d4 d8 d4 d8 |
  d4 d8 d4. |
  d4 d8 g4. |
  g4 g8 g8 g8 g8 |
  g8 g8 g8 g4.( |
  g8) g8 g8 g8 g8 g8 |
  g8. g16 g8 g4. |
  fis4 fis8 a8. a16 a8 |
  g4.( e4.) |
  d4 d8 d8. d16 d8 |
  d4.
}

PartNB = \relative c {
  \autoBeamOff
  g4 g8 g4 g8 |
  g4 g8 g4 g8 |
  g4 g8 g4 g8 |
  d'4 d8 d4. |
  g,4 g8 g4. |
  c4 c8 c8 c8 c8 |
  g8 g8 g8 g4.( |
  g8) c8 c8 c8 c8 c8 |
  g8. g16 g8 g4. |
  d'4 d8 d8. d16 d8 |
  e8 e8 d8 cis8. cis16 cis8 |
  d4 d8 d8. d16 d8 |
  g,4.
}

PartDS = \relative c' {
  \autoBeamOff
  e8 e8 d8 d8 g8([ fis16 e16)] d4 |
  a'8 h8 c8 c8 h8([ a8 g8)] fis8 |
  g4 a8([ c8)] h2 |
  a8 h8 c8 c8 h8([ a8 g8)] fis8 |
  g4 a8([ c8)] h2 |
  a8 g8 fis4 e2
}

PartDA = \relative c' {
  \autoBeamOff
  e8 e8 d8 d8 g8([ fis16 e16)] d4 |
  fis8 g8 a8 fis8 g8([ fis8 e8)] dis8 |
  e4 fis8([ a8)] g2 |
  fis8 g8 a8 fis8 g8([ fis8 e8)] dis8 |
  e4 fis8([ a8)] g2 |
  fis8 e8 dis4 e2
}

PartDT = \relative c {
  \autoBeamOff
  e8 e8 d8 d8 g8([ fis16 e16)] d4 |
  d'4 d4 d8 c8 h8 h8 |
  h4 d4 d2 |
  d4 d4 d8 c8 h8 h8 |
  h4 d4 d2 |
  c8 c8 h4 e,2
}

PartDB = \relative c {
  \autoBeamOff
  e8 e8 d8 d8 g8([ fis16 e16)] d4 |
  d4 d4 g,8 a8 h8 h8 |
  e4 d4 g,2 |
  d'4 d4 g,8 a8 h8 h8 |
  e4 d4 g,2 |
  a8 a8 h4 e2
}

LyricsI = \lyricmode {
  We wish you, we wish you
  a ver -- y mer -- ry Christ -- mas,
  we wish you, we
}

LyricsIV = \lyricmode {
  wish you
  a hap -- py, hap -- py New Year.
}


LyricsFS = \lyricmode {
  wish you
  a mer -- ry Christ -- mas,
  and hap -- py New Year.
  A hap -- py, hap -- py New Year.
}

LyricsFA = \lyricmode {
  wish you
  a mer -- ry Christ -- mas,
  and hap -- py, and
  hap -- py, hap -- py,
  hap -- py, hap -- py,
  a hap -- py, hap -- py New Year.
}

LyricsFB = \lyricmode {
  wish you
  a mer -- ry Christ -- mas,
  hap -- py, hap -- py,
  hap -- py, hap -- py,
  a hap -- py, hap -- py New Year.
}

LyricsW = \lyricmode {
  We wish you a mer -- ry Christ -- mas,
  we wish you a mer -- ry Christ -- mas,
  we wish you a mer -- ry Christ -- mas,
  and_a hap -- py New
}

LyricsWV = \lyricmode {
  Year.
}

LyricsWW = \lyricmode {
  Now bring us a fig -- gy pud -- ding,
  now bring us a fig -- gy pud -- ding,
  now bring us a fig -- gy pud -- ding,
  and bring some out
}

LyricsWWV = \lyricmode {
  here!
}

LyricsX = \lyricmode {
  Good ti -- dings we bring
  to you and your kin.
  Good ti -- dings for Christ -- mas,
  and a hap -- py New Year.
}

LyricsJ = \lyricmode {
  Joy to the world! The Lord is come;
  Let Earth re -- ceive her King;
  Let eve -- ry heart pre -- pare him room,
  And heaven and na -- ture sing,
  And heaven and na -- ture sing,
  And hea -- ven and hea -- ven and na -- ture sing.
}

LyricsJT = \lyricmode {
  Joy to the world! The Lord is come.
  Let Earth re -- ceive her King.
  Let heaven and na -- ture sing,
  And hea -- ven and hea -- ven and na -- ture sing.
}

LyricsJB = \lyricmode {
  Joy to the world! The Lord is come.
  Let Earth re -- ceive her King.
  _
  Let heaven and na -- ture sing,
  And heaven and na -- ture sing, and hea -- ven and na -- ture sing.
}

LyricsN = \lyricmode {
  Stil -- le Nacht!
  Hei -- li -- ge Nacht!
}

LyricsNS = \lyricmode {
  Stil -- le, stil -- le Nacht, stil -- le Nacht.
  Al -- les schläft.
  Nur das trau -- te hoch -- hei -- li -- ge, hei -- li -- ge.
  Hol -- der Kna -- be im lok -- ki -- gen...
  schlaf in himm -- li -- scher Ruh,
  schlaf in himm -- li -- scher Ruh!
}

LyricsNA = \lyricmode {
  Stil -- le, stil -- le, 
  stil -- le Nacht!
  Hei -- li -- ge Nacht!
  Al -- les schläft,
  ein -- sam wacht
  nur das trau -- te hoch -- hei -- li -- ge Paar.
  Hol -- der Kna -- be im lok -- ki -- gen Haar,
  schlaf in himm -- li -- scher Ruh,
  schlaf in himm -- li -- scher Ruh!
}

LyricsNB = \lyricmode {
  Stil -- le, stil -- le, 
  stil -- le, stil -- le,
  heil -- ge, heil -- ge,
  al -- les schläft,
  ein -- sam wacht
  nur das trau -- te hoch -- hei -- li -- ge Paar.
  Hol -- der Kna -- be im lok -- ki -- gen Haar,
  schlaf in himm -- li -- scher Ruh,
  schlaf in himm -- li -- scher,
  schlaf in himm -- li -- scher Ruh!
}

LyricsDVA = \lyricmode {
  Доб -- рий ве -- чiр то -- бi,
  па -- не гос -- по -- да -- рю.
}

LyricsDVB = \lyricmode {
  За -- сте -- ляй -- те сто -- ли, та все ки -- ли -- ма -- ми.
}

LyricsD = \lyricmode {
  Ра -- дуй -- ся,
  ой, ра -- дуй -- ся зем -- ле,
  Син Бо -- жий
  на -- ро -- див -- ся.
}

StaffStub = <<
  \new Dynamics {
    
  }
  \new DrumStaff = "Drums" \with {
    \override StaffSymbol.line-count = #1
    drumStyleTable = #percussion-style
    \override NoteHead.style = #'cross
    \magnifyStaff #6/7
    midiMaximumVolume = 4.0
  } {}
  \new ChoirStaff \with {
    midiMaximumVolume = 0.4
  } <<
    \new Staff = "S" {
      \clef "treble"
      \key g \major
      \new Voice = "S" {}
    }
    \new Lyrics = "LyrS" {}
    \new Staff = "A" <<
      \clef "treble"
      \key g \major
      \new Voice = "A" {}
    >>
    \new Lyrics = "LyrA" {}
    \new Staff = "T" <<
      \clef "treble_8"
      \key g \major
      \new Voice = "T" {}
    >>
    \new Lyrics = "LyrT" {}
    \new Staff = "B" <<
      \clef "bass"
      \key g \major
      \new Voice = "B" {}
    >>
  >>
>>

ChoirI = <<
  \context Voice = "S" { \PartIS }
  \context Lyrics = "LyrS" { \lyricsto "S" { \LyricsI } }
  \context Voice = "A" { \PartIA }
  \context Lyrics = "LyrA" { \lyricsto "A" { \LyricsI } }
  \context Voice = "T" { \PartIT }
  \context Lyrics = "LyrT" { \lyricsto "T" { \LyricsI } }
  \context Voice = "B" { \PartIB }
  \context Lyrics = "LyrB" { \lyricsto "B" { \LyricsI } }
>>

ChoirIVA = <<
  \context Voice = "S" { \PartIVS }
  \context Lyrics = "LyrS" { \lyricsto "S" { \LyricsIV } }
  \context Voice = "A" { \PartIVAA }
  \context Lyrics = "LyrA" { \lyricsto "A" { \LyricsIV } }
  \context Voice = "T" { \PartIVT }
  \context Lyrics = "LyrT" { \lyricsto "T" { \LyricsIV } }
  \context Voice = "B" { \PartIVAB }
  \context Lyrics = "LyrB" { \lyricsto "B" { \LyricsIV } }
>>

ChoirIVB = <<
  \context Voice = "S" { \PartIVS }
  \context Lyrics = "LyrS" { \lyricsto "S" { \LyricsIV } }
  \context Voice = "A" { \PartIVBA }
  \context Lyrics = "LyrA" { \lyricsto "A" { \LyricsIV } }
  \context Voice = "T" { \PartIVT }
  \context Lyrics = "LyrT" { \lyricsto "T" { \LyricsIV } }
  \context Voice = "B" { \PartIVBB }
  \context Lyrics = "LyrB" { \lyricsto "B" { \LyricsIV } }
>>

ChoirPause =
#(define-music-function
     (expr)
     (ly:music?)
   #{
     <<
       \context Voice = "S" { #expr }
       \context Lyrics = "LyrS" { #expr }
       \context Voice = "A" { #expr }
       \context Lyrics = "LyrA" { #expr }
       \context Voice = "T" { #expr }
       \context Lyrics = "LyrT" { #expr }
       \context Voice = "B" { #expr }
       \context Lyrics = "LyrB" { #expr }
     >>
   #})

ChoirChangeKey =
#(define-music-function
     (expr)
     (ly:music?)
   #{
     <<
       \context Staff = "S" { #expr }
       \context Staff = "A" { #expr }
       \context Staff = "T" { #expr }
       \context Staff = "B" { #expr }
     >>
   #})

ChoirW = <<
  \context Voice = "S" { \PartWS }
  \context Lyrics = "LyrS" { \lyricsto "S" \LyricsW }
  \context Voice = "A" { \PartWA }
  \context Lyrics = "LyrA" { \lyricsto "S" \LyricsW }
  \context Voice = "T" { \PartWT }
  \context Lyrics = "LyrT" { \lyricsto "S" \LyricsW }
  \context Voice = "B" { \PartWB }
  \context Lyrics = "LyrB" { \lyricsto "S" \LyricsW }
>>

ChoirWV = <<
  \context Voice = "S" { \PartWVS }
  \context Lyrics = "LyrS" { \lyricsto "S" \LyricsWV }
  \context Voice = "A" { \PartWVA }
  \context Lyrics = "LyrA" { \lyricsto "S" \LyricsWV }
  \context Voice = "T" { \PartWVT }
  \context Lyrics = "LyrT" { \lyricsto "S" \LyricsWV }
  \context Voice = "B" { \PartWVB }
  \context Lyrics = "LyrB" { \lyricsto "S" \LyricsWV }
>>

ChoirWW = <<
  \context Voice = "S" { \PartWS }
  \context Lyrics = "LyrS" { \lyricsto "S" \LyricsWW }
  \context Voice = "A" { \PartWA }
  \context Lyrics = "LyrA" { \lyricsto "S" \LyricsWW }
  \context Voice = "T" { \PartWT }
  \context Lyrics = "LyrT" { \lyricsto "S" \LyricsWW }
  \context Voice = "B" { \PartWB }
  \context Lyrics = "LyrB" { \lyricsto "S" \LyricsWW }
>>

ChoirWWV = <<
  \context Voice = "S" { \PartWVS }
  \context Lyrics = "LyrS" { \lyricsto "S" \LyricsWWV }
  \context Voice = "A" { \PartWVA }
  \context Lyrics = "LyrA" { \lyricsto "S" \LyricsWWV }
  \context Voice = "T" { \PartWVT }
  \context Lyrics = "LyrT" { \lyricsto "S" \LyricsWWV }
  \context Voice = "B" { \PartWVB }
  \context Lyrics = "LyrB" { \lyricsto "S" \LyricsWWV }
>>

ChoirX = <<
  \context Voice = "S" { \PartXS }
  \context Lyrics = "LyrS" { \lyricsto "S" \LyricsX }
  \context Voice = "A" { \PartXA }
  \context Lyrics = "LyrA" { \lyricsto "A" \LyricsX }
  \context Voice = "T" { \PartXT }
  \context Lyrics = "LyrT" { \lyricsto "T" \LyricsX }
  \context Voice = "B" { \PartXB }
  \context Lyrics = "LyrB" { \lyricsto "B" \LyricsX }
>>

ChoirJ = <<
  \context Voice = "S" { \PartJS }
  \context Lyrics = "LyrS" { \lyricsto "S" \LyricsJ }
  \context Voice = "A" { \PartJA }
  \context Lyrics = "LyrA" { \lyricsto "A" \LyricsJ }
  \context Voice = "T" { \PartJT }
  \context Lyrics = "LyrT" { \lyricsto "T" \LyricsJT }
  \context Voice = "B" { \PartJB }
  \context Lyrics = "LyrB" { \lyricsto "B" \LyricsJB }
>>

ChoirN = <<
  \context Voice = "S" { \PartNS }
  \context Lyrics = "LyrS" { \lyricsto "S" \LyricsNS }
  \context Voice = "A" { \PartNA }
  \context Lyrics = "LyrA" { \lyricsto "A" \LyricsNA }
  \context Voice = "T" { \PartNT }
  \context Voice = "B" { \PartNB }
  \context Lyrics = "LyrT" { \lyricsto "B" \LyricsNB }
  \context Lyrics = "LyrB" { \lyricsto "B" \LyricsNB }
>>

ChoirF = <<
  \context Voice = "S" { \PartFS }
  \context Lyrics = "LyrS" { \lyricsto "S" \LyricsFS }
  \context Voice = "A" { \PartFA }
  \context Lyrics = "LyrA" { \lyricsto "A" \LyricsFA }
  \context Voice = "T" { \PartFT }
  \context Lyrics = "LyrT" { \lyricsto "T" \LyricsFS }
  \context Voice = "B" { \PartFB }
  \context Lyrics = "LyrB" { \lyricsto "B" \LyricsFB }
>>

ChoirDVA = <<
  \context Voice = "S" { \PartDS }
  \context Lyrics = "LyrS" { \lyricsto "S" { \LyricsDVA \LyricsD } }
  \context Voice = "A" { \PartDA }
  \context Lyrics = "LyrA" { \lyricsto "A" { \LyricsDVA \LyricsD } }
  \context Voice = "T" { \PartDT }
  \context Lyrics = "LyrT" { \lyricsto "T" { \LyricsDVA \LyricsD } }
  \context Voice = "B" { \PartDB }
  \context Lyrics = "LyrB" { \lyricsto "B" { \LyricsDVA \LyricsD } }
>>

ChoirDVB = <<
  \context Voice = "S" { \PartDS }
  \context Lyrics = "LyrS" { \lyricsto "S" { \LyricsDVB \LyricsD } }
  \context Voice = "A" { \PartDA }
  \context Lyrics = "LyrA" { \lyricsto "A" { \LyricsDVB \LyricsD } }
  \context Voice = "T" { \PartDT }
  \context Lyrics = "LyrT" { \lyricsto "T" { \LyricsDVB \LyricsD } }
  \context Voice = "B" { \PartDB }
  \context Lyrics = "LyrB" { \lyricsto "B" { \LyricsDVB \LyricsD } }
>>

ChoirAll = {
  \StaffStub
  \ChoirI
  \ChoirIVA
  \ChoirI
  \ChoirIVB
  \ChoirW
  \ChoirN
  \ChoirPause { r8 r4 }
  \ChoirX
  \ChoirPause r4
  <<
    \ChoirJ
    { \ChoirChangeKey { \key d \major } s2*19 \ChoirChangeKey { \key g \major } }
  >>
  \ChoirPause { r4 }
  \ChoirX
  \ChoirPause { r4 }
  \ChoirDVA
  \ChoirDVB
  \ChoirPause { r4 }
  \ChoirWW
  \ChoirWWV
  \ChoirPause { r4 }
  \ChoirI
  \ChoirF
  \bar "|."
}

DrumAll = {
    \drummode {
      \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
      \mark \default
      \once\override Score.MetronomeMark.X-offset = 10
      \time 2/2 \tempo 2=75
      \partial 4 r4 |
      \repeat unfold 15 { mar4 mar4 mar4 mar4 | }
      mar2
      \tempo 4=120
      r4 r4
      \mark \default
      \time 3/4
      \repeat unfold 7 R2.
      \time 6/8
      \break
      \tempo 8=120
      R2.
      \mark \default
      \repeat unfold 11 R2.
      \time 2/2 \tempo 2=75
      mar4 mar4 mar4 mar4 |
      \mark \default
      \repeat unfold 7 { mar4 mar4 mar4 mar4 | }
      \tempo 2=85
      mar2.
      r4
      \mark \default
      \time 2/4 \tempo 4=85
      \repeat unfold 19 R2
      \mark \default
      \time 2/2
      \tempo 2=75
      \repeat unfold 8 { mar4 mar4 mar4 mar4 | }
      mar2. r4
      \mark \default
      \tempo 4=75
      \repeat unfold 5 R1
      \repeat unfold 6 R1
      \time 2/4
      R2
      \tempo 4=120
      \time 4/4
      R1
      \mark \default
      \time 3/4
      \repeat unfold 7 R2.
      \time 2/2
      \once\override Score.MetronomeMark.X-offset = #4
      \tempo 2=75
      \mark \default
      mar4 mar4 mar4 mar4 |
      \repeat unfold 11 { mar4 mar4 mar4 mar4 | }
      mar4 mar4 mar2
    }
  
}

Music = <<
  \ChoirAll
  \context DrumStaff {
    \DrumAll
  }
  \new Dynamics {
    \DrumAll
  }
>>

\book {
  \score {
    \Music
    \layout {
      #(layout-set-staff-size 18)
      \context {
        \Staff
        \RemoveAllEmptyStaves
      }
    }
  }
  \score {
    #(define ac:normalFactor '(2 . 3))
    #(define ac:legatoFactor '(1 . 1))
    \articulate {
      \Music
    }
    \midi {}
  }
  \paper {
    systems-per-page = 3
    system-count = 24
    two-sided = #'true
    right-margin = 20\mm
  }
}