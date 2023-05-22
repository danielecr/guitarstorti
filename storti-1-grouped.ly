\header {
  title = "Dominio delle corde - schema 1"
  composer = "Mauro Storti"
}

#(set-global-staff-size 22)

#(define (naturalize-pitch p)
   (let ((o (ly:pitch-octave p))
         (a (* 4 (ly:pitch-alteration p)))
         ;; alteration, a, in quarter tone steps,
         ;; for historical reasons
         (n (ly:pitch-notename p)))
     (cond
      ((and (> a 1) (or (eqv? n 6) (eqv? n 2)))
       (set! a (- a 2))
       (set! n (+ n 1)))
      ((and (< a -1) (or (eqv? n 0) (eqv? n 3)))
       (set! a (+ a 2))
       (set! n (- n 1))))
     (cond
      ((> a 2) (set! a (- a 4)) (set! n (+ n 1)))
      ((< a -2) (set! a (+ a 4)) (set! n (- n 1))))
     (if (< n 0) (begin (set! o (- o 1)) (set! n (+ n 7))))
     (if (> n 6) (begin (set! o (+ o 1)) (set! n (- n 7))))
     (ly:make-pitch o n (/ a 4))))

#(define (naturalize music)
   (let ((es (ly:music-property music 'elements))
         (e (ly:music-property music 'element))
         (p (ly:music-property music 'pitch)))
     (if (pair? es)
         (ly:music-set-property!
          music 'elements
          (map naturalize es)))
     (if (ly:music? e)
         (ly:music-set-property!
          music 'element
          (naturalize e)))
     (if (ly:pitch? p)
         (begin
           (set! p (naturalize-pitch p))
           (ly:music-set-property! music 'pitch p)))
     music))

naturalizeMusic =
#(define-music-function (m)
   (ly:music?)
   (naturalize m))

fourOne =
\relative c' {
  gis16-\markup { \tiny 4 }^\markup {\bold I}
  f-\markup { \tiny 1 }
}

oneTwo = 
#(define-music-function
     (posi)
     (string?)
   #{
 fis-\markup { \tiny 1 }^\markup {\bold #posi }
 g-\markup { \tiny 2 }
#})

%% Ideally use:
%% \fourOne \naturalizeMusic \transpose c cis \oneTwo II
%% \fourOne \naturalizeMusic \transpose c d \oneTwo III
%% \fourOne \naturalizeMusic \transpose c dis \oneTwo IV
%% ...
%% and so on
%% but need to rework


schemaNumeroUno = 
\relative c' {
    \time 2/8
    \romanStringNumbers
    {
     gis16-\markup { \tiny 4 }^\markup {\bold I}
     f-\markup { \tiny 1 }
    }
    {
     fis-\markup { \tiny 1 }^\markup {\bold II}
     g-\markup { \tiny 2 }
    }
    {
     gis16-\markup { \tiny 4 }^\markup {\bold I}
     f-\markup { \tiny 1 }
    }
    {
     g-\markup { \tiny 1 }^\markup {\bold III}
     gis-\markup { \tiny 2 }
    }
    {
     gis16-\markup { \tiny 4 }^\markup {\bold I}
     f-\markup { \tiny 1 }
    }
    {
     gis-\markup { \tiny 1 }^\markup {\bold IV}
     a-\markup { \tiny 2 }
    }
    {
     gis16-\markup { \tiny 4 }^\markup {\bold I}
     f-\markup { \tiny 1 }
    }
    {
     a-\markup { \tiny 1 }^\markup {\bold V}
     ais-\markup { \tiny 2 }
    }
    {
     gis16-\markup { \tiny 4 }^\markup {\bold I}
     f-\markup { \tiny 1 }
    }
    {
     ais-\markup { \tiny 1 }^\markup {\bold VI}
     b-\markup { \tiny 2 }
    }
    {
     gis16-\markup { \tiny 4 }^\markup {\bold I}
     f-\markup { \tiny 1 }
    }
    {
     b-\markup { \tiny 1 }^\markup {\bold VII}
     c-\markup { \tiny 2 }
    }
    {
     gis16-\markup { \tiny 4 }^\markup {\bold I}
     f-\markup { \tiny 1 }
    }
    {
     c'-\markup { \tiny 1 }^\markup {\bold VIII}
     cis-\markup { \tiny 2 }
    }
    {
     gis16-\markup { \tiny 4 }^\markup {\bold I}
     f-\markup { \tiny 1 }
    }
    {
     cis'-\markup { \tiny 1 }^\markup {\bold IX}
     d-\markup { \tiny 2 }
    }

  }

\markup "La sesta corda"
\score {
  \schemaNumeroUno

  \layout {}
  \midi {}
}
\markup "La quinta corda"
\score {
   \naturalizeMusic \transpose ces e
  \schemaNumeroUno

  \layout {}
  \midi {}
}

\markup "La quarta corda"
\score {
   \naturalizeMusic \transpose ces a
  \schemaNumeroUno

  \layout {}
  \midi {}
}

\pageBreak

\markup "La terza corda"
\score {
   \naturalizeMusic \transpose ces d'
  \schemaNumeroUno


  \layout {}
  \midi {}
}

#(set-global-staff-size 23)

\markup "La seconda corda"
\score {
   \naturalizeMusic \transpose ces fis'
  \schemaNumeroUno


  \layout {}
  \midi {}
}

\markup "La prima corda"
\score {
   \naturalizeMusic \transpose ces b'
  \schemaNumeroUno


  \layout {}
  \midi {}
}