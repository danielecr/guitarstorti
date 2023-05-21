\version "2.18.2"

% Define function for creating note groups
pattern = #(define-music-function (g1 f1 p1 f2 p2)
  #{
    \new Staff {
      \relative c' {
        \override NoteColumn.force-hshift = 0
        \override NoteColumn.force-hpadding = 0
        \override NoteColumn.force-hpadding = #0.3
        \override NoteColumn.force-hshift = #0.3

        % Group 1
        <g1>4 \finger <p1> |
        <f1> \finger |
        
        % Group 2
        <f2> \finger <p2> |
        <g1>2 \finger |
      }
    }
  #})

% Define your pattern
\pattern
  g1 = { "G#" }
  f1 = { "F" }
  p1 = { "1" }
  f2 = { "F#" }
  p2 = { "2" }

