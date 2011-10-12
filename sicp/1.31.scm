(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
	resule
	(iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial n)
  (define (self x) x)
  (define (inc x) (+ x 1))
  (product self 1 inc n))

(define (cal-pi k)
  (define (term x)
    (if (even? x)
	(/ (+ i 2)
	   (+ i 1))
	(/ (+ i 2)
	   (+ i 1))))
  
  (* 4 (product term 1 k))