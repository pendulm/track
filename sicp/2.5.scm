(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car z)
  (if (= (remainder z 2) 0)
      (+ (car (/ z 2)) 1)
      0))

(define (cdr z)
  (if (= (remainder z 3) 0)
      (+ (cdr (/ z 3)) 1)
      0))
