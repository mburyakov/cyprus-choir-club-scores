% https://lsr.di.unimi.it/LSR/Snippet?id=1154

% Snippet author: Jean Abou Samra <jean@abou-samra.fr>
% Original thread: https://lists.gnu.org/archive/html/lilypond-user/2022-11/msg00087.html
% 
% This snippet gets rid of uglinesses in note spacing caused by lyrics.
% By default, LilyPond always puts a lyric word exactly centered under
% the note it attaches to. When there is a long lyric word, LilyPond reserves
% space between notes so that there will be no collisions in the lyrics.
% However, this can lead to uneven note spacing. This snippet completely
% removes the presence of lyrics in note spacing so that it is natural
% according to the note lengths, and uses a spacing algorithm that shifts
% lyrics automatically in order to avoid collisions.
% 
% Some technical comments follow.
% 
% The spacing problem is set up as a quadratic optimization problem. Each
% lyric word has a strength value (by default, all words have a strength
% of 1.0). The demerit associated to a lyric word is s(x-p)², where s
% is the strength, x is the X coordinate and p is the ideal X coordinate
% where the lyric word would be centered on its associated note. An
% acceptable solution is a solution where no lyric words collide. The
% weight of a solution is the sum of the demerits for each of the words.
% Solving the lyric spacing problem means finding an acceptable solution
% of minimal weight.
% 
% In practice, words should not touch each other, but maintain a minimum
% distance between each other (controlled by LyricSpace.minimum-distance
% and LyricHyphen.minimum-distance). This is reduced to the form above
% by widening one of the two words for each LyricSpace or LyricHyphen
% grob, by the amount given by the minimum-space property.
% 
% The algorithm to solve the lyric spacing problem uses dynamic programming
% and runs in linear time. We add words one by one from left to right. After
% adding each word, the problem given by the words added so far is solved.
% The base case (zero words) is trivial. To add a word, it is very intuitive,
% and not hard to prove, that the following technique works: if adding
% the word at its optimal position produces no collision, then keep it
% there; else, make this word 'push' on its left neighbor and move these
% two words simultaneously to the left until the optimal position for
% these two words together is reached; if this still produces a collision
% then add the third word and consider the three words stuck together, etc.
% Note that once two words have been stuck together, they won't need
% to be taken apart again: they will be adjacent ("stuck") in the final
% configuration.
% 
% Written in this form, this algorithm looks quadratic. While probably
% acceptable in usual scores, this might become a problem with ly:one-line-breaking.
% However, with a bit of simple algebra, you can see that optimizing for two
% words stuck together (and, by extension, any finite number of words stuck
% together) is equivalent to optimizing for one single (imaginary) combined
% word, of which the length is the sum of the two lengths, the strength is
% the sum of the strengths, and the optimal coordinate is given by a simple
% formula (see the code). Therefore, instead of simultaneously considering
% two words stuck together, you can replace them with just one fresh problem
% variable. At each word added during the algorithm, there is a constant processing
% overhead, plus an overhead linear in the number of times a word is newly
% stuck to a group, forming a new group. If you imagine that all words start
% out black, and every word becomes white as soon as its group is stuck to
% the group on the left, it is clear that the total number of "add to group"
% operations is linear in the number of words. At the end, there is a
% step to compute the offset of each word from that of its group, which
% is made linear by caching the offset of a group as soon as it is
% visited. In this way, the total number of operations is linear.
% 

% #(ly:set-option 'compile-scheme-code)

#(use-modules (ice-9 match)
              (ice-9 hash-table)
              (oop goops))

%% convenience stuff:

#(define-syntax-rule (transform! lval proc)
   (set! lval (proc lval)))

#(define ->
   (make-procedure-with-setter
    (lambda (instance . path)
      (let loop ((instance instance) (path path))
        (match path
          ((slot)
           (slot-ref instance slot))
          ((slot . rest)
           (loop (slot-ref instance slot)
                 rest)))))
    (lambda (instance . args)
      (let loop ((instance instance) (args args))
        (match args
         ((slot new)
          (slot-set! instance slot new))
         ((slot . rest)
          (loop (slot-ref instance slot)
                rest)))))))



