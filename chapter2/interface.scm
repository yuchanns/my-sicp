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
; horner
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))
; another count-leaves
(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (sub-tree)
                     (if (pair? sub-tree)
                       (count-leaves sub-tree)
                       1))
                   t)))
; third count-leaves
(define (count-leaves-third t)
  (accumulate (lambda (x y)
                (if (not (pair? x))
                  (+ 1 y)
                  (+ (count-leaves-third x) y)))
              0
              (map (lambda (sub-tree) sub-tree)
                   t)))

; test output
(display "another map: ")
(display (map (lambda (x) (* x x)) (list 1 2 3 4)))
(newline)
(display "another append: ")
(display (append (list 1 2 3) (list 4 5 6)))
(newline)
(display "another length: ")
(display (length (list 1 2 3 4 5 6)))
(newline)
(display "horner eval: ")
(display (horner-eval 2 (list 1 3 0 5 0 1)))
(newline)
(display "count leaves: ")
(display (count-leaves (list (list 1 (list 2 3)) (list (list 4 5) 6))))
(newline)
(display "count leaves third: ")
(display (count-leaves-third (list (list 1 (list 2 3)) (list (list 4 5) 6))))