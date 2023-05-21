\version "2.18.2"

% Define function for creating note groups
pattern = #(define-music-function (chord g1 f1 p1 f2 p2)
  #{
    <<
      \new ChordNames {
        \chordmode { <chord> }
      }
      \new TabStaff {
        \tabFullNotation {
          \repeat unfold 2 {
            \numericTabStaff {
              \stringTuning #"e, B, G, D, A, E"
              \fret <g1>
              \fret <f1> \fingering <p1>
            }
            \numericTabStaff {
              \stringTuning #"e, B, G, D, A, E"
              \fret <f2> \fingering <p2>
            }
          }
        }
      }
    >>
  #})

% Define your pattern
\pattern
  chord = 6
  g1 = { 4 }
  f1 = { 1 }
  p1 = { P1 }
  f2 = { 1 }
  p2 = { 2 }

