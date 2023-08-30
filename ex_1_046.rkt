#lang sicp

(define (iterative-improve good-enough? improve)
  (define (try guess)
    (let ((next (improve guess)))
      (if (good-enough? guess next)
        next
        (try next))))
  try)

(define tolerance 0.00001)
(define (close-enough? v1 v2) (< (abs (- v1 v2)) tolerance))

(define (average a b) (/ (+ a b) 2))

(define (sqrt x)
  ((iterative-improve close-enough? (lambda (y) (average y (/ x y)))) 1.0))

(sqrt 4) ; 2

(define (fixed-point f first-guess)
  ((iterative-improve close-enough? f) first-guess))

(fixed-point cos 1.0) ; 0.7390822985224023
