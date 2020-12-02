(define (part-1 x a b)
  (if (and (not (null? a)) (= 2020 (+ (car a) (car b))))
    (list (car a) (car b) (* (car a) (car b)))
    (if (null? a)
      (if (null? b)
        0
        (part-1 x x (cdr b)))
      (part-1 x (cdr a) b))))

(define (part-2 x a b c)
  (if (and (not (null? a)) (not (null? b)) (= 2020 (+ (car a) (car b) (car c))))
    (list (car a) (car b) (car c) (* (car a) (car b) (car c)))
    (if (null? a)
      (if (null? b)
        (if (null? c)
          0
          (part-2 x a x (cdr c)))
        (part-2 x x (cdr b) c))
      (part-2 x (cdr a) b c))))

(load "read_lines.scm")
(define i (read-lines "files/1.txt" (lambda (x) (string->number x))))

(display (part-1 i i i)) (newline)
(display (part-2 i i i i)) (newline)
