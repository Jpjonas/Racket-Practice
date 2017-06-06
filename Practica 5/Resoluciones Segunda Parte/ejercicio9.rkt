;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ejercicio9) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Práctica 5, segunda parte
; ejercicio 9

; ListN es:
; empty
; (cons Number ListN)
; interpretación: Un elemento de ListN es una lista de números

; raices : ListN -> ListN
; dada una lista l,  devuelve una lista con las
; raíces cuadradas de los números no negativos de l. 
(check-expect (raices (list -4 4 9)) (list 2 3))
(check-expect (raices (list -9 36 49 0)) (list 6 7 0))
(check-expect (raices empty) empty)
(define (raices l)
  (map sqrt (filter noNeg? l)))

; noNeg? : Number -> Boolean
; dado un número, devuelve #true si es no negativo
(check-expect (noNeg? -4) #f)
(check-expect (noNeg? 4) #t)
(check-expect (noNeg? 0) #t)
(define (noNeg? x) (>= x 0))

