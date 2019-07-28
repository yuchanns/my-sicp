; ex2.30
(define (square-tree1 tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree1 (car tree))
                    (square-tree1 (cdr tree))))))
(display (square-tree1 (list 1 (list 2 (list 3 4) 5) (list 6 7))))
; custom high-level function
(define (list-ref items n)
  (if (= n 0)
    (car items)
    (list-ref (cdr items) (- n 1))))

(define (length items)
  (define (length-iter a count)
    (if (null? a)
      count
      (length-iter (cdr a) (+ count 1))))
  (length-iter items 0))

(define (reverse items)
  (let ((items-len (length items)))
    (define (reverse-iter dist len)
      (if (= len items-len)
        dist
        (reverse-iter (cons (list-ref items len) dist) (+ 1 len))))
    (reverse-iter '() 0)))

(define (map proc items)
  (define (map-iter dist proc rest)
    (if (null? rest)
      (reverse dist)
      (map-iter (cons (proc (car rest)) dist)
                proc
                (cdr rest))))
  (map-iter '() proc items))
; use map
(define (square-tree2 tree)
  (map (lambda (sub-tree)
        (if (pair? sub-tree)
          (square-tree2 sub-tree)
          (* sub-tree sub-tree)))
       tree))
(newline)
(display (square-tree2 (list 1 (list 2 (list 3 4) 5) (list 6 7))))

; ex2.31 tree-map
(define (tree-map proc tree)
  (map (lambda (sub-tree)
        (cond ((null? sub-tree) '())
              ((pair? sub-tree) (tree-map proc sub-tree))
              (else (proc sub-tree))))
       tree))
(define (square-tree3 tree)
  (tree-map (lambda (x) (* x x)) tree))
(newline)
(display (square-tree3 (list 1 (list 2 (list 3 4) 5) (list 6 7))))
