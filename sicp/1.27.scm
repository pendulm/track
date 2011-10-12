(define (smallest-divisor n)
  (find-devisor n 2))

(define (find-devisor n test-devisor)
  (cond ((> (square test-devisor) n) n)
	((divides? test-devisor n) test-devisor)
	(else (find-devisor n (+ test-devisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))


(define (test-congruences? n a)
  (= (expmod a n n) a))


(define (is-fake-prime? n)
  (define (mod-every i)
    (cond ((= i 0) #t)
	  ((test-congruences? n i) (mod-every (- i 1)))
	  (else #f)))
  (mod-every (- n 1)))


(define (is-carmicheal? n)
  (and (not (prime? n)) (is-fake-prime? n)))
