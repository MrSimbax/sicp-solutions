#lang sicp

(define (cont-frac n d k)
    (define (f i result)
        (if (= i 0)
            result
            (f (- i 1) (/ (n i) (+ (d i) result)))))
    (f k 0))

(+ (cont-frac (lambda (_) 1.0) (lambda (i) (if (= (remainder i 3) 2) (* 2 (ceiling (/ i 3.0))) 1)) 100) 2)
