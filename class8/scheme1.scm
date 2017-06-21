#lang scheme
; literals
"Math"
3

;Math
(* 10 10)
(+ 1 2)
(* 3 4)
(+ 1 2 3 4 5 6 7 8 9 10)
(* 1 2 3 4 5 6 7 8 9 10)
(* (/ (* 7 (- 8 2)) (/ (* 6 3) (* 2 2 3 (/ 1 2)))))

(newline)
"Division"
(remainder 20 8)
(/ 20 8)
(/ 20.0 8.0)
'(/ 10 5)

(newline)
"Define x & y"
(define x 10)
(define y 20)
(define (z) 30)   ; this defines a scheme form that evaluates to 30
x
y
z
(z)

(newline)
"Define a procedure"
(lambda (x) (* 3 x))  ; unnamed procedure
((lambda (x) (* 3 x)) 9)
((lambda (x) (* 3 x)) y)
(define trip (lambda (x) (* 3 x)))
(trip 9)
(trip y)
(trip (z))
(+ x (z) (trip 5))

(newline)
"Recursion"
(define fact
  (lambda (n)
    (if (<= n 1)
        1
        (* n (fact (- n 1))))))
(fact 10)
;(fact 1000)

"tail-recursion"
(define fact-tail
  (lambda (n)
    (fact-tail-acc n 1)))
(define fact-tail-acc
  (lambda (n acc)
    (if (<= n 1)
        acc
        (fact-tail-acc (- n 1) (* n acc)))))
(fact-tail 10)

(newline)
"lists"
(list x y z)
(list 'x 'y 'z)
'(x y z)
(quote (x y z))
(define lst '(a b c))
(define lst2 (list 'a 2 "hello" 'world / + fact-tail 18 'a #\H))
(define oplist (list + / -))
lst
lst2
(car lst)
(cdr lst)
(car (cdr lst))
(car (cdr (cdr lst)))
(cdr (cdr (cdr lst)))
(cdr (list 1))
(cadr lst)  ; car of the cdr of lst
;(car '())
(caddr lst)
(car '((4 5 6)))
(cdr (car '((4 5 6))))
(car (cdr (car (cdr '((1 2) (3 4 (5 6)) (7 8))))))  ; 4
(cdr (cdr (car (cdr '((1 2) (3 4 (5 6)) (7 8))))))  ; ((5 6))
(car (cdr (cdr (car (cdr '((1 2) (3 4 (5 6)) (7 8))))))) ; (5 6)
(car (car (cdr (cdr (car (cdr '((1 2) (3 4 (5 6)) (7 8)))))))) ; 5
(car '(1))
(cdr '(1))

(newline)
"Checking equality"
(= 32 32)
(eq? 32 32)
(equal? 32 32)
(equal? 32 34)
(eq? 'X 'X)
(eq? '(1 2 3) '(1 2 3))
(equal? 'X 'X)
(equal? '(1 2 3) '(1 2 3))
(= 32 (* 4 8))
(= '32 (* 4 8))

(newline)
"Symbols & Strings"
(symbol? "hello")
(string? "hello")
(symbol? 'hello)
(string? 'hello)
(symbol->string 'hello)
(string->symbol "hello")

(newline)
"Cool example"
oplist
((car oplist) 1 2 3)
((car (cdr oplist)) 24 7)
lst2
(cddddr lst2)
(cadddr lst2)
(caddr (cddddr lst2))
((caddr (cddddr lst2)) 10)