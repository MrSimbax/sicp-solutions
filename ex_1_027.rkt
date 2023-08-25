#lang sicp

(define (square x) (* x x))

(define (expmod base exp m)
    (cond ((= exp 0)   1)
          ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
          (else        (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fast-prime? n times)
    (cond ((= times 0) true)
          ((fermat-test n) (fast-prime? n (- times 1)))
          (else false)))
(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))

(define (carmichael? n)
    (define (carmichael?-iter n a)
        (cond ((= a n) true)
              ((not (= a (expmod a n n))) false)
              (else (carmichael?-iter n (+ a 1)))))
    (carmichael?-iter n 1))

(carmichael? 561) ; #t
(carmichael? 1105) ; #t
(carmichael? 1729) ; #t
(carmichael? 2465) ; #t
(carmichael? 2821) ; #t
(carmichael? 6601) ; #t

(carmichael? 3) ; #t (it's prime so not technically carmichael, but whatever)
(carmichael? 4) ; #f

