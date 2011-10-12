(define (square n)
  (* n n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else #f)))


(define (runtime) (tms:clock (times)))

(define (timed-prime-test n)
;  (newline)
;  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
;    (display " *** ")
;    (display elapsed-time))
  elapsed-time)

(define (search-for-primes start range)
  (if (> range 0)
      (timed-prime-test start))
  (if (> range 0)
      (search-for-primes (+ start 2) (- range 2))))

(define (get-avg-runtime n times)
  (define (sum-runtime times sum)
    (if (= times 0)
	sum
	(sum-runtime (- times 1) (+ sum (timed-prime-test n)))))
  (/ (sum-runtime times 0) (+ times 0.0)))