;|an+1|    |p+q   q|2  |an|   |(p+q)^2 + q^2  2pg + q^2|   |an|
;|    | =  |       | * |  | = |                        | * |  |
;|bn+1|    |q     p|   |bn|   |2pq + q^2      p^2 + q^2|   |bn|

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
	((even? count)
	 (fib-iter a
		   b
		   (+ (square p) (square q))
		   (+ (* 2 p q) (square q))
		   (/ count 2)))
	(else (fib-iter (+ (* b q) (* a q) (* a p))
			(+ (* b p) (* a q))
			p
			q
			(- count 1)))))

(define (square x)
  (* x x))