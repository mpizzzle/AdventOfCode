(define (check-slice slice x)
      (if (char=? (string-ref slice (modulo x (string-length slice))) #\#) 1 0))

(define (count-trees tree-map x y x-offset y-offset)
  (if (not (null? tree-map))
    (+ (if (= (modulo y y-offset) 0)
      (+ (check-slice (car tree-map) x)) 0)
      (count-trees (cdr tree-map) (if (= (modulo y y-offset) 0) (+ x x-offset) x) (+ y 1) x-offset y-offset))
    0))

(load "read_lines.scm")
(define input (read-lines "files/3.txt" (lambda (x) x)))

(display (count-trees input 0 0 3 1)) (newline)

(display (* (count-trees input 0 0 1 1)
            (count-trees input 0 0 3 1)
            (count-trees input 0 0 5 1)
            (count-trees input 0 0 7 1)
            (count-trees input 0 0 1 2))) (newline)
