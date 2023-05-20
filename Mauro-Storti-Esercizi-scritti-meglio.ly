\header {
  title = "Esercizi scritti meglio"
  composer = "Mauro Storti"
}

% posso definire una funzione come

rhythm =
#(define-music-function (p) (ly:pitch?)
   "Make the rhythm in Mars (the Planets) at the given pitch"
  #{ \tuplet 3/2 { $p 8 8 8 } 4 4 8 8 4 #})
  
% questa viene chiamata con p una nota, (ly:pitch?) fa qualcosa che trasforma il simbolo passato in una nota
% sembra che pitch voglia dire "nota"

pattern_one = #(define-music-function
     (note)
     (ly:pitch?)
     (make-relative (note) note
     #{
       $(ly:pitch-transpose note '3) 16 -\markup { \tiny 4 }^\4
       $(ly:pitch-transpose note '0) 16 -\markup { \tiny 1 }^\1
     #}))

% la mia intenzione e definire una funzione che generi un gruppo di 4 note, e cosi per tutte le corde
% 

\score {
  \relative c' {
    \time 2/8
    
    \romanStringNumbers
    {
     gis16-\markup { \tiny 4 }^\1
     f-\markup { \tiny 1 }
    }
    {
     fis-\markup { \tiny 1 }^\2
     g-\markup { \tiny 2 }
    }
    {
     gis16-\markup { \tiny 4 }^\1
     f-\markup { \tiny 1 }
    }
    {
     g-\markup { \tiny 1 }^\3
     gis-\markup { \tiny 2 }
    }
    {
     gis16-\markup { \tiny 4 }^\1
     f-\markup { \tiny 1 }
    }
    {
     gis-\markup { \tiny 1 }^\4
     a-\markup { \tiny 2 }
    }
    {
     gis16-\markup { \tiny 4 }^\1
     f-\markup { \tiny 1 }
    }
    {
     a-\markup { \tiny 1 }^\5
     ais-\markup { \tiny 2 }
    }
    {
     gis16-\markup { \tiny 4 }^\1
     f-\markup { \tiny 1 }
    }
    {
     ais-\markup { \tiny 1 }^\6
     b-\markup { \tiny 2 }
    }
    {
     gis16-\markup { \tiny 4 }^\1
     f-\markup { \tiny 1 }
    }
    {
     b-\markup { \tiny 1 }^\7
     c-\markup { \tiny 2 }
    }
    {
     gis16-\markup { \tiny 4 }^\1
     f-\markup { \tiny 1 }
    }
    {
     c'-\markup { \tiny 1 }^\8
     cis-\markup { \tiny 2 }
    }
    {
     gis16-\markup { \tiny 4 }^\1
     f-\markup { \tiny 1 }
    }
    {
     cis'-\markup { \tiny 1 }^\9
     d-\markup { \tiny 2 }
    }
  }


  \layout {}
  \midi {}
}
