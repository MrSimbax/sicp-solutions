#lang sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
    f
    (compose f (repeated f (- n 1)))))

(define dx 1)

(define (average3 a b c)
  (/ (+ a b c) 3))

(define (smooth f)
  (lambda (x)
    (average3 (f (- x dx))
              (f x)
              (f (+ x dx)))))

(define (smoothn f n)
  ((repeated smooth n) f))

(define (square x)
  (* x x))

((smooth square) 0) ; 2/3
((smooth square) 1) ; 5/3
((smooth square) 2) ; 14/3
((smooth square) 3) ; 29/3
((smooth square) 4) ; 50/3

((smoothn square 2) 1) ; 7/3
((smoothn square 2) 2) ; 16/3
((smoothn square 2) 3) ; 31/3

((smoothn square 3) 2) ; 6
