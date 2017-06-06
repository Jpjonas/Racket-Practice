;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ejercicio26) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; ListN es:
; empty
; (cons Number ListN)
; interpretación: Un elemento de ListN es una lista de números

; prod: ListN -> Number
; dada una lista de números, devuelve el producto de sus elementos
(check-expect (prod (list 1 2 3 4 5)) 120)
(check-expect (prod (list 1 4 5 6234 23432 0 234234)) 0)
(check-expect (prod empty) 1)
(define (prod l)
  (cond [(empty? l) 1]
        [else (* (first l) (prod (rest l)))]
        ))