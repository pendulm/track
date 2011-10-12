(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (square x)
  (* x x))

(define (inc x)
  (+ x 1))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))