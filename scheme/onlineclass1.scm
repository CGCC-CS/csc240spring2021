#lang scheme

; Scheme comments start with a semi-colon
(+ 1 7)
(* 8 8)
(+ 43 2 14 3 483 382 40 30)
(* 10000 10000 437843784343 4432432433 2432432 14 3 484324324233 384324322 40 30)
1
"Scheme"
'Prolog
227/19

(define a 10)
(define class "CSC240")
(define subject 'Scheme)

(newline)
"Predicates"
(string? subject)
(string? class)
(number? a)
(number? class)

(newline)
"Literals"
3  ;integer literal
#b101 ;binary literal
42/5 ;fraction
3+2i ;imaginary literal

(newline)
"Functions"
(lambda (x) (+ x 1))      ; unnamed procedure
((lambda (x) (+ x 1)) 30)
((lambda (x) (+ x 1)) a)

(define increment (lambda (x) (+ x 1)))
(increment 30)
(increment a)

(define abso
  (lambda (x)
    (if (< x 0)
        (- x)
        x)))

(newline)
"Lists"
(list 1 2 3 4)
'(1 2 3 4)
(quote (1 2 3 4))
(define lst '(a b c d))
(define lst2 (list a 'b 'c 'd))
lst
lst2

(car lst)
(cdr lst)
(cons 0 lst)
(cons lst '(-4 -3 -2 -1 0))
(car (cdr (cdr lst)))
(cdr (cdr (cdr lst)))
(car (cdr (cdr (cdr lst))))
(cdr (cdr (cdr (cdr lst))))

(define procs (list sqrt increment list))
procs
((car procs) 25)
((cadr procs) 25)
((caddr procs) 25)