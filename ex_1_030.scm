#lang sicp

(define (sum term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ result (term a)))))
    (iter a 0))

; Tests
(define (cube x) (* x x x))
(define (inc n) (+ n 1))
(define (sum-cubes a b)
    (sum cube a inc b))
(sum-cubes 1 10) ; 3025

(define (id x) x)
(define (sum-ints a b)
    (sum id a inc b))
(sum-ints 1 10) ; 55

(define (pi-sum a b)
    (define (pi-term x)
        (/ 1.0 (* x (+ x 2))))
    (define (pi-next x)
        (+ x 4))
    (sum pi-term a pi-next b))
(* 8 (pi-sum 1 1000)) ; ~3.14

