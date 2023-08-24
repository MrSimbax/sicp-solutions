#lang sicp

(define (square x) (* x x))

(define (expmod base exp m)
    (define (check-square x)
        (if (and (> x 1) (< (- m 1) x) (= (remainder (square x) m) 1))
            0
            (square x)))
    (cond ((= exp 0)   1)
          ((even? exp) (remainder (check-square (expmod base (/ exp 2) m)) m))
          (else        (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fast-prime? n times)
    (cond ((= times 0) true)
          ((fermat-test n) (fast-prime? n (- times 1)))
          (else false)))
(define (fermat-test n)
    (define (try-it a)
        (= (expmod a (- n 1) n) 1))
    (try-it (+ 1 (random (- n 1)))))

(fast-prime? 561 100) ; #f
(fast-prime? 1105 100) ; #f
(fast-prime? 1729 100) ; #f
(fast-prime? 2465 100) ; #f
(fast-prime? 2821 100) ; #f
(fast-prime? 6601 100) ; #f

(fast-prime? 2 100) ; #t 
(fast-prime? 3 100) ; #t 
(fast-prime? 4 100) ; #f
(fast-prime? 5 100) ; #t
(fast-prime? 6 100) ; #f
(fast-prime? 7 100) ; #t
(fast-prime? 8 100) ; #f
(fast-prime? 9 100) ; #f

