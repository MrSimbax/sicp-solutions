#lang sicp

(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (even? x) (= (remainder x 2) 0))

(define (fast-mult a b)
    (cond ((= b 0) 0)
          ((even? b) (fast-mult (double a) (halve b)))
          (else (+ a (fast-mult a (- b 1))))))

(fast-mult 0 0) ; 0
(fast-mult 1 0) ; 0
(fast-mult 2 0) ; 0
(fast-mult 0 1) ; 0
(fast-mult 0 2) ; 0
(fast-mult 1 1) ; 1
(fast-mult 1 2) ; 2
(fast-mult 1 3) ; 3
(fast-mult 2 1) ; 2
(fast-mult 2 2) ; 4
(fast-mult 2 3) ; 6
(fast-mult 3 1) ; 3
(fast-mult 1 2) ; 2
(fast-mult 3 2) ; 6
