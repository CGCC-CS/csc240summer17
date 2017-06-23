#lang scheme
"Tail recursive Fibonacci implementation"(newline)
(define fib-tail
  (lambda (x)
    (fib-tail-acc x 0 1)))
(define fib-tail-acc
  (lambda (x f2 f1)
    (if (<= x 0)
        f2
        (fib-tail-acc (- x 1) f1 (+ f1 f2)))))
(fib-tail 1)
(fib-tail 2)
(fib-tail 10)
;(fib-tail 1000)

(newline)"Lists"
(define lst0 (+ 2 3))
(define lst1 '(+ 2 3))
(define lst2 (list + 2 3))
lst0
lst1
lst2
(define exlst0 (list 2 3))
(define exlst1 (list list 2 3))
(define exlst2 (list list 2 3 (list + 2 3) (+ 2 3)))
(define exlst3 '(list 2 3 (list + 2 3) (+ 2 3)))
exlst0
exlst1
exlst2
exlst3
(car lst1)

;lst2 -> (list + 2 3)
;     +            2                    3
((car lst2) (car (cdr lst2)) (car (cdr (cdr lst2))))

;lst1 -> '(+ 2 3)
;+     '+            '2                '3
;((car lst1) (car (cdr lst1)) (car (cdr (cdr lst1))))


(newline)"Procecures are first-class objects"
(define doto-10-20
  (lambda (x)
    (x 10 20)))
(doto-10-20 +)
(doto-10-20 -)
(doto-10-20 list)
(doto-10-20 (car lst2))
(doto-10-20 (lambda (x y) (+ (* x x) (* y y))))
(doto-10-20 (lambda (x y) (fib-tail x)))

(newline)"Conditional"
(define what-is-it?
  (lambda (x)
    (cond
      ((not (number? x)) "Not a number")
      ((< x 0) "Negative")
      ((= x 0) "Zero")
      (else "Positive"))))
(what-is-it? 'Number)
(what-is-it? -5)
(what-is-it? 0)
(what-is-it? 5)

(newline)"Math"
(/ 30 7)
(/ 30 7.0)
(quotient 30 7)
(remainder 30 7)
(expt 2 10)

(newline)"Boolean"
(< 4 10)
(> 4 10)
(<= 4 10)
(>= 4 10)
(not #f)
(or #t #f)
(and #t #f)
(or (integer? 6) (symbol? 'six))
(and (integer? 6) (symbol? 6))

(newline) "Strings vs Symbols"
(define str1 "Hello")
(define sym1 'World)
str1 
sym1
(string? str1)
(string? sym1)
(symbol? str1)
(symbol? sym1)
(string->symbol str1)
(symbol->string sym1)

(newline)"Lists"
(car '(a))
(cdr '(a))
(define lst '(1 2 3 4))
lst
(car lst)
(cdr lst)
(cons 0 lst)
(cons '(-2 -1 0) lst)
(append '(-2 -1 0) lst)
(append (list 0) lst)
(cons lst1 lst)
(newline)"Complex lists"
(define lstx '((1 2) 3 (4 (5 6)) (7 8 9)))
(car lstx)
(cdr lstx)
(car (cdr (cdr lstx)))
(cdr (car (cdr (cdr lstx))))
(car (cdr (car (cdr (cdr lstx)))))
(cdr (car (cdr (car (cdr (cdr lstx))))))
(car (cdr (car (cdr (car (cdr (cdr lstx)))))))

(newline)"List functions"
lst
;helper function
(define non-empty-list? 
  (lambda (lst)
    (if (or (not (list? lst)) (empty? lst))
        #f
        #t)))
(non-empty-list? 'list)
(non-empty-list? '(1 2 3 4))

(define sumlist
  (lambda (lst)
    (if (or (not (list? lst)) (empty? lst))
        0
        (+ (car lst) (sumlist (cdr lst))))))
(sumlist lst)

(define do-nothing
  (lambda (lst)
    (if (not (non-empty-list? lst))
        '()
        (cons (car lst) (do-nothing (cdr lst))))))
(do-nothing lst)

;double all items in a list
(define double (lambda (x) (* x 2)))
(define doublelist
  (lambda (lst)
    (if (not (non-empty-list? lst))
        '()
        (cons (double (car lst)) (doublelist (cdr lst))))))
(doublelist lst)

;calculate the sum of all doubles of the list
(define sum-doubles
  (lambda (lst)
    (if (or (not (list? lst)) (empty? lst))
        0
        (+ (double (car lst)) (sum-doubles (cdr lst))))))
(sum-doubles lst)

(define better-sum-doubles
  (lambda (lst)
    (sumlist (doublelist lst))))
(better-sum-doubles lst)

(define allnums
  (lambda (lst)
    (if (not (non-empty-list? lst))
        '()
        (if (not (number? (car lst)))
            (allnums (cdr lst))
            (cons (car lst) (allnums (cdr lst)))))))
(allnums lst)
(allnums '(A B 1 2 D))
(allnums '(1 A B 2))
(allnums '(a b c 1 2 3 'Hello '(4 5 6)))

(newline)"Pairs"
(pair? 1)
(pair? 'pair)
(pair? '(a . b))
(pair? '(a b))
(define pair '(a . b))
pair
(car pair)
(cdr pair)
(cons 'a 'b)
(cons 'b '())
(cons 'a (cons 'b '()))