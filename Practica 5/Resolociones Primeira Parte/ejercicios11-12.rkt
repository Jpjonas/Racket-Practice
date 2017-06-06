;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ejercicios11-12) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; Ejercicio 11
; List es:
; - empty
; - (cons Any List)
; interpretación: un elemento en List es una lista
; de objetos de cualquier clase.

; cant-elementos : List -> Natural
; dada una lista l, devuelve la cantidad de elementos en l
(check-expect (cant-elementos (list 1 2 3 4 5)) 5)
(check-expect (cant-elementos (list "aa" #t)) 2)
(check-expect (cant-elementos empty) 0)
(define (cant-elementos l)
  (cond [(empty? l) 0]
        [else (+ 1 (cant-elementos (rest l)))]
        ))

; ListN es:
; empty
; (cons Number ListN)
; interpretación: Un elemento de ListN es una lista de números

; suma : ListN -> Number
; dada una lista de números, devuelve la suma de sus elementos.
(check-expect (suma empty) 0)
(check-expect (suma (list 1 2 3 4)) 10)
(check-expect (suma (list 4 7 5)) 16)
(define (suma l)
  (cond [(empty? l) 0]
        [else (+ (first l) (suma (rest l)))]
        ))


; promedio : ListN -> Number
; dada una lista de números, devuelve el promedio
(check-expect (promedio empty) 0)
(check-expect (promedio (list 8 8 9 7)) 8)
(check-expect (promedio (list 5 6 7 8 9)) 7)
(define (promedio l)
  (if (empty? l)
      0
      (/ (suma l) (cant-elementos l))
      ))