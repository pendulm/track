(define (square x)
  (* x x))

(define (switch-for-trival-root root rem n)
  (if (and (= rem 1)
	   (not (= root 1))
	   (not (= root (- n 1))))
      0
      rem))

(define (cache-func sqrt-root m)
  (switch-for-trival-root sqrt-root
			  (remainder (square sqrt-root) m)
			  m))

(define (expmod base exp m)
    (cond ((= exp 0) 1)
	((even? exp)
;	 (remainder (square (expmod base (/ exp 2) m))
;		    m))
	 (cache-func (expmod base (/ exp 2) m) m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))


(define (fast-prime? n times)
  (cond ((= times 0) #t)
	((m-r-test n) (fast-prime? n (- times 1)))
	(else #f)))

(define (m-r-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 2 (random (- n 3)))))