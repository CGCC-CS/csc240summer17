#lang scheme

(define member-of
  (lambda (e lst)
    (if (null? lst)
        #f
        (if (= e (car lst))
            #t
            (member-of e (cdr lst))))))
(member-of 3 '(1 2 3 4))
(member-of 3 '(2 4 6 8 10))
;(member-of 3 '(1 . 3))
(member-of 3 '(1 . (3 . 4)))
;(member-of 3 '(1 . (4 . 3)))
(member-of 3 '(1 . (4 . (3 . '()))))
(list? '(1 . (4 . (3 . '()))))
(list? '(1 . (4 . 3)))

; Higher order procedures
(define red
  (lambda (operation base-case lst)
    (if (null? lst)
        base-case
        (operation (car lst) (red operation base-case (cdr lst))))))
(red + 0 '(1 2 3 4 5))  ; add all #'s
(red * 1 '(1 2 3 4 5))  ; multiply all #'s 
(red (lambda (head tail) (cons (* head head) tail)) '() '(1 2 3 4 5)) ; square
(red (lambda (a b) (+ 1 b)) 0 '(1 2 3 4 5)) ; find length
(red (lambda (a b) 42) 21 '(1 2 3 4 5))

(newline)"Higher order functions - apply"
(define lst '(1 2 3 4 5 6 7 8 9 10 11 12 13))
(define lstn '(0 -1 2 -3 4 -5 6 -7 8 -9 10 -11 12 -13))
(define badlst (list 1 'a + 10 'hello lst '(1 2 3) '(a . b) red  8 6 -3))
(apply + lst)
(apply + lstn)
(apply * lst)
(apply * lstn)

(newline)"Higher order functions - map"
(map (lambda (x) (+ x 1)) lst)
(map (lambda (x) (+ x 1)) lstn)
(map (lambda (x) (if (< x 0) 0 x)) lst)
(map (lambda (x) (if (< x 0) 0 x)) lstn)
(map (lambda (head tail) (cons (* head head) tail)) lstn lstn)

(newline)"Higher order functions - filter"
(filter (lambda (x) (>= x 0)) lst)
(filter (lambda (x) (>= x 0)) lstn)
(filter number? badlst)
(filter (lambda (x) (not (= (remainder x 2) 0))) lst)

(newline)"Functions are first-class objects"
(define quad
  (lambda (lst)
    (let ((a (car lst))
          (b (cadr lst))
          (c (caddr lst)))
      (lambda (x)
        (+ (* a x x) (* b x) c)))))

(define f1 (quad '(1 1 1)))
(define f2 (quad '(1 2 3)))
(define f3 (quad '(2 4 2)))
(f1 1)
(f1 2)
(f2 1)
(f2 4)
(f3 4)
(f3 10)

(newline)"Advanced examples"
; numbers in badlist which are <8 when incremented
(filter (lambda (x) (< x 8))
        (map (lambda (x) (+ x 1))
             (filter number? badlst)))

; sum numbers in badlist which are <8 when incremented
(apply +
       (filter (lambda (x) (< x 8))
        (map (lambda (x) (+ x 1))
             (filter number? badlst))))

(newline)"Towers of Hanoi"
(define hanoi 
  (lambda (n source center destination)
    (if (= n 1)  ; stopping condition
      (begin  
         (display "move top disk from ")
         (display source)
         (display " to ")
         (display destination)
         (newline)
         )
      (begin
          (hanoi (- n 1) source destination center)
          (hanoi 1 source center destination)
          (hanoi (- n 1) center source destination)
          )
      )))
(hanoi 4 'red 'yellow 'green)

(newline)"let structures (scope)"
(define let-test
  (lambda (x)
    (let
        ((a (* 2 x))
         (b (+ x 1))
         (c 10))
      (+ x a b c))))
(let-test 5)

(define min
  (lambda (lst)
    (if (= (length lst) 1)
        (car lst)
        (let
            ((cmin (min (cdr lst))))
          (if (< (car lst) cmin)
              (car lst)
              cmin)))))
(min lst)
(min lstn)

; another example
(define min2
  (lambda (lst)
    (let
        ((first (car lst)))
    (if (= (length lst) 1)
        first
        (let
            ((cmin (min (cdr lst))))
          (if (< first cmin)
              first
              cmin))))))
(min2 lst)
(min2 lstn)

(define a 1)
(let 
    ((a 4)
     (b 6))
  (+ a b))
a

((lambda (a b) (+ a b)) 4 6)

(let
    ((a 4)
     (b (+ a 2)))
  (+ a b))

(define habitat-material
  (lambda (height radius thickness)
    (let
        ( (pi 3.14159265) )
          (let
              ( (cylinder_volume
                 (lambda (r h)
                   (* h (* pi (* r r))))))
            (- 
             (cylinder_volume radius height)
             (cylinder_volume (- radius thickness) (- height (* 2 thickness))))))))
(habitat-material 10 5 1)

(let
    ((+ 10)
     (- 4)
     (* -))
  (* + -))

(newline)"External code"
(require "scheme3inc.scm")
(fib-tail 10)

; Really advanced stuff - not needed for project
(define hello
  (case-lambda
    (() "Hello World")
    ((name) (string-append "Hello " name))))
(hello)
(hello "John")

(define multiple-of-2-and-5
  (lambda (n)
    (match (list (remainder n 2) (remainder n 5))
      ((list 0 0) #t)
      ((list _ 0) 'almost)  ; if remainder n 5 = 0
      (_ #f))))
(multiple-of-2-and-5 20)
(multiple-of-2-and-5 15)
(multiple-of-2-and-5 17)

(map multiple-of-2-and-5 lst)
(map multiple-of-2-and-5 lstn)
