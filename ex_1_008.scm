#lang sicp
(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (square x)
  (* x x))

(define (good-enough? previous-guess guess)
  (< (/ (abs (- guess previous-guess)) previous-guess) 0.001))

(define (cube-root-iter-new previous-guess guess x)
  (if (good-enough? previous-guess guess)
      guess
      (cube-root-iter guess x)))

(define (cube-root-iter guess x)
  (cube-root-iter-new guess (improve guess x) x))

(define (cube-root x)
  (cube-root-iter 1.0 x))
