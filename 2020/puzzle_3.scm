(define (check-slice slice x)
      (if (char=? (string-ref slice (modulo x (string-length slice))) #\#) 1 0))

(define (count-trees tree-map slope)
  (define (recurse-trees tree-map x y slope)
    (if (not (null? tree-map))
      (let ((parity (= (modulo y (car (cdr slope))) 0)))
        (+ (if parity
          (+ (check-slice (car tree-map) x)) 0)
          (recurse-trees (cdr tree-map) (+ x (if parity (car slope) 0)) (+ y 1) slope)))
      0))
  (recurse-trees tree-map 0 0 slope))

(load "read_lines.scm")
(define input (read-lines "files/3.txt" (lambda (x) x)))
(define slopes '((1 1) (3 1) (5 1) (7 1) (1 2)))

(display (count-trees input (car (cdr slopes)))) (newline)
(display (apply * (map (lambda (slope) (count-trees input slope)) slopes))) (newline)
