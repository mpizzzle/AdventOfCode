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

(define passports (unfold (right-fold batch)))
(define fields (map (lambda (passport) (map (lambda (s) (car (tokenize s #\:))) passport)) passports))

(define (has-required-fields fields)
  (= (length (lset-intersection string=? fields required)) 7))

(define (get-fields passport)
  (map (lambda (field) (car (tokenize field #\:))) passport))

(define valid-passports (filter (lambda (passport) (has-required-fields (get-fields passport))) passports))

(display (length valid-passports)) (newline)

(define (valid-birth-year date)
)
 
(define (valid-issue-year date)
)
 
(define (valid-expiration-year date)
)
 
(define (valid-height height)
)
 
(define (valid-hair-colour colour)
)
 
(define (valid-eye-colour colour)
)
 
(define (valid-passport-id id)
)
 
