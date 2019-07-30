; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
; another map
(define (map proc sequence)
  (accumulate (lambda (x y) (cons (proc x) y)) '() sequence))
; another append
(define (append seq1 seq2)
  (accumulate cons seq2 seq1))
; another length
(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

; test output
(display "another map: ")
(display (map (lambda (x) (* x x)) (list 1 2 3 4)))
(newline)
(display "another append: ")
(display (append (list 1 2 3) (list 4 5 6)))
(newline)
(display "another length: ")
(display (length (list 1 2 3 4 5 6)))
