(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment start end)
  (cons start end))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (midpoint-segment s)
  (make-point (/ (+ (x-point (start s))
		    (x-point (end s)))
		 2)
	      (/ (+ (y-point (start s))
		    (y-point (end s)))
		 2)))

(define (length-segment s)
  (+ (square (- (x-point (end-segment s))
		(x-point (start-segment s))))
     (square (- (y-point (end-segment s))
		(y-point (start-segment s))))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-rectangle top-left bottom-right)
  (cons top-left bottom-right))

(define (top-left-rectangle r)
  (car r))

(define (bottom-right-rectangle r)
  (cdr r))

(define (length-of-rectangle r)
  (- (point-x (bottom-right-rectangle r))
     (point-x (top-left-rectangle r))))

(define (width-of-rectangle r)
  (- (point-y (bottom-right-rectangle r))
     (point-y (top-left-rectangle r))))

;-----------------------------------------------

(define (make-rectangle top-left length width)
  (cons top-left (cons length width)))

(define (top-left-rectangle r)
  (car r))

(define (length-of-rectangle r)
  (cdr (car r)))

(define (width-of-rectangle r)
  (cdr (cdr r)))

(define (bottom-right-rectangle r)
  (make-point (+ (x-point (top-left-rectangle r))
		 (length-of-rectangle r))
	      (+ (y-point (top-left-rectangle r))
		 (width-of-rectangle r))))
;-----------------------------------------------

(define (perimeter-of-rectangle r)
  (* (+ (length-of-rectangle r)
	(width-of-rectangle r))
     2))

(define (area-of-rectangle r)
  (* (length-of-rectangle r)
     (width-of-rectangle r)))

(define (diagonal-of-rectangle r)
  (make-segment (top-left-rectangle r)
		(bottom-right-rectangle r)))