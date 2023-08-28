#lang sicp

(define (cont-frac n d k)
    (define (f i)
        (if (> i k)
            0
            (/ (n i) (+ (d i) (f (+ i 1))))))
    (f 1))

(define (cont-frac-iter n d k)
    (define (f i result)
        (if (= i 0)
            result
            (f (- i 1) (/ (n k) (+ (d k) result)))))
    (f k 0))

(/ 1 (cont-frac-iter (lambda (_) 1.0) (lambda (_) 1.0) 11))
