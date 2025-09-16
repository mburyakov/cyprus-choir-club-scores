\version "2.24"

\language "deutsch"

taglineLanguage = "croatian"
\include "include/cyprus-logo.ly"
\include "include/tagline-lilypond.ly"
\include "include/choir-setup.ly"

\header {
  title = "Vilo moja"
  poet = \markup { \italic { "Stihovi: V. Juretić" } }
  composer = \markup { \italic { "Glazba: I. Badurina" } }
  arranger = \markup { \italic { "Obrada: I. Frleta ml." } }
}

\layout {
    \context {
    \Staff {
      \set autoBeaming=##f
    }
  }
}

PartSoloU = \relative c' {
  r2 c8 d8 f8 d8 |
  g2~ g8 r8 d8 f8 |
  g2~ g8 r8 r8 g8 |
  b4. a8 a2~ |
  a4. r8 c,8 d8 f8 d8 |
  g8 g4.~ g8 r8 d8 f8 |
  g2~ g8 r8 f8 g8 b4.( a8) a2~ |
  a4 a8 h8 cis8 d8 e8 a,8 |
  f'2~ f8 e8 d8 f8 |
  e2~ e8 r8 c8 e8 |
  d4 b4 a4 g4 |
  b4. a8 a8. g16~ g8 f8 |
  g1~ |
  g2~ g8 r8 r4 |
}

PartSoloV = \relative c' {
  f2 g4. a8 |
  a2~ a8 b8 b8. a16 |
  a2~ a8 g8 g8. f16 |
  f4. f8 f8 g8 a8 c8 |
  \repeat volta 2 {
    f2 f8 e8 c8. a16 |
    c2 d8 c8 f,8 g8 |
    a2~ a8 g8 g8. f16 |
    \alternative {
      \volta 1 { f4. f8 f8 g8 a8 c8 }
      \volta 2 { f,2 r8 b8 b8. a16 }
    }
  }
  a2~ a8 g8 g8. f16 |
  f2~ f8 b8 b8. a16 |
  a2 r2 |
  R1 |
  \bar "|."
}

PartSU = \relative c' {
  R1
  d1 |
  e2.~ e8 r8 |
  f4. f8 e2 |
  f1 |
  g2. f4~ |
  f2 e2 |
  d'4.( c8) c2 |
  d2 cis2 |
  r8 d4 d8 d4 r4 |
  r8 c4 c8 c4 c8 c8 |
  d4 d4 d4 d4 |
  e4. r8 r2 |
  r2 f8 e4 d8 |
  e2~ e8 r8 r4 |
}

PartSV = \relative c' {
  f2 g4. a8 |
  a2~ a8 d8 d8. c16 |
  c2~ c8 b8 b8. a16 |
  a4. r8 r2 |
  \repeat volta 2 {
    d2 d8 d8 d8. f16 |
    e2 b8 b8 b8 b8 |
    f2( e8) e8 e8 e8 |
    \alternative {
      \volta 1 { f4. r8 r2 }
      \volta 2 { f2 r8 d'8 d8. c16 }
    }
  }
  c2~ c8 b8 b8. a16 |
  a2~ a8 d8 d8. c16 |
  c2 r8 b8 b8 b8 |
  f'1 |
}

PartAU = \relative c' {
  R1
  b1 |
  c2.~ c8 r8 |
  d4. c8 c2 |
  d1 |
  d1 |
  c1 |
  f4.( f8) e2 |
  e1 |
  r8 f4 f8 f4 r4 |
  r8 e4 e8 e4 e8 e8 |
  f4 f4 f4 f4 |
  g4. r8 r2 |
  r2 c8 c4 c8 |
  c2~ c8 r8 r4 |
}

PartAV = \relative c' {
  f2 g4. a8 |
  a2~ a8 b8 b8. a16 |
  a2~ a8 g8 g8. f16 |
  f4. r8 r2 |
  \repeat volta 2 {
    f2 f8 f8 f8. f16 |
    a2 d,8 d8 d8 d8 |
    c2( c8) c8 c8 c8 |
    \alternative {
      \volta 1 { c4. r8 r2 }
      \volta 2 { c2 r8 b'8 b8. a16 }
    }
  }
  a2~ a8 g8 g8. f16 |
  f2~ f8 b8 b8. a16 |
  a2 r8 <d, f>8 <des f>8 <des f>8 |
  <c f>1 |
}

PartTU = \relative c' {
  R1
  g1 |
  g2.~ g8 r8 |
  b4. a8 a2 |
  a1 |
  b1 |
  g1 |
  b4.( a8) a2 |
  a1 |
  r8 a4 a8 a4 r4 |
  r8 a4 a8 a4 a8 a8 |
  b4 b4 b4 b4 |
  a4. r8 r2 |
  r2 c8 c4 c8 |
  c2~ c8 r8 r4 |
}

PartTV = \relative c {
  r8 f8 f8. f16 f8 r8 r4 |
  r8 f8 f8. f16 f8 r8 r4 |
  r8 f8 f8. f16 f8 r8 r4 |
  R1 |
  \repeat volta 2 {
    a2 a8 a8 a8. a16 |
    c2 f,8 f8 f8 f8 |
    a2( g8) g8 g8 g8 |
    \alternative {
      \volta 1 { a4. r8 r2 }
      \volta 2 { a8 f8 f8. f16 f8 r8 r4 }
    }
  }
  r8 f8 f8. f16 f8 r8 r4 |
  r8 f8 f8. f16 f8 f8 f8. f16 |
  f2 r8 f8 f8 f16[( g16]) |
  a1 |
}


