(define (filtered-accumulate combainer null-value term a next b pre-cond?)
  (define (filtered-combain a b)
    (if (pre-cond? a)
	(combiner a b)
	(combiner null-value b)))

  (define (iter a)
    (if (> a b)
	null-value
	(filtered-combain (term a)
			  (iter (next a)))))

  (iter a))


(define (self x) x)

(define (sum-prime a b)
  (filtered-accumulate + 0 self b prime?))

(define (product-less-coprime n)
  (define (coprime? a)
    (= gcd(a n) 1))

  (filtered-accumulate * 1 self (- n 1) coprime?))