(define (cont-frac n d k)
  (define (iter i)
    (if (> i k)
	0
	(/ (n i)
	   (+ (d i) (iter (+ i 1))))))
  (iter 1))

(define (cont-frac-iter n d k)
  (define (iter i pre)
    (if (= i 0)
	pre
	(iter (- i 1)
	      (/ (n i)
		 (+ (d i) pre)))))
  (iter (- k 1) (/ (n k) (d k))))

(define (return-one x)
  1.0)

(define (euler-d n)
  (let ((i (remainder n 3)))
    (cond ((= i 0) 1)
	  ((= i 1) 1)
	  (else (* (/ (+ n 1)
		      3)
		   2)))))

(define (cal-e k)
  (+ 2
     (cont-frac-iter return-one euler-d k)))
