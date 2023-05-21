\header {
  title = "Esercizi scritti meglio"
  composer = "Mauro Storti"
}

#(define (numsToNotes scaleNotes step)  
  (define-music-function 
     (parser location start end dur)  
        (number? number? number?)  
        #{  
            $(ly:parser-include-string  
               parser  
               (get-scale start end scaleNotes dur step)) 
        #} 
       ) 
  ) 
#(define (get-note x scale)  
   (cdr (assoc (modulo x (length scale)) scale)) 
   ) 
#(define (get-scale start end scale dur step) 
   (foldr string-append  
          (cons (string-append (get-note start scale)  
                               (number->string dur))  
                (map (lambda (x) (string-append " " (get-note x scale)))  
                     (range ((if (< start end) + -) start step) end step))) 
   ) 
  ) 

#(define (chromatic start-pitch)
  (let loop ((n 1) (pitch (ly:make-pitch 0 start-pitch)) (result '()))
    (if (> n 12)
        result
        (loop (+ n 1)
              (ly:pitch-transpose pitch (ly:make-pitch 0 0 1/2))
              (cons (cons n pitch) result)))))


%{ Standard utility functions  %} 
#(define (foldr func li) 
   (define (h x li) 
     (if (null? li) 
       x 
       (h (func x (car li)) (cdr li)))) 
   (h (func (car li) (car (cdr li))) (cdr (cdr li)))) 

#(define (range x y st) 
   (define (h li x st cmp)  
     (if (cmp x y)   
       li 
       (h (cons x li) (+ x st) st cmp))) 
   (reverse (h '() x (if (< x y) (abs st) (* -1 (abs st))) (if (< x y) > <)))) 

#(define Chr-sharp-notes
  '((0 . "c") 
    (1 . "cis")
    (2 . "d")
    (3 . "dis")
    (4 . "e") 
    (5 . "f")
    (6 . "fis") 
    (7 . "g")  
    (8 . "gis")
    (9 . "a")
    (10 . "ais")
    (11 . "b")))
#(define Chr-flat-notes
  '((0 . "c") 
    (1 . "des")
    (2 . "d") 
    (3 . "es") 
    (4 . "e") 
    (5 . "f") 
    (6 . "ges")
    (7 . "g") 
    (8 . "as") 
    (9 . "a") 
    (10 . "bes")
    (11 . "b")))

flatChromatic = #(numsToNotes Chr-flat-notes 2)
sharpChromatic = #(numsToNotes Chr-sharp-notes 1)


\score {
  \relative c' {
    \time 2/8
    \sharpChromatic #9 #19 #4
       \flatChromatic #17 #9 #4
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