PartBU = \relative c {
  R1
  g1 |
  c2.~ c8 r8 |
  b4. f8 a2 |
  d1 |
  g,2. b4 |
  c1 |
  b4.( f8) f2 |
  a1 |
  r8 d4 d8 d4 r4 |
  r8 a4 a8 a4 a8 a8 |
  b4 b4 b4 b4 |
  a4. r8 r2 |
  r2 c8 c4 c8 |
  c2~ c8 r8 r4 |
}

PartBV = \relative c {
  r8 f8 f8. f16 f8 r8 r4 |
  r8 f8 f8. f16 f8 r8 r4 |
  r8 f8 f8. f16 f8 r8 r4 |
  R1 |
  \repeat volta 2 {
    d2 d8 d8 d8. d16 |
    a2 b8 b8 b8 b8 |
    f'2( c8) c8 c8 c8 |
    \alternative {
      \volta 1 { f,4. r8 r2 }
      \volta 2 { f8 f'8 f8. f16 f8 r8 r4  }
    }
  }
  r8 f8 f8. f16 f8 r8 r4 |
  r8 f8 f8. f16 f8 f8 f8. f16 |
  f2 r8 b,8 b8 b8 |
  f1 |
}

LyricsSolo = \lyricmode {
  Sko -- ro sva -- ki put
  kad se mi
  po -- gle -- da -- mo
  ti i ne od -- zdra -- viš
  ko da se ne po -- zna -- mo
  a da mi te k_se -- bi zvat
  kad ćeš za -- spat
  pr -- vo sna da ti re -- čen
  da vo -- lin te još.
  
  Vi -- lo mo -- ja
  ti si moj san, ti si moj san,
  al la -- gje bi -- lo
  \repeat volta 2 {
    bi
    da si tu -- ja mi
    da te ne po -- znan
    da te ne \alternative {
      \volta 1 { znan, al la -- gje bi -- lo }
      \volta 2 { znan. Vi -- lo mo -- }
    }
  }
  ja,
  vi -- lo mo -- ja,
  vi -- lo mo -- ja.
}

LyricsS = \lyricmode {
  _
  gle -- da -- mo
  _
  _ _ _ _
  zna -- mo
  _ _
  se -- bi zvat
  ćeš za -- spat
  pr -- vo sna da ti re -- čen
  vo -- lin te još.
  
  Vi -- lo mo -- ja
  ti si moj san, ti si moj san,
  
  \repeat volta 2 {
    bi
    da si tu -- ja mi
    da te ne po -- znan
    da te ne \alternative {
      \volta 1 { znan, }
      \volta 2 { znan. Vi -- lo mo -- }
    }
  }
  ja,
  vi -- lo mo -- ja,
  vi -- lo mo -- ja,
  vi -- lo mo -- ja.
}

LyricsB = \lyricmode {
  _
  _ _ _
  _
  _ _ _ _
  _ _
  _
  _ _ _
  _ _ _
  _ _ _ _ _ _ _
  _ _ _ _
  
  Vi -- lo mo -- ja,
  vi -- lo mo -- ja,
  vi -- lo mo -- ja
  
  \repeat volta 2 {
    bi
    da si tu -- ja mi
    da te ne po -- znan
    da te ne \alternative {
      \volta 1 { znan. }
      \volta 2 { znan. Vi -- lo mo -- }
    }
  }
  ja,
  vi -- lo mo -- ja,
  vi -- lo mo -- ja,
  vi -- lo mo -- ja,
  vi -- lo mo -- ja.
}

Music = {
    <<
      \new Staff = "Solo" \with {
        %midiMaximumVolume = 1.0
        %midiInstrument = "viola"
      } <<
        \clef "treble"
        \key f \major
        \new Voice = "PartSolo" { \PartSoloU \PartSoloV }
      >>
      \new Lyrics \lyricsto "PartSolo" {
        \LyricsSolo
      }
      \new ChoirStaff <<
        \new Staff = "A" <<
          \clef "treble	"
          \key f \major
          \new Voice = "PartS" { \voiceOne \PartSU \PartSV }
          \new Voice = "PartA" { \voiceTwo \PartAU \PartAV }
        >>
        \new Lyrics \lyricsto "PartS" {
          \LyricsS
        }
        \new Staff = "B" <<
          \clef "bass"
          \key f \major
          \new Voice = "PartT" { \voiceOne \PartTU \PartTV }
          \new Voice = "PartB" { \voiceTwo \PartBU \PartBV }
        >>
        \new Lyrics \lyricsto "PartB" {
          \LyricsB
        }
      >>
    >>
}

\book {
  \bookOutputSuffix "d"
  \score {
    \Music
    \layout{
      \context {
        \Score
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16)
      }
    }
  }
  \score {
    \unfoldRepeats
    \Music
    \midi {
      \tempo 4 = 70
      \context {
        \Staff
        % midiInstrument = "viola"
      }
    }
  }
  \paper {
    system-count = 8
  }
}