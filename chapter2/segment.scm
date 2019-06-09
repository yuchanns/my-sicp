(load "chapter1/average.scm")  ; load average

; define point
(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

; define segment
(define (make-segment x y)
  (cons x y))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))

; define midpoint 
(define (midpoint-segment segment)
  (make-point (average (x-point (start-segment segment))
                       (x-point (end-segment segment)))
              (average (y-point (start-segment segment))
                       (y-point (end-segment segment)))))
; define print
(define (print-point point)
  (newline)
  (display "(")
  (display (x-point point))
  (display ", ")
  (display (y-point point))
  (display ")"))

; output
; (define point1 (make-point 2 3))
; (define point2 (make-point 100 97))
; (print-point point1)
; (print-point point2)
; (define segment1 (make-segment point1 point2))
; (define midpoint1 (midpoint-segment segment1))
; (print-point midpoint1)
