(define (average x y)
  (/ (+ x y) 2))

(define (average-damping f)
  (lambda (x) (average (f x) x)))

(define tolerance 0.00001)

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v2 v1)) tolerance))

  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (log2-floor n)
  (define (iter i)
    (let ((m (expt 2 i)))
      (cond ((= m n) i)
	    ((> m n) (- i 1))
	    (else (iter (+ i 1))))))
  (iter 0))

(define (find-nth-root y n)
  (fixed-point-of-transform (lambda (x) (/ y (expt x (- n 1))))
			    (repeated average-damping (log2-floor n))
			    1.0))
