; define show
(define (show x) (newline) (display x) x)
; church
(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (add-1 zero))
(show "one")
((one show) "hello world")
(define two (add-1 one))
(show "two")
((two show) "hello world")
(define (add a b)
  (lambda (f)
    (lambda (x)
      ((a f) ((b f) x)))))
(define three (add one two))
(show "three")
((three show) "hello world")
(define four (add one three))
(define seven (add three four))
(show "seven")
((seven show) "hello world)"
