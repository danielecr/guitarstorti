\version "2.18.2"

% Define function for creating note groups
pattern = #(define-music-function (notes fingers positions)
  (make-music 'SequentialMusic
    (map
      (lambda (note finger position)
        (make-music 'NoteEvent
          'pitch note
          'articulations (list (make-music 'FingeringEvent finger) (make-music 'TextSpannerEvent (format "P~a" position)))))
      notes fingers positions)))

% Define your pattern
\pattern
  notes = { gis4 f1 fis4 g2 }
  fingers = { 4 1 1 2 }
  positions = { 1 1 2 2 }

