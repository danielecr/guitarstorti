\version "2.22.1"

% Define your pattern
notes = { gis'4 f'1 fis'4 g'2 }
fingers = { 4 1 1 2 }
positions = { "P1" "P1" "P2" "P2" }
chord = "C"

\new Staff {
  \relative c' {
    \override NoteColumn.force-hshift = 0
    \override NoteColumn.force-hpadding = 0
    \override NoteColumn.force-hpadding = #0.3
    \override NoteColumn.force-hshift = #0.3

    \chordmode { \chord }

    \repeat unfold \length notes {
      \once \override NoteHead.style = #'harmonic
      \tweak text \markup { \concat { \finger \nth \count fingers \concat { "P" (number->string (ly:number-pitch \nth \count positions)) } } }
      \notes \count
    }
  }
}

