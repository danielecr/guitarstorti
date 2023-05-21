\version "2.22.1"

% Define your pattern
notes = { gis4 f1 fis4 g2 }
fingers = { 4 1 1 2 }
positions = { "P1", "P1", "P2", "P2" }
chord = "C"

\new Staff {
  \relative c' {
    \override NoteColumn.force-hshift = 0
    \override NoteColumn.force-hpadding = 0
    \override NoteColumn.force-hpadding = #0.3
    \override NoteColumn.force-hshift = #0.3

    \chordmode { \chord }

    \repeat unfold \length notes {
      \tweak text \markup { \concat { \small \nth \count fingers \concat { "P" (number->string (ly:number-pitch \nth \count positions)) } } }
      \notes \count
    }
  }
}

