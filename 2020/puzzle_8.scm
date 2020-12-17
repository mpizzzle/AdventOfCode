(load "read_lines.scm")
(load "tokenize.scm")

(define (modify-retry i full)
  (let ((t (find-tail (lambda (x) (or (string=? (car x) "jmp") (string=? (car x) "nop"))) (list-tail i 1))))
    (let ((s (string=? (caar t) "jmp")))
      (let ((ins (cons (list (if s "nop" "jmp") (cadar t)) (list-tail t 1))))
        (execute ins (append (take full (- (length full) (length ins))) ins) full 0 0 '())))))

(define (execute i instructions full ptr acc used)
  (if (< ptr (length instructions))
    (let ((ins (list-ref instructions ptr))
          (u (append used (list ptr))))
      (if (null? (lset-intersection eq? (list ptr) used))
        (cond
          ((string=? (car ins) "acc")
            (execute i instructions full (+ ptr 1) (+ acc (string->number (cadr ins))) u))
          ((string=? (car ins) "jmp")
            (execute i instructions full (+ ptr (string->number (cadr ins))) acc u))
          ((string=? (car ins) "nop")
            (execute i instructions full (+ ptr 1) acc u)))
        (modify-retry i full)))
        ;acc))
    acc))

(define instructions (read-lines "files/8.txt" (lambda (x) (tokenize x #\space))))

(display (execute instructions instructions instructions 0 0 '())) (newline)
