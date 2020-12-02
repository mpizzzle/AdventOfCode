(define (string-index str chr idx)
  (if (not (null? str))
    (if (char=? (car (string->list str)) chr)
      idx
      (string-index (list->string (cdr (string->list str))) chr (+ idx 1)))
    -1))

(define (valid-password entry policy)
  (let
    ((idx (string-index entry #\- 0))
     (idx2 (string-index entry #\space 0)))
    (let
      ((i (string->number (substring entry 0 idx)))
       (j (string->number (substring entry (+ idx 1) idx2)))
       (c (string-ref entry (+ idx2 1)))
       (s (substring entry (+ idx2 4) (string-length entry))))
      (policy s c i j))))

(define (loop entries policy)
  (if (not (null? entries))
    (+ (valid-password (car entries) policy)
    (loop (cdr entries) policy))
    0))

(define (char-count str chr count)
  (if (not (= 0 (string-length str)))
      (char-count (list->string (cdr (string->list str))) chr
        (if (char=? (car (string->list str)) chr)(+ count 1) count))
    count))

(define policy-1
  (lambda (s c i j)
    (let ((count (char-count s c 0)))
      (if (and (>= count i) (<= count j)) 1 0))))

(define policy-2
  (lambda (s c i j)
    (if (not (equal? (char=? (string-ref s (- i 1)) c)
        (char=? (string-ref s (- j 1)) c))) 1 0)))

(load "read_lines.scm")
(define input (read-lines "files/2.txt" (lambda (x) x)))

(display (loop input policy-1)) (newline)
(display (loop input policy-2)) (newline)