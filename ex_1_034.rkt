#lang sicp

(define (f g) (g 2))

(f (lambda (x) (* x x))) ; 4
(f (lambda (z) (* z (+ z 1)))) ; 6

(f f)
; (f 2)
; (2 2)
; error because 2 cannot be applied to 2
