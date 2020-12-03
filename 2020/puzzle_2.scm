(define (string-idx str chr)
  (- (length (string->list str)) (length (memq chr (string->list str)))))

(define (char-count str chr)
  (apply + (map (lambda (b) (if b 1 0))(map (lambda (c) (char=? c chr)) (string->list str)))))

(define (validate-passwords entries policy)
  (if (not (null? entries))
    (+ (let
      ((idx (string-idx (car entries) #\-))
       (idx2 (string-idx (car entries) #\space))
       (entry (car entries)))
      (let
        ((i (string->number (substring entry 0 idx)))
         (j (string->number (substring entry (+ idx 1) idx2)))
         (c (string-ref entry (+ idx2 1)))
         (s (substring entry (+ idx2 4) (string-length entry))))
        (policy s c i j)))
      (validate-passwords (cdr entries) policy))
    0))

(define policy-1
  (lambda (s c i j)
    (let ((count (char-count s c)))
      (if (and (>= count i) (<= count j)) 1 0))))

(define policy-2
  (lambda (s c i j)
    (if (not (equal? (char=? (string-ref s (- i 1)) c)
        (char=? (string-ref s (- j 1)) c))) 1 0)))

(load "read_lines.scm")
(define input (read-lines "files/2.txt" (lambda (x) x)))

(display (validate-passwords input policy-1)) (newline)
(display (validate-passwords input policy-2)) (newline)
