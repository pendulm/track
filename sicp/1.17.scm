(define (double x)
  (* 2 x))

(define (halve x)
  (/ x 2))

(define (fast-* a b accum)
  (cond ((= b 0) accum)
	((even? b) (fast-* (double a) (halve b) accum))
	(else (fast-* a (+ b -1) (+ a accum)))))