#lang scheme
(define x 3)

"Defining lists"
(define lst1 '(1 2 3 4))
(define lst2 (cons 'a '(b c d)))
(define lst3 (list 'w 'x 'y 'z))
(define lst4 (list 'w x 'y 'z))
(define lst5 (append '(7 8) (cons 9 '(10))))
(define lst6 (cons '(7 8) (cons 9 '(10))))
lst1
lst2
lst3
lst4
lst5
lst6

(newline)
"Creating new lists"
(cons 0 lst1)
(append lst1 lst5)
(append lst1 (cons 5 (cons 6 lst5)))

(newline)
"Defining list procedures"

"sum-list"
(define sum-list
  (lambda (lst)
    (if (null? lst)   ; check if list = '()
        0
        (+ (car lst) (sum-list (cdr lst))))))
lst1
(sum-list lst1)
lst5
(sum-list lst5)
(append lst1 (cons 5 (cons 6 lst5)))
(sum-list (append lst1 (cons 5 (cons 6 lst5))))

"remove-odds"
(define odd?
  (lambda (x)
    (= (remainder x 2) 1)))
(define remove-odds
  (lambda (lst)
    (cond
      ((null? lst) '())
      ((odd? (car lst)) (remove-odds (cdr lst)))
      (else (cons (car lst) (remove-odds (cdr lst)))))))
lst1
(remove-odds lst1)
lst5
(remove-odds lst5)
(append lst1 (cons 5 (cons 6 lst5)))
(remove-odds (append lst1 (cons 5 (cons 6 lst5))))

"Compare two lists"
(define list-equal?
  (lambda (lst1 lst2)
    (cond
      ((and (null? lst1) (null? lst2)) #t)
      ((null? lst1) #f)
      ((null? lst2) #f)
      ((equal? (car lst1) (car lst2)) (list-equal? (cdr lst1) (cdr lst2)))
      (else #f))))

(list-equal? '(1 2 3) '(1 2 3))
(list-equal? '(0 1 2 3) (append '(0 1) (cons 2 (cons 3 '()))))
(list-equal? '(3 2 1) '(1 2 3))
(list-equal? '(0 1 2 3) (cons '(0 1) (cons 2 (cons 3 '()))))
(list-equal? '((0 1) 2 3) (cons '(0 1) (cons 2 (cons 3 '()))))

(newline)
"list?"
(list? lst1)
(list? (append lst1 (cons 5 (cons 6 lst5))))
(list? '())
(list? (cons 'x '()))
(list? (cons 'x 'y))

(newline)
"pair?"
(pair? lst1)
(pair? (append lst1 (cons 5 (cons 6 lst5))))
(pair? '())
(pair? (cons 'x '()))
(pair? (cons 'x 'y))
      