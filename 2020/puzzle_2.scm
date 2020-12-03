(define (string-idx str chr)
  (- (string-length str) (length (memq chr (string->list str)))))

(define (char-count str chr)
  (apply + (map (lambda (b) (if b 1 0)) (map (lambda (c) (char=? c chr)) (string->list str)))))

(define (validate-passwords entries policy)
  (apply + (map (lambda (entry)
    (let
      ((idx (string-idx entry #\-))
       (jdx (string-idx entry #\space)))
      (let
        ((i (string->number (substring entry 0 idx)))
         (j (string->number (substring entry (+ idx 1) jdx)))
         (c (string-ref entry (+ jdx 1)))
         (s (substring entry (+ jdx 4) (string-length entry))))
        (policy s c i j))))
      entries)))

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
