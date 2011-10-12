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

(define (sqrt-fixpoint y)
  (fixed-point (lambda (x) (average x (/ y x)))
	       1.0))

(define (average x y)
  (/ (+ x y)
     2))

(define (find-golden-ratio)
  (fixed-point (lambda (x) (+ 1 (/ 1.0 x)))
	       1))