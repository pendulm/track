(define (iterate guess last-guess x)
  (if (good-enough? guess last-guess)
      guess
      (iterate (improve guess x)
		 guess
		 x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess))
	(* x guess))
     3.0))

;(define (good-enough? guess last-guess)
; (= guess last-guess))

(define (subtriplicate x)
  (iterate 1.0 0 x))

