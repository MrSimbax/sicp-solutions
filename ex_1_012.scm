#lang sicp
(define (pascal n k)
    (cond ((or (= k 0) (= k 1) (= k n)) 1)
          (else (+ (pascal (- n 1) (- k 1))
                   (pascal (- n 1) k)))))
; note: I ignored cases n < k and negative numbers
; and also assumed that (pascal n 0) = 1

(pascal 1 0) ; 1

(pascal 2 0) ; 1
(pascal 2 1) ; 1
(pascal 2 2) ; 1

(pascal 3 1) ; 1
(pascal 3 2) ; 2
(pascal 3 3) ; 1

(pascal 4 1) ; 1
(pascal 4 2) ; 3
(pascal 4 3) ; 3
(pascal 4 4) ; 1

(pascal 5 1) ; 1
(pascal 5 2) ; 4
(pascal 5 3) ; 6
(pascal 5 4) ; 4
(pascal 5 5) ; 1
