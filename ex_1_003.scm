#lang sicp
(define (max a b)
  (if (> a b) a b))

(define (min a b)
  (if (< a b) a b))

(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (sum-of-squares-of-two-largest a b c)
  (sum-of-squares (max a b) (max (min a b) c)))

(sum-of-squares-of-two-largest 1 2 3) ; 13
(sum-of-squares-of-two-largest 1 3 2) ; 13
(sum-of-squares-of-two-largest 2 1 3) ; 13
(sum-of-squares-of-two-largest 2 3 1) ; 13
(sum-of-squares-of-two-largest 3 1 2) ; 13
(sum-of-squares-of-two-largest 3 2 1) ; 13
