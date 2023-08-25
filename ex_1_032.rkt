#lang sicp

(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (combiner (term a) result))))
    (iter a null-value))

(define (sum term a next b)
    (accumulate-iter + 0 term a next b))

(define (product term a next b)
    (accumulate-iter * 1 term a next b))

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
(newline)

(define (pi-sum a b)
    (define (pi-term x)
        (/ 1.0 (* x (+ x 2))))
    (define (pi-next x)
        (+ x 4))
    (sum pi-term a pi-next b))
(* 8 (pi-sum 1 10000)) ; ~3.14

(newline)

(define (factorial n)
    (product id 1 inc n))

(factorial 1) ; 1
(factorial 2) ; 2
(factorial 3) ; 6
(factorial 4) ; 24
(factorial 5) ; 120
(newline)

(define (pi-product a b)
    (define (term k)
        (if (even? k)
            (/ (+ k 2) (+ k 1))
            (/ (+ k 1) (+ k 2))))
    (product term a inc b))

(* 4.0 (pi-product 1 10000))
