(define (sum-of-max-two a b c)
  (if (or (> a b) (> a c))
       (+ a (if (> b c) b c))
       (+ b c)))