#(define-class <lyric-variable> ()
   (ideal #:init-keyword #:ideal)
   (extent #:init-keyword #:extent)
   (strength #:init-keyword #:strength)
   (tied-to #:init-value #f)
   (tied-offset #:init-value #f)
   (final #:init-value #f))

#(define (merged-variable! group var)
   (let* ((delta (- (interval-end (-> group 'extent))
                    (interval-start (-> var 'extent))))
          (new
           (make <lyric-variable>
                 #:ideal (/ (+ (* (-> group 'strength)
                                  (-> group 'ideal))
                               (* (-> var 'strength)
                                  (- (-> var 'ideal)
                                     delta)))
                            (+ (-> group 'strength)
                               (-> var 'strength)))
                 #:extent (cons (interval-start (-> group 'extent))
                                (+ (interval-end (-> group 'extent))
                                   (interval-length (-> var 'extent))))
                 #:strength (+ (-> group 'strength)
                               (-> var 'strength)))))
     (set! (-> group 'tied-to) new)
     (set! (-> group 'tied-offset) 0)
     (set! (-> var 'tied-to) new)
     (set! (-> var 'tied-offset) delta)
     new))

#(define (propagate! variables)
   (match variables
     ((var)
      variables)
     ((var group . rest)
      (let ((have-overlap (<= (+ (-> var 'ideal)
                                 (interval-start (-> var 'extent)))
                              (+ (-> group 'ideal)
                                 (interval-end (-> group 'extent))))))
        (if have-overlap
            (let ((merged (merged-variable! group var)))
              (propagate! (cons merged rest)))
            variables)))))

#(define (finalize! variables)
   (define (finalize-one! var)
     (unless (-> var 'final)
       (set! (-> var 'final)
             (if (-> var 'tied-to)
                 (begin
                  (finalize-one! (-> var 'tied-to))
                  (+ (-> var 'tied-to 'final)
                     (-> var 'tied-offset)))
                 (-> var 'ideal)))))
   (for-each finalize-one! variables))

#(define (solve-lyric-spacing-problem! variables)
   (fold
    (lambda (var groups)
      (propagate! (cons var groups)))
    '()
    variables)
   (finalize! variables))

#(define (respace-lyrics! grob)
   (let ((elt-array (ly:grob-object grob 'elements #f)))
     (when elt-array
       (let* ((elts (ly:grob-array->list elt-array))
              (refp (ly:grob-system grob))
              (with-iface (lambda (iface)
                            (filter (lambda (g)
                                      (grob::has-interface g iface))
                                    elts)))
              (words (filter (lambda (word)
                               (interval-sane? (ly:grob-extent word word X)))
                             (with-iface 'lyric-syllable-interface)))
              ;; Includes both LyricHyphen and LyricSpace
              (constraints (with-iface 'lyric-hyphen-interface))
              (variables (map
                          (lambda (word)
                            (let* ((xalign (ly:grob-property word 'self-alignment-X))
                                   (coord (ly:grob-relative-coordinate word refp X))
                                   (orig-ext (ly:grob-extent word word X))
                                   (align-point (interval-index orig-ext xalign))
                                   (ideal (+ coord align-point))
                                   (extent (coord-translate orig-ext (- align-point)))
                                   (strength (or (assq-ref (ly:grob-property word 'details)
                                                           'strength)
                                                 1.0)))
                              (make <lyric-variable>
                                    #:ideal ideal
                                    #:extent extent
                                    #:strength strength)))
                          words))
              (word-to-variable (alist->hashq-table (map cons words variables))))
         (for-each
          (lambda (constraint)
            (let ((added (ly:grob-property constraint 'minimum-distance))
                  (left-var (hashq-ref word-to-variable (ly:spanner-bound constraint LEFT))))
              (when left-var
                (transform! (-> left-var 'extent)
                            (lambda (e) (cons (interval-start e)
                                              (+ (interval-end e) added)))))))
          constraints)
         (solve-lyric-spacing-problem! variables)
         (for-each
          (lambda (word variable)
            (let* ((xalign (ly:grob-property word 'self-alignment-X))
                   (orig-ext (ly:grob-extent word word X))
                   (align-point (interval-index orig-ext xalign)))
              (ly:grob-translate-axis!
               word
               (- (-> variable 'final)
                  (ly:grob-relative-coordinate word refp X)
                  align-point)
               X)))
          words
          variables)))))

% A StanzaNumber is side-positioned against lyric words.
% Its X-offset will be computed before line breaking, with
% default offset values, then these values will change, so
% we have to update it.
#(define (recompute-offset-with-moved-lyrics! grob)
   (let ((support (ly:grob-object grob 'side-support-elements #f)))
     (when support
       ;; Make sure each LyricText in the support goes to its
       ;; updated location.
       (for-each
        (lambda (word)
          (let ((axis-group (ly:grob-parent word Y)))
            (ly:grob-property axis-group 'after-line-breaking)))
        (ly:grob-array->list support))
       (let* ((parent (ly:grob-parent grob X))
              (coord (ly:grob-relative-coordinate grob parent X)))
         (ly:grob-translate-axis!
          grob
          (- (ly:side-position-interface::x-aligned-side grob)
             coord)
          X)))))

\layout {
  \context {
    \Lyrics
    \override LyricText.extra-spacing-width = #'(+inf.0 . -inf.0)
    \override LyricSpace.springs-and-rods = ##f
    \override LyricHyphen.springs-and-rods = ##f
    \override VerticalAxisGroup.after-line-breaking = #respace-lyrics!
    \override StanzaNumber.after-line-breaking = #recompute-offset-with-moved-lyrics!
  }
}

doReserveSpace =
\once {
  \revert LyricSpace.springs-and-rods
  \revert LyricHyphen.springs-and-rods
}
