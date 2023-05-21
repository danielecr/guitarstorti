\version "2.22.1"

% Define the chromatic function with start-pitch and duration parameters
#(define (chromatic start-pitch duration)
  (let loop ((n 1) (pitch (ly:make-pitch 0 start-pitch)) (result '()))
    (if (> n 12)
        result
        (loop (+ n 1)
              (ly:pitch-transpose pitch (ly:make-pitch 0 0 1/2))
              (cons (cons n (ly:make-music 'NoteEvent
                                           (list (list 'pitch pitch)
                                                 (list 'duration duration))))
                    result)))))
#

\relative c' {
  \score {
    \new Staff {
      % Call the chromatic function with start-pitch 0 and a default duration of 1/4
      \chromatic { 0 } { 16 }
    }
    \layout { }
    \midi { }
  }
}


