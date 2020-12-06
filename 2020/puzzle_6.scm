(define (distinct elements)
  (define (count-distinct l d count)
     (cond ((null? l) count)
           ((member (car l) d)
            (count-distinct (cdr l) d count))
           (else
            (count-distinct (cdr l) (cons (car l) d) (+ 1 count)))))
  (count-distinct elements '() 0))

(define (load-answers answers)
  (if (not (null? answers))
    (if (not (= (string-length (car answers)) 0))
      (append (string->list (car answers)) (load-answers (cdr answers)))
      (list (load-answers (cdr answers))))
    '()))

(define (unfold answers)
  (if (not (null? answers))
    (let ((tail (reverse answers)))
      (if (char? (car tail))
        (list tail)
        (cons (cdr tail) (unfold (car tail)))
      ))
    '()))

(load "read_lines.scm")
(define answers (read-lines "files/6.txt" (lambda (x) x)))

(display (apply + (map distinct (unfold (load-answers answers))))) (newline)
