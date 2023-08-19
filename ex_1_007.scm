#lang sicp
(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x)
  (* x x))

(define (good-enough? previous-guess guess)
  (< (/ (abs (- guess previous-guess)) previous-guess) 0.001))

(define (sqrt-iter-new previous-guess guess x)
  (if (good-enough? previous-guess guess)
      guess
      (sqrt-iter guess x)))

(define (sqrt-iter guess x)
  (sqrt-iter-new guess (improve guess x) x))

(define (sqrt x)
  (sqrt-iter 1.0 x))
