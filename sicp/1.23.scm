(define (smallest-divisor n)
  ;(find-devisor n 2))
  (find-devisor n 3))

(define (find-devisor n test-devisor)
  (cond ((> (square test-devisor) n) n)
	((divides? test-devisor n) test-devisor)
	;(else (find-devisor n (next test-devisor)))))
	(else (find-devisor n (+ test-devisor 2)))))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))
    

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x)
  (* x x))


(define (runtime) (tms:clock (times)))

(define (timed-prime-test n)
;  (newline)
;  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
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
