(define (read-lines . args)
  (let ((p (cond ((null? args) (current-input-port))
                 ((port? (car args)) (car args))
                 ((string? (car args)) (open-input-file (car args)))
                 (else (error 'read-lines "bad argument")))))
    (let loop ((line (read-line p)) (lines (list)))
      (if (eof-object? line)
        (begin
          (if (and (pair? args) (string? (car args)))
            (close-input-port p))
          (reverse lines))
        (loop (read-line p) (cons (string->number line) lines))))))

(define (walk-list-compare lst fun)
  (if (not (list? lst))
    (if (= 2020 (+ lst fun))
      (display (* lst fun)))
    (if (not (null? lst))
      (begin
        (walk-list-compare (car lst) fun)
        (walk-list-compare (cdr lst) fun)))))

(define (do-thing lst fun blep)
  (if (not (list? lst))
    (fun blep lst)
    (if (not (null? lst))
      (begin
        (do-thing (car lst) fun blep)
        (do-thing (cdr lst) fun blep)))))

(define entries (read-lines "files/1.txt"))

(do-thing entries walk-list-compare entries)
