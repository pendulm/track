(define (f-recurse n)
  (if (< n 3)
      n
      (+ (f-recurse (- n 1))
	 (* 2 (f-recurse (- n 2)))
	 (* 3 (f-recurse (- n 3))))))

(define (f-iter-1 a b c n)
  (if (= n 0)
      a
      (f-iter-1 (+ a
		 (* 2 b)
		 (* 3 c))
	      a b (- n 1))))

(define (f-iter-2 a b c n)
  (if (= n 0)
      c
      (f-iter-2 (+ a
		   (* 2 b)
		   (* 3 c))
		a b (- n 1))))
	      
(define (f-iterate-1 n)
  (if (< n 3)
      n
      (f-iter-1 2 1 0 (- n 2))))

(define (f-iterate-2 n)
  (f-iter-2 2 1 0 n))