(load "read_lines.scm")

(define (tokenize str chr)
  (let ((in (memq chr (string->list str)))
        (idx (lambda (s c) (- (string-length s) (length (memq c (string->list s)))))))
    (if in
      (cons (substring str 0 (idx str (car in)))
            (tokenize (substring str (+ (idx str (car in)) 1) (string-length str)) chr))
      (cons str '()))))

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

(define batch (read-lines "files/4.txt" (lambda (x) x)))
(define required '("byr" "iyr" "eyr" "hgt" "hcl" "ecl" "pid"))
(define eye-colours '("amb" "blu" "brn" "gry" "grn" "hzl" "oth"))
(define hair-colour "0123456789abcdef")
(define passport-id "0123456789")

(define passports (unfold (right-fold batch)))

(define (has-required-fields full-fields)
  (= (length (lset-intersection string=? (map (lambda (field) (car field)) full-fields) required)) 7))

(define (get-fields passport)
  (map (lambda (field) (tokenize field #\:)) passport))

(define candidate-passports (filter (lambda (passport) (has-required-fields (get-fields passport))) passports))

(display (length candidate-passports)) (newline)

(define (valid-birth-year byr)
  (let ((b (string->number byr)))
    (and (>= b 1920) (<= b 2002))))

(define (valid-issue-year iyr)
  (let ((i (string->number iyr)))
    (and (>= i 2010) (<= i 2020))))

(define (valid-expiration-year eyr)
  (let ((e (string->number eyr)))
    (and (>= e 2020) (<= e 2030))))

(define (valid-height height)
  (let ((unit (substring height (- (string-length height) 2) (string-length height)))
        (h (string->number (substring height 0 (- (string-length height) 2)))))
    (if (string=? unit "cm")
        (and (>= h 150) (<= h 193))
        (if (string=? unit "in")
          (and (>= h 59) (<= h 76))
          #f))))

(define (valid-hair-colour colour)
  (let ((c (string->list colour)))
    (and (char=? (car c) #\#)
      (= (length (lset-intersection char=? (cdr c) (string->list hair-colour))) (length (cdr c)))))) 

(define (valid-eye-colour colour)
  (find (lambda (c) (string=? c colour)) eye-colours))

(define (valid-passport-id id)
  (and (= (string-length id) 9)
  (= (length (lset-intersection char=? (string->list id) (string->list passport-id))) (string-length id))))

(define (valid-fields passport)
  (and
    (valid-birth-year (cadar (filter (lambda (field) (string=? (car field) "byr")) passport)))
    (valid-issue-year (cadar (filter (lambda (field) (string=? (car field) "iyr")) passport)))
    (valid-expiration-year (cadar (filter (lambda (field) (string=? (car field) "eyr")) passport)))
    (valid-height (cadar (filter (lambda (field) (string=? (car field) "hgt")) passport)))
    (valid-hair-colour (cadar (filter (lambda (field) (string=? (car field) "hcl")) passport)))
    (valid-eye-colour (cadar (filter (lambda (field) (string=? (car field) "ecl")) passport)))
    (valid-passport-id (cadar (filter (lambda (field) (string=? (car field) "pid")) passport)))))

(define mapped-passports (map (lambda (passport) (get-fields passport)) candidate-passports))

(define valid-passports (filter (lambda (passport) (valid-fields passport)) mapped-passports))

(display (length valid-passports)) (newline)
