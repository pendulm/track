(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (lower-bound y)))
	(p3 (* (lower-bound x) (lower-bound y)))
	(p4 (* (lower-bound x) (lower-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (> (* (lower-bound y) (upper-bound y)) 0)
      (mul-interval x
		    (make-interval (/ 1.0 (upper-bound y))
				   (/ 1.0 (lower-bound y))))
      (error "second interval can't include zero")))

(define (make-interval a b) (cons a b))

(define (upper-bound interval)
  (max (car interval) (cdr interval)))

(define (lower-bound interval)
  (min (car interval) (cdr interval)))

(define (sub-interval x y)
  (make-interval (- (lower-bound x)
		    (upper-bound y))
		 (- (upper-bound x)
		    (lower-bound y))))