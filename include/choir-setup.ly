\layout {  
  \context {
    \Score {
      \accidentalStyle Score.choral
      \set Score.doubleRepeatBarType = ":|.|:"
    }
  }
  \context {
    \ChoirStaff
    \consists Span_bar_engraver
  }
}

break-align-orders-on-repeat = #(vector
                '(
                               staff-ellipsis
                               left-edge
                               cue-end-clef
                               ambitus
                               breathing-sign
                               optional-material-end-bracket
                               signum-repetitionis
                               cue-clef
                               staff-bar
                               clef
                               key-cancellation
                               key-signature
                               time-signature
                               optional-material-start-bracket
                               custos)

                              ;; unbroken
                              '(
                               staff-ellipsis
                               left-edge
                               optional-material-end-bracket
                               cue-end-clef
                               ambitus
                               breathing-sign
                               signum-repetitionis
                               cue-clef
                               staff-bar
                               clef
                               key-cancellation
                               key-signature
                               time-signature
                               optional-material-start-bracket
                               custos)

                              ;; begin of line
                              '(
                               staff-ellipsis
                               left-edge
                               optional-material-end-bracket
                               ambitus
                               breathing-sign
                               signum-repetitionis
                               clef
                               key-cancellation
                               key-signature
                               time-signature
                               staff-bar
                               cue-clef
                               optional-material-start-bracket
                               custos))
