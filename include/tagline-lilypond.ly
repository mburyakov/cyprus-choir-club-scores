taglineText =
#(define-scheme-function
    (language)
    (string?)
  (cond
        ((string= language "latin") (format #f "Haec partitura Lilypondo ~a insculpta est." (lilypond-version)))
        ((string= language "italian") (format #f "Questa partitura è incisa da Lilypond ~a." (lilypond-version)))
        ((string= language "russian") (format #f "Набрано с помощью LilyPond ~a." (lilypond-version)))
        ((string= language "ukrainian") (format #f "Набрано за допомогою LilyPond ~a." (lilypond-version)))
        ((string= language "croatian") (format #f "Ovu partituru je gravirao LilyPond ~a" (lilypond-version)))
        ((string= language "english") (format #f "This score was engraved with LilyPond ~a" (lilypond-version)))
        (else (format #f "This score was engraved with LilyPond ~a" (lilypond-version)))))

\header {
  tagline = \markup { \fontsize #-8 { \taglineText \taglineLanguage } }
}