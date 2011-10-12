(define (average x y)
  (/ (+ x y) 2))

(define (average-damping f)
  (lambda (x) (average (f x) x)))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v2 v1)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx))
		    (g x))
		 dx)))
(define dx 0.00001)

(define (newton-transform g)
  (lambda (x) (- x
		 (/ (g x)
		    ((deriv g) x)))))

(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))
