(define a 3)
;a = 3
(define b (+ a 1))
;b = a + 1 = 4
(+ a b (* a b))
;a + b + a * b = 19
(= a b)
;#f
(if (and (> b a) (< b (* b a)))
    b
    a)
;b 4
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
;6 + 7 + a = 16
(+ 2 (if (> b a) b a))
;2 + 4 = 6
(* (cond ((> a b) a)
	 ((< a b) b)
	 (else -1))
   (+ a 1))
;b * (a + 1) = 16

