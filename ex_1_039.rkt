#lang sicp

(define (cont-frac n d k)
    (define (f i result)
        (if (= i 0)
            result
            (f (- i 1) (/ (n i) (+ (d i) result)))))
    (f k 0))

(define (tan-cf x k)
    (cont-frac
        (lambda (i) (if (= i 1) x (- (* x x))))
        (lambda (i) (- (* 2 i) 1))
        k))

(define pi 3.14159265358979311599796346854)

(tan-cf (/ pi 4) 100) ; 1.0
    
