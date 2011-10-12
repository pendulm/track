(define (gcd a b)
  (define (iter a b)
    (if (= b 0)
	a
	(iter b (remainder a b))))
  (if (> a b)
      (iter a b)
      (iter b a)))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
	       (* (numer y) (denom x)))
	    (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
	       (* (numer y) (denom x)))
	    (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (denom y))
	    (* (denom x) (numer y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
	    (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d)))
	(sign (/ n d)))
    (if (< sign 0)
	(cons (- (/ (abs n) g)) (/ (abs d) g))
	(cons (/ (abs n) g) (/ (abs d) g)))))


(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))