(define (sum-old term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (simpson-rule f a b n)
  (define h (/ (- b a) n))
  
  (define (simpson-term k)
    
    (define (y k)
      (f (+ a (* k h))))
    
    (cond ((or (= k 0) (= k n)) (y k))
	  ((even? k) (* 2 (y k)))
	  (else (* 4 (y k)))))

  (define (simpson-next k)
    (+ k 1))

  (* (/ h 3.0)
     (sum simpson-term 0 simpson-next n)))

(define (cube x)
  (* x x x))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a)
	      (+ result (term a)))))
  (iter a 0))