#lang sicp

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2) (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess))) (if (close-enough? guess next) next (try next))))
  (try first-guess))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (average a b) (/ (+ a b) 2))
(define (average-damp f) (lambda (x) (average x (f x))))

(define dx 0.00001)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (nth-root n x)
  (fixed-point-of-transform
    (lambda (y) (/ x (expt y (- n 1))))
    (repeated average-damp (- n 1))
    1.0))

(nth-root 2 9) ; 3
(nth-root 3 27) ; 3
(nth-root 4 81) ; 3
(nth-root 5 243) ; 3
