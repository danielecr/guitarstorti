# Project

~~~
creare una cromatic_from = lambda (note):
data una nota di partenza, generare 12 note (pitch) ascendenti a distanza di un semitono una dall'altra (scala cromatica) ed inserirli in una struttura associativa

creare una lambda (note a b c d):
cf = cromatic_from(note)
sequenza di distanze: (2 3 4 5 6 7 8 9)
generare { cf(a) cf(b) cf(c+delta) cf(d+delta) }
~~~


1. cosa è una struttura associativa?
2. come generare una serie di note a distanza di un semitono? (come fare addizione o transposizione?)


(define chromatic
  (lambda (start-pitch)
    (let loop ((n 1) (pitch start-pitch) (result '()))
      (if (> n 12)
          result
          (loop (+ n 1)
                (ly:pitch-transpose pitch 1)
                (cons (cons n pitch) result))))))

; Example usage
(display (chromatic 'cis)) ; Prints: ((1 . cis) (2 . d) (3 . dis) (4 . e) (5 . f) (6 . fis) (7 . g) (8 . gis) (9 . a) (10 . ais) (11 . b) (12 . c))


(define (chromatic start-pitch)
  (let loop ((n 1) (pitch start-pitch) (result '()))
    (if (> n 12)
        result
        (loop (+ n 1)
              (ly:pitch-transpose pitch 1)
              (cons (cons n pitch) result)))))

; Example usage
(display (chromatic 'cis)) ; Prints: ((1 . cis) (2 . d) (3 . dis) (4 . e) (5 . f) (6 . fis) (7 . g) (8 . gis) (9 . a) (10 . ais) (11 . b) (12 . c))



(define (chromatic start-pitch)
  (let loop ((n 1) (pitch (ly:make-pitch start-pitch 0)) (result '()))
    (if (> n 12)
        result
        (loop (+ n 1)
              (ly:pitch-transpose pitch 1)
              (cons (cons n (ly:pitch-to-string pitch)) result)))))

; Example usage
(display (chromatic 'cis)) ; Prints: ((1 . cis) (2 . d) (3 . dis) (4 . e) (5 . f) (6 . fis) (7 . g) (8 . gis) (9 . a) (10 . ais) (11 . b) (12 . c))


(define (chromatic start-pitch)
  (let loop ((n 1) (pitch (ly:make-pitch 0 start-pitch)) (result '()))
    (if (> n 12)
        result
        (loop (+ n 1)
              (ly:pitch-transpose pitch (ly:make-pitch 0 0 SHARP))
              (cons (cons n (ly:pitch-notename pitch)) result)))))

; Example usage
(display (chromatic 0)) ; Prints: ((1 . c) (2 . cis) (3 . d) (4 . dis) (5 . e) (6 . f) (7 . fis) (8 . g) (9 . gis) (10 . a) (11 . ais) (12 . b))


(define (chromatic start-pitch)
  (let loop ((n 1) (pitch (ly:make-pitch 0 start-pitch)) (result '()))
    (if (> n 12)
        result
        (loop (+ n 1)
              (ly:pitch-transpose pitch (ly:make-pitch 0 0 1/2))
              (cons (cons n pitch) result)))))

; Example usage
(display (chromatic 0)) ; Prints: ((1 . c) (2 . cis) (3 . d) (4 . dis) (5 . e) (6 . f) (7 . fis) (8 . g) (9 . gis) (10 . a) (11 . ais) (12 . b))



(define (position element lst)
  (let loop ((index 0) (remaining lst))
    (cond
      ((null? remaining) #f)
      ((equal? element (car remaining)) index)
      (else (loop (+ index 1) (cdr remaining))))))
(define (chromatic start-pitch)
  (let* ((start-pitch-index (position start-pitch '("c" "cis" "d" "dis" "e" "f" "fis" "g" "gis" "a" "ais" "b")))
         (initial-pitch (ly:make-pitch 0 start-pitch-index 0))
         (pitch (ly:make-pitch initial-pitch)))
    (let loop ((n 1) (result '()))
      (if (> n 12)
          result
          (begin
            (set! pitch (ly:pitch-transpose pitch (ly:make-pitch 0 1/2)))
            (loop (+ n 1) (cons (cons n pitch) result)))))))

; Example usage
(display (chromatic 'cis)) ; Prints: ((1 . cis) (2 . d) (3 . dis) (4 . e) (5 . f) (6 . fis) (7 . g) (8 . gis) (9 . a) (10 . ais) (11 . b) (12 . c)))


(define (position element lst)
  (let loop ((index 0) (remaining lst))
    (cond
      ((null? remaining) #f)
      ((equal? element (car remaining)) index)
      (else (loop (+ index 1) (cdr remaining))))))

(define (chromatic start-pitch)
  (let* ((start-pitch-index (position start-pitch '("c" "cis" "d" "dis" "e" "f" "fis" "g" "gis" "a" "ais" "b")))
         (initial-pitch (ly:make-pitch 0 start-pitch-index 0))
         (pitch (ly:make-pitch initial-pitch)))
    (let loop ((n 1) (result '()))
      (if (> n 12)
          result
          (begin
            (set! pitch (ly:pitch-transpose pitch (ly:make-pitch 0 1/2)))
            (loop (+ n 1) (cons (cons n pitch) result)))))))

; Example usage
(display (chromatic 'cis)) ; Prints: ((1 . cis) (2 . d) (3 . dis) (4 . e) (5 . f) (6 . fis) (7 . g) (8 . gis) (9 . a) (10 . ais) (11 . b) (12 . c))



(define (position element lst)
  (let loop ((index 0) (remaining lst))
    (cond
      ((null? remaining) #f)
      ((equal? element (car remaining)) index)
      (else (loop (+ index 1) (cdr remaining))))))
(define (chromatic start-pitch)
  (let* ((start-pitch-index (position start-pitch '("c" "cis" "d" "dis" "e" "f" "fis" "g" "gis" "a" "ais" "b")))
         (initial-pitch (ly:make-pitch 0 start-pitch-index))
         (pitch initial-pitch))
    (let loop ((n 1) (result '()))
      (if (> n 12)
          result
          (begin
            (set! pitch (ly:pitch-transpose pitch (ly:make-pitch 0 0 1/2)))
            (loop (+ n 1) (cons (cons n pitch) result)))))))

; Example usage
(display (chromatic 'cis)) ; Prints: ((1 . cis) (2 . d) (3 . dis) (4 . e) (5 . f) (6 . fis) (7 . g) (8 . gis) (9 . a) (10 . ais) (11 . b) (12 . c))




(define (chromatic start-pitch)
  (let loop ((n 1) (pitch (ly:make-pitch 0 start-pitch)) (result '()))
    (if (> n 12)
        result
        (loop (+ n 1)
              (ly:pitch-transpose pitch (ly:make-pitch 0 0 1/2))
              (cons (cons n pitch) result)))))

#(define (chromatic start-pitch duration)
  (let loop ((n 1) (pitch (ly:make-pitch 0 start-pitch)) (result '()))
    (if (> n 12)
        result
        (loop (+ n 1)
              (ly:pitch-transpose pitch (ly:make-pitch 0 0 1/2))
              (cons (cons n (ly:make-music 'note pitch duration)) result)))))

; Example usage
(display (chromatic 0)) ; Prints: ((1 . c) (2 . cis) (3 . d) (4 . dis) (5 . e) (6 . f) (7 . fis) (8 . g) (9 . gis) (10 . a) (11 . ais) (12 . b))



(define (position element lst)
  (let loop ((index 0) (remaining lst))
    (cond
      ((null? remaining) #f)
      ((equal? element (car remaining)) index)
      (else (loop (+ index 1) (cdr remaining))))))

(define (chromatic start-pitch)
  (let* ((start-pitch-index (position start-pitch '("c" "cis" "d" "dis" "e" "f" "fis" "g" "gis" "a" "ais" "b")))
         (quotient (quotient start-pitch-index 2))
         (remainder (remainder start-pitch-index 2))
         (initial-pitch (ly:make-pitch 0 quotient (/ remainder 2)))
         (pitch initial-pitch))
    (let loop ((n 1) (result '()))
      (if (> n 12)
          result
          (begin
            (set! pitch (ly:pitch-transpose pitch (ly:make-pitch 0 0 1/2)))
            (loop (+ n 1) (cons (cons n pitch) result)))))))

; Example usage
(display (chromatic 'cis)) ; Prints: ((1 . cis) (2 . d) (3 . dis) (4 . e) (5 . f) (6 . fis) (7 . g) (8 . gis) (9 . a) (10 . ais) (11 . b) (12 . c))




(define (chromatic start-pitch)
  (let* ((start-pitch-index (position start-pitch '("c" "cis" "d" "dis" "e" "f" "fis" "g" "gis" "a" "ais" "b")))
         (quotient (quotient start-pitch-index 2))
         (remainder (remainder start-pitch-index 2))
         (initial-pitch (ly:make-pitch 0 quotient (/ remainder 2)))
         (pitch initial-pitch))
    (let loop ((n 1) (result '()))
      (if (> n 12)
          result
          (begin
            (set! pitch (ly:pitch-transpose pitch (ly:make-pitch 0 0 1/2)))
            (loop (+ n 1) (cons (cons n pitch) result))))))

; Example usage
(display (chromatic 'cis)) ; Prints: ((1 . cis) (2 . d) (3 . dis) (4 . e) (5 . f) (6 . fis) (7 . g) (8 . gis) (9 . a) (10 . ais) (11 . b) (12 . c))




https://lsr.di.unimi.it/LSR/Snippet?id=266