; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
; another map
(define (another-map proc sequence . sequence2)
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
; accumulate-n
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    '()
    (cons (accumulate op init (map car seqs))
          (accumulate-n op init (map cdr seqs)))))
; matrix
(define (dot-product v w)
  (accumulate + 0 (map * v w)))
(define (matrix-*-vector m v)
  (map (lambda (m-row) (dot-product m-row v))
       m))
; nij = mji
(define (transpose m)
  (accumulate-n cons '() m))
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (m-row)
           (map (lambda (col)
                  (dot-product m-row col))
                cols))
    m)))

; test output
(display "another map: ")
(display (another-map (lambda (x) (* x x)) (list 1 2 3 4)))
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
(newline)
(display "accumulate-n: ")
(display (accumulate-n + 0 (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12))))
(newline)
(define matrix (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(display "dot-product: ")
(display (dot-product (list 1 2 3) (list 4 5 6)))
(newline)
(display "transpose: ")
(display (transpose matrix))
(newline)
(display "matrix-*-vector: ")
(display (matrix-*-vector matrix (list 2 3 4 5)))
(newline)
(display "matrix-*-matrix: ")
(display (matrix-*-matrix matrix (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9) (list 7 8 9 10))))
