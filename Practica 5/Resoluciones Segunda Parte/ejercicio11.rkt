;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ejercicio11) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; Práctica 5, segunda parte
; Ejercicio 11

; ListN es:
; empty
; (cons Number ListN)
; interpretación: Un elemento de ListN es una lista de números

; algun-pos: ListN -> Boolean
; dada una lista de listas de números,
; devuelve #true si para alguna lista la suma de sus elementos es positiva
(check-expect (algun-pos (list (list 1 3 -4 -2) (list 1 2 3 -5) (list 4 -9 -7 8 -3))) #t)
(check-expect (algun-pos (list empty (list 1 2 3))) #t)
(check-expect (algun-pos (list (list -1 2 -3 4 -5) empty (list -3 -4))) #f)
(check-expect (algun-pos empty) #f)
(define (algun-pos l)
  (cons? (filter positive? (map suma l))))

;; Idea:
; 1) Calculamos la suma de cada elemento de l (recordemos que cada elemento es una lista).
; Para el primer caso de prueba, tendríamos la lista (list -2 1 -7)
; Para el tercer caso de prueba, tendríamos la lista (list -3 -7)
; 2) Nos quedamos con los números positivos de estos resultados.
; Para el primer caso de prueba, tendríamos la lista (list 1)
; Para el tercer caso de prueba, tendríamos la lista empty
; 3) Si la lista que nos quedó es no vacía, entonces la suma de algunas de las listas
; era positiva, por lo que podemos devolver #true. Por eso nos preguntamos si tenemos
; una lista no vacía (con el predicado cons?).

; suma : ListN -> ListN
; suma todos los elementos de una lista de números
(check-expect (suma (list 1 2 3 4 5)) 15)
(check-expect (suma empty) 0)
(check-expect (suma (list 11 13 9)) 33)
(define (suma l) (foldr + 0 l))