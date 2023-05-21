\version "2.22.1"

% Define function for creating note groups
pattern = #(define-music-function (notes fingers positions)
  (let ((music '()))
    (map
      (lambda (note finger position)
        (set! music (append music (list (make-music 'NoteEvent
                                            'pitch note
                                            'articulations (list (make-music 'FingeringEvent finger)
                                                                 (make-music 'TextSpannerEvent (format "P~a" position))))))))
      notes fingers positions)
    music))

% Define your pattern
\pattern
  notes = { gis4 f1 fis4 g2 }
  fingers = { 4 1 1 2 }
  positions = { 1 1 2 2 }

