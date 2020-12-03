(define (check-slice slice x)
      (if (char=? (string-ref slice (modulo x (string-length slice))) #\#) 1 0))

(define (count-trees tree-map x x-offset y y-offset)
  (if (not (null? tree-map))
    (+ (if (= (modulo y y-offset) 0)
      (+ (check-slice (car tree-map) x)) 0)
      (count-trees (cdr tree-map) (if (= (modulo y y-offset) 0) (+ x x-offset) x) x-offset (+ y 1) y-offset))
    0))

(load "read_lines.scm")
(define input (read-lines "files/3.txt" (lambda (x) x)))

(display (count-trees input 0 3 0 1)) (newline)

(display (* (count-trees input 0 1 0 1)
            (count-trees input 0 3 0 1)
            (count-trees input 0 5 0 1)
            (count-trees input 0 7 0 1)
            (count-trees input 0 1 0 2))) (newline)
