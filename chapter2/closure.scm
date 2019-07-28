; define list-ref
(define (list-ref items n)
  (if (= n 0)
    (car items)
    (list-ref (cdr items) (- n 1))))
; define length
(define (length items)
  (define (length-iter a count)
    (if (null? a)
      count
      (length-iter (cdr a) (+ count 1))))
  (length-iter items 0))

; ex 2.17 define last-pair
(define (last-pair items)
  (if (null? items)
    'error
    (list-ref items (- (length items) 1))))

; test output
(define list1 (list 1 4 9 16 25 1 3 5 7))
(display "last-pair: ")
(display (last-pair list1))
(newline)

; ex 2.18 define reverse
(define (reverse items)
  (let ((items-len (length items)))
    (define (reverse-iter dist len)
      (if (= len items-len)
        dist
        (reverse-iter (cons (list-ref items len) dist) (+ 1 len))))
    (reverse-iter '() 0)))
(display "reverse: ")
(display (reverse list1))
(newline)

; ex 2.20 define samp-parity
(define (same-parity a . b)
  (define (sp-iter dist items type)
    (if (null? items)
      (reverse dist)
      (sp-iter (if (type (car items))
                   (cons (car items) dist)
                   dist)
               (cdr items)
               type)))
  (sp-iter (list a) b (if (even? a) even? odd?)))
(display "same-parity: ")
(display (same-parity 1 2 3 4 5 6 7))
(newline)
; define map
(define (map proc items)
  (define (map-iter dist proc rest)
    (if (null? rest)
      (reverse dist)
      (map-iter (cons (proc (car rest)) dist)
                proc
                (cdr rest))))
  (map-iter '() proc items))

; define scale-list
(define (scale-list items factor)
  (map (lambda (x) (* x factor)) items))
; output test
(display "map scale-list: ")
(display (scale-list (list 1 2 3 4 5 6) 10))
(newline)

; ex 2. 27 define deep-reverse
(define (deep-reverse items)
  (define (dr-iter items result)
    (if (null? items)
      result
      (let ((first (car items)))
        (dr-iter (cdr items)
                 (cons (if (not (pair? first))
                        first
                        (deep-reverse first))
                        result)))))
  (dr-iter items '()))
(define dr-list (list (list 1 2) (list 3 4) 5))
(display "reverse:")
(display (reverse dr-list))
(newline)
(display "deep-reverse: ")
(display (deep-reverse dr-list))
(newline)
; ex2.28 define fringe
(define (fringe items)
  (define (fringe-iter dist rest)
    (cond ((null? rest) dist)
          ((not (pair? rest)) (cons rest dist))
          (else (fringe-iter (append dist (fringe (car rest))) (cdr rest)))))
  (fringe-iter '() items))
(display "fringe: ")
(display (fringe (list (list 1 2) (list 3 4))))
