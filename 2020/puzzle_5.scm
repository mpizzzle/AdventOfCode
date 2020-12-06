(define (pow x y)
  (define p
    (lambda (x y t)
      (cond ((= y 0) t)
            ((> y 0) (p x (- y 1) (* x t))))))
  (p x y 1))

(define (get-partition partition chr)
  (if (not (null? partition))
    (if (char=? (car partition) chr)
      (+ (get-partition (cdr partition) chr) (pow 2 (- (length partition) 1)))
      (get-partition (cdr partition) chr))
    0))

(define (get-seat-id partition)
  (+ (* (get-partition (string->list (substring partition 0 7)) #\B) 8)
  (get-partition (string->list (substring partition 7 10)) #\R)))

(define (empty-seat-id seat-ids)
  (if (= (+ (car seat-ids) 2) (cadr seat-ids))
    (+ (car seat-ids) 1)
    (empty-seat-id (cdr seat-ids))))

(load "read_lines.scm")
(define partitions (read-lines "files/5.txt" (lambda (x) x)))

(display (apply max (map (lambda (p) (get-seat-id p)) partitions))) (newline)
(display (empty-seat-id (sort (map (lambda (p) (get-seat-id p)) partitions) <))) (newline)
