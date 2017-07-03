;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Ejercicio 1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;EJERCICIO 1
(define (sumanat x y)
  (cond [(= y 0) x]
        [else (add1 (sumanat x (sub1 y)))]))

(sumanat 2 3)

;EJERCICIO 2
(define (multiplicar x y)
  (cond [(= y 1) x] 
        [else (+ x (multiplicar x (sub1 y)))]))

(multiplicar 2 3)


;EJERCICIO 3
(define (powernat x y)
  (cond [(= y 1) x]
        [else (multiplicar x (powernat x (sub1 y)))]))

(powernat 4 2)

;EJERCICIO 4
(define (intervalo x)
  (cond [(= x 0) empty]
        [else ()]))