#lang sicp
(define (square x) (* x x))

(define (even? x) (= (remainder x 2) 0))

(define (expt-square b n)
    (define (expt-square-iter b n a)
        (cond ((= n 0) a)
              ((even? n) (expt-square-iter (square b) (/ n 2) a))
              (else (expt-square-iter b (- n 1) (* a b)))))
    (expt-square-iter b n 1))

(expt-square 1 0) ; 1
(expt-square 1 1) ; 1
(expt-square 1 2) ; 1
(expt-square 2 0) ; 1
(expt-square 2 1) ; 2
(expt-square 2 2) ; 4
(expt-square 2 3) ; 8
(expt-square 2 4) ; 16
(expt-square 2 5) ; 32
(expt-square 2 6) ; 64
(expt-square 5 0) ; 1
(expt-square 5 1) ; 5
(expt-square 5 3) ; 125
(expt-square 10 5) ; 10000
