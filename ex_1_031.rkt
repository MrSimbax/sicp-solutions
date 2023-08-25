#lang sicp

(define (product term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))))
    (iter a 1))

(define (product-rec term a next b)
    (if (> a b)
        1
        (* (term a) (product-rec term (next a) next b))))

(define (id x) x)
(define (inc x) (+ x 1))

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
