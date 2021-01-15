#lang scheme

"Scheme Review"

(define x 5)
(define y -3)
(define z 12)

(+ x y z)
(* (+ x 4) (* y z) (- x y))

(define square
  (lambda (x)
    (* x x)))
(square 10)
(square x)
(square (* x z))

"Lists"
(list 1 2 3 4)
(quote (a b c d))
(list x y z +)
(list 'x y z '+)
(quote (x y z +))
(define lst (list 1 2 3 4 5))
(car lst)
(cdr lst)
(cons 0 lst)
(cons '(1 2 3) '(4 5 6))
(append '(1 2 3) '(4 5 6))

"Pairs"
(cons 1 2)
(define pr '(a . b))
(car pr)
(cdr pr)
(cons 3 '())

(newline)
"Example list procedures"
(define add-list
  (lambda (lst)
    (if (null? lst)
        0
        (+ (car lst) (add-list (cdr lst))))))
(add-list '(10 37 39))
(add-list lst)

(define halve-each-element
  (lambda (lst)
    (if (null? lst)
        '()
        (cons (/ (car lst) 2) (halve-each-element (cdr lst))))))
(halve-each-element '(37 89 44 28))
(halve-each-element lst)

(newline)
"Higher-order functions"
(define red
  (lambda (operator base-case lst)
    (if (null? lst)
        base-case
        (operator (car lst) (red operator base-case (cdr lst))))))

lst
"Sum the list"
(red + 0 lst)
"Multiply everything in the list"
(red * 1 lst)
"Double every element in a list"
(red (lambda (x y) (cons (* 2 x) y)) '() lst)
"Length"
(red (lambda (x y) (+ 1 y)) 0 lst)
"Get all even numbers"
(red (lambda (x y) (if (= 1 (remainder x 2)) y (cons x y))) '() lst)
"Reverse"
(red (lambda (x y) (append y (list x))) '() lst)

"apply, map, filter"
(apply + lst)
(apply * lst)
(map (lambda (x) (+ x 3)) lst)
(map (lambda (x) (/ x 2)) lst)
(map number? '(1 a 2 b "hello" 'world' + 4 red))
(filter number? '(1 a 2 b "hello" 'world' + 4 red))
(apply + (map square (filter number? '(1 a 2 b "hello" 'world' + 4 red))))

(newline)
"let structures"
(define a 3)
(define b 5)
(let
    ((a 10)
     (b 11))
  (+ a b))

; be careful
(let
    ((a 10)
     (b (+ a 5)))
  (+ a b))

(define double-pi-list
  (lambda (lst)
    (let
        ((double (lambda (x) (* x 2)))
         (pi 3.14159))
      (if (null? lst)
          '()
          (cons (* pi (double (car lst))) (double-pi-list (cdr lst)))))))
(double-pi-list lst)

"let -> lambda"
(let
    ((a 20)
     (b 10))
  (+ a b))

((lambda (a b) (+ a b)) 20 10)

"lambda -> let"
((lambda (m n) (- m n)) 35 17)

(let
    ((m 35)
     (n 17))
  (- m n))

(newline)
"Currying"
(define sum
  (lambda (x y)
    (+ x y)))

(define increment-creator
  (lambda (x)
    (lambda (y)
      (sum x y))))
(define increment
  (lambda (n)
    ((increment-creator 1) n)))
(define add10
  (lambda (n)
    ((increment-creator 10) n)))

(increment 42)
(add10 42)

(define f
  (lambda (a b c)
    (lambda (x)
      (+ (* a x x) (* b x) c))))
((f 1 1 1) 3)
((f 1 1 1) -2)
((f 1 2 3) 7)

