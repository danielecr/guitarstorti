\version "2.18.2"

% Define function for creating note groups
pattern = #(define-music-function (notes fingers positions)
  #{
    \new Staff {
      \relative c' {
        \override NoteColumn.force-hshift = 0
        \override NoteColumn.force-hpadding = 0
        \override NoteColumn.force-hpadding = #0.3
        \override NoteColumn.force-hshift = #0.3

        % Create notes with finger and finger position indications
        \repeat unfold \length notes {
          \tweak text \markup { \concat { \finger { \nth \count \fingers } " " \concat { "P" (number->string (ly:number-pitch \nth \count \positions)) } } }
          \tweak style #'harmonic \note \count
        }
      }
    }
  #})

% Define your pattern
\pattern
  notes = { gis4 f1 fis4 g2 }
  fingers = { 4 1 1 2 }
  positions = { 1 1 2 2 }

