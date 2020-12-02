(define (read-lines . args)
  (let ((p (cond ((string? (car args)) (open-input-file (car args))))))
    (let loop ((line (read-line p)) (lines (list)))
      (if (eof-object? line)
        (begin
          (if (and (pair? args) (string? (car args)))
            (close-input-port p))
          (reverse lines))
        (loop (read-line p) (cons line lines))))))

(define (string-index str tok idx)
  (if (not (null? str))
    (if (char=? (car (string->list str)) tok)
      idx
      (string-index (list->string (cdr (string->list str))) tok (+ idx 1)))
    -1))

(define (char-count str chr count)
  (if (not (= 0 (string-length str)))
      (char-count (list->string (cdr (string->list str))) chr
        (if (char=? (car (string->list str)) chr)(+ count 1) count))
    count))

(define (valid-password entry)
  (let
    ((idx (string-index entry #\- 0))
     (idx2 (string-index entry #\space 0)))
    (let
      ((i (string->number (substring entry 0 idx)))
       (j (string->number (substring entry (+ idx 1) idx2)))
       (c (string-ref entry (+ idx2 1)))
       (s (substring entry (+ idx2 4) (string-length entry))))
      (let ((count (char-count s c 0)))
        (if (and (>= count i) (<= count j)) 1 0)))))

(define (part-1 entries)
  (if (not (null? entries))
    (+ (valid-password (car entries))
    (part-1 (cdr entries)))
    0))

(define input (read-lines "files/2.txt"))

(part-1 input)
