#(define-markup-command
  (abs-translate layout props arg rest)
  (pair? markup?)
  (let* ((x (car arg))
         (y (cdr arg))
         (scl (ly:output-def-lookup layout 'output-scale)))
    (interpret-markup layout props
      (markup #:translate (cons (/ x scl) (/ y scl)) rest))))

\paper {
  bookTitleMarkup = \markup {
    \override #'(baseline-skip . 3.5)
    \overlay {
      %\general-align #Y #0 { \epsfile #X #4 #"include/cyprus-accolada.eps" }
      \abs-translate #(cons (ly:cm -0.7) (ly:cm -0.4)) { \epsfile #X #5 #"include/cyprus-accolada.eps" }
      \center-column {
        \fill-line { \fromproperty #'header:dedication }
        \override #'(baseline-skip . 3.5)
        \line {
        \column {
          \hspace #1
        }
        \column {
          \fill-line {
            \huge \larger \larger \bold
            \fromproperty #'header:title
          }
          \fill-line {
            \large \bold
            \fromproperty #'header:subtitle
          }
          \fill-line {
            \smaller \bold
            \fromproperty #'header:subsubtitle
          }
          \fill-line {
            \fromproperty #'header:poet
            { \large \bold \fromproperty #'header:instrument }
            \fromproperty #'header:composer
          }
          \fill-line {
            \fromproperty #'header:meter
            \fromproperty #'header:arranger
          }
        }
        \column {
          \hspace #6
        }
        }
      }
    }
  }
}