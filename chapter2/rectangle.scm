(load "chapter2/segment.scm")  ; load segment

; define rectangle type1
; which requires height & width
(define (make-rectangle height width)
  (cons height width))
(define (rectangle-height rectangle)
  (car rectangle))
(define (rectangle-width rectangle)
  (cdr rectangle))
(define (rectangle-height-length rectangle)
  (- (y-point (end-segment (rectangle-height rectangle)))
     (y-point (start-segment (rectangle-height rectangle)))))
(define (rectangle-width-length rectangle)
  (- (x-point (end-segment (rectangle-width rectangle)))
     (x-point (start-segment (rectangle-width rectangle)))))

; define perimeter & area
(define (rectangle-perimeter rectangle)
  (newline)
  (display "rectangle perimeter is: ")
  (display (* 2 (+ (rectangle-height-length rectangle)
                   (rectangle-width-length rectangle)))))
(define (rectangle-area rectangle)
  (newline)
  (display "rectangle area is: ")
  (display (* (rectangle-height-length rectangle)
              (rectangle-width-length rectangle))))

; output
(define rectangle (make-rectangle (make-segment (make-point 0 0)
                                                (make-point 0 5))
                                  (make-segment (make-point 0 0)
                                                (make-point 10 0))))
(rectangle-perimeter rectangle)
(rectangle-area rectangle)
