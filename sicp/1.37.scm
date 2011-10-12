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
