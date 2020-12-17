(load "read_lines.scm")
(load "tokenize.scm")

(define (right-fold passports)
  (if (not (null? passports))
    (if (not (= (string-length (car passports)) 0))
      (append (tokenize (car passports) #\space) (right-fold (cdr passports)))
      (list (right-fold (cdr passports))))
    '()))

(define (unfold passports)
  (if (not (null? passports))
    (let ((tail (reverse passports)))
      (if (not (pair? (car tail)))
        (list tail)
        (cons (cdr tail) (unfold (car tail)))
      ))
    '()))

(define (get-fields passport)
  (map (lambda (field) (tokenize field #\:)) passport))

(define (range lo hi year)
  (let ((y (string->number year)))
    (and (>= y lo) (<= y hi))))

(define (valid-height height)
  (let ((unit (substring height (- (string-length height) 2) (string-length height)))
        (h (string->number (substring height 0 (- (string-length height) 2)))))
    (if (string=? unit "cm")
        (and (>= h 150) (<= h 193))
        (and (string=? unit "in") (>= h 59) (<= h 76)))))

(define (valid-hair-colour colour)
  (let ((c (string->list colour)))
    (and (char=? (car c) #\#)
      (= (length (lset-intersection char=? (cdr c) (string->list "0123456789abcdef"))) (length (cdr c)))))) 

(define (valid-eye-colour colour)
  (find (lambda (c) (string=? c colour)) eye-colours))

(define (valid-passport-id id)
  (and (= (string-length id) 9)
  (= (length (lset-intersection char=? (string->list id) (string->list "0123456789"))) (string-length id))))

(define (valid-fields passport)
  (and
    (range 1920 2002 (cadar (filter (lambda (field) (string=? (car field) "byr")) passport)))
    (range 2010 2020 (cadar (filter (lambda (field) (string=? (car field) "iyr")) passport)))
    (range 2020 2030 (cadar (filter (lambda (field) (string=? (car field) "eyr")) passport)))
    (valid-height (cadar (filter (lambda (field) (string=? (car field) "hgt")) passport)))
    (valid-hair-colour (cadar (filter (lambda (field) (string=? (car field) "hcl")) passport)))
    (valid-eye-colour (cadar (filter (lambda (field) (string=? (car field) "ecl")) passport)))
    (valid-passport-id (cadar (filter (lambda (field) (string=? (car field) "pid")) passport)))))

(define batch (read-lines "files/4.txt" (lambda (x) x)))
(define required '("byr" "iyr" "eyr" "hgt" "hcl" "ecl" "pid"))
(define eye-colours '("amb" "blu" "brn" "gry" "grn" "hzl" "oth"))

(define candidate-passports
  (filter (lambda (passport)
    (= (length (lset-intersection string=? (map (lambda (field) (car field)) (get-fields passport)) required)) 7))
    (unfold (right-fold batch))))

(display (length candidate-passports)) (newline)

(define valid-passports (filter (lambda (passport) (valid-fields passport))
                           (map (lambda (passport) (get-fields passport)) candidate-passports)))

(display (length valid-passports)) (newline)
