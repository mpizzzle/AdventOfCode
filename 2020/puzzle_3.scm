(define (check-slice slice x)
      (if (char=? (string-ref slice (modulo x (string-length slice))) #\#) 1 0))

(define (count-trees tree-map x y x-offset y-offset)
  (if (not (null? tree-map))
    (let ((parity (= (modulo y y-offset) 0)))
      (+ (if parity
        (+ (check-slice (car tree-map) x)) 0)
        (count-trees (cdr tree-map) (+ x (if parity x-offset 0)) (+ y 1) x-offset y-offset)))
    0))

(load "read_lines.scm")
(define input (read-lines "files/3.txt" (lambda (x) x)))
(define slopes '((1 1) (3 1) (5 1) (7 1) (1 2)))

(display (count-trees input 0 0 3 1)) (newline)
(display (apply * (map (lambda (x) (count-trees input 0 0 (car x) (car (cdr x)))) slopes))) (newline)
