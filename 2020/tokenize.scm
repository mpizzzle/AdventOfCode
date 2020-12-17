(define (tokenize str chr)
  (let ((in (memq chr (string->list str)))
        (idx (lambda (s c) (- (string-length s) (length (memq c (string->list s)))))))
    (if in
      (cons (substring str 0 (idx str (car in)))
            (tokenize (substring str (+ (idx str (car in)) 1) (string-length str)) chr))
      (cons str '()))))
