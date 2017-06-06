;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ejercicio17) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; ListN es:
; empty
; (cons Number ListN)
; interpretación: Un elemento de ListN es una lista de números

; positivos : ListN -> ListN
; Dada una ListN, devuelve otra ListN que contiene aquellos elementos que son mayores que cero.
(check-expect (positivos empty) empty)
(check-expect (positivos (list -5 37 -23 0 12)) (list 37 12))
(check-expect (positivos (list -1 -2 -3)) empty)
(define (positivos l)(cond[(empty? l) empty]
                           [else ( if (positive? (first l))
                                      (cons (first l) (positivos (rest l)))
                                      (positivos (rest l)))]))
