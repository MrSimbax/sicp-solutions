#lang sicp
(define (f-rec n)
  (cond ((< n 3) n)
        (else (+ (f-rec (- n 1))
                 (* 2 (f-rec (- n 2)))
                 (* 3 (f-rec (- n 3)))))))

(f-rec 0) ; 0
(f-rec 1) ; 1
(f-rec 2) ; 2
(f-rec 3) ; 4
(f-rec 4) ; 11
(f-rec 5) ; 25

(define (f-iter n)
  (define (iter n a b c)
    (if (= n 0)
        c
        (iter (- n 1) (+ a (* 2 b) (* 3 c)) a b)))
  (iter n 2 1 0))

(f-iter 0) ; 0
(f-iter 1) ; 1
(f-iter 2) ; 2
(f-iter 3) ; 4
(f-iter 4) ; 11
(f-iter 5) ; 25
