#lang sicp

(define (square x) (* x x))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))

(define (prime? n) (= (smallest-divisor n) n))

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
    (if (prime? n) (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

(define (even? x) (= (remainder x 2) 0))

(define (search-for-primes from to)
    (cond ((even? from) (search-for-primes (+ from 1) to))
          ((even? to) (search-for-primes from (- to 1)))
          (else (search-for-primes-iter from to))))
    (define (search-for-primes-iter n to)
        (if (<= n to) (test-for-prime n to)))
    (define (test-for-prime n to)
        (timed-prime-test n)
        (search-for-primes-iter (+ n 2) to))

(search-for-primes 1000 1100) ; 1e3
(search-for-primes 10000 10100) ; 1e4
(search-for-primes 100000 100100) ; 1e5
(search-for-primes 1000000 1000100) ; 1e6
(search-for-primes 10000000 10001000) ; 1e7
(search-for-primes 100000000 100001000) ; 1e8
(search-for-primes 1000000000 1000001000) ; 1e9
(search-for-primes 10000000000 10000001000) ; 1e10
(search-for-primes 100000000000 100000001000) ; 1e11
(search-for-primes 1000000000000 1000000001000) ; 1e12
