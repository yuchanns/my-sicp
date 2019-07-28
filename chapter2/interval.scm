(define (make-interval a b)
  (cons a b))
; ex 2.7 ===================
(define (upper-bound x)
  (max (car x) (cdr x)))
(define (lower-bound x)
  (min (car x) (cdr x)))
; ==========================

; interval calculation
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
       (make-interval (min p1 p2 p3 p4)
                      (max p1 p2 p3 p4))))
(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

; print
(define (print-interval type interval)
  (display type)
  (newline)
  (display (lower-bound interval))
  (newline)
  (display (upper-bound interval))
  (newline))
; example

(define resist1 (make-interval 6.12 7.48))
(define resist2 (make-interval 4.465 4.935))
(define resist-add (add-interval resist1 resist2))
(print-interval "add-interval" resist-add)
(define resist-mul (mul-interval resist1 resist2))
(print-interval "mul-interval" resist-mul)
(define resist-div (div-interval resist1 resist2))
(print-interval "div-interval" resist-div)

; ex 2.8 ==========================
(define (sub-interval x y)
  (add-interval x (make-interval (- (upper-bound y))
                                 (- (lower-bound y)))))
(define resist-sub (sub-interval resist1 resist2))
(print-interval "sub-interval" resist-sub)

; ex 2.12
(define (make-center-percent c p)
  (let ((width (* c (/ p 100.0))))
       (make-interval (- c width) (+ c width))))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2.0))
(define (percent i)
  (let ((width (/ (- (upper-bound i) (lower-bound i)) 2)))
       (* (/ width (center i)) 100)))
(define resist3 (make-center-percent 5.8 10))
(print-interval "percent-interval" resist3)
(display "percent of resist3: ")
(display (percent resist3))
(newline)
(display "center of resist3: ")
(display (center resist3))
