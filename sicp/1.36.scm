(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v2 v1)) tolerance))

  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y)
     2))

(define (cal-root)
  (fixed-point (lambda (x) (/ (log 1000) (log x)))
	       2.0))

(define (cal-root-avg-damp)
  (fixed-point (lambda (x) (average x
				    (/ (log 1000) (log x))))
	       2.0))