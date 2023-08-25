#lang sicp

(define (filtered-accumulate combiner null-value term a next b pred)
    (define (filtered-combiner a result)
        (if (pred a) (combiner (term a) result) result))
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (filtered-combiner a result))))
    (iter a null-value))

(define (square x) (* x x))
(define (smallest-divisor n) (if (= (remainder n 2) 0) 2 (find-divisor n 3)))
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 2)))))
(define (divides? a b) (= (remainder b a) 0))

(define (prime? n) (and (not (< n 2)) (= (smallest-divisor n) n)))

(define (sum-of-squares-of-primes a b)
    (filtered-accumulate + 0 square a inc b prime?))

(sum-of-squares-of-primes 1 1) ; 0
(sum-of-squares-of-primes 1 2) ; 4
(sum-of-squares-of-primes 1 3) ; 13
(sum-of-squares-of-primes 1 4) ; 13
(sum-of-squares-of-primes 1 5) ; 38

(newline)

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

(define (product-of-relatively-prime n)
    (filtered-accumulate * 1 (lambda (x) x) 1 inc (- n 1) (lambda (a) (= (gcd a n) 1))))

(product-of-relatively-prime 2) ; 1
(product-of-relatively-prime 3) ; 2
(product-of-relatively-prime 4) ; 3
(product-of-relatively-prime 5) ; 24
(product-of-relatively-prime 6) ; 5
