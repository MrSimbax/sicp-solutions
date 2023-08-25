#lang sicp

(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))

(define (1+ x) (+ x 1))

(define (simpsons-rule f a b n)
    (let ((h (/ (- b a) n)))
         (define (coeff k)
            (cond ((or (= k 0) (= k n)) 1)
                  ((even? k) 2)
                  (else 4)))
         (define (y k)
            (* (coeff k) (f (+ a (* k h)))))
         (* (/ h 3) (sum y a 1+ n))))

(define (cube x) (* x x x))

(simpsons-rule cube 0.0 1.0 100) ; 0.24999999999999992
(simpsons-rule cube 0.0 1.0 1000) ; 0.2500000000000003

