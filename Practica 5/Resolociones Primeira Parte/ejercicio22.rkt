;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ejercicio22) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;sgn2 : Number -> Number
;Dado un número, devuelve otro que indica si es positivo, negativo o cero.
(check-expect (sgn2 0) 0)
(check-expect (sgn2 10) 1)
(check-expect (sgn2 -3.3) -1)
(define (sgn2 x) (cond [(< x 0) -1]
                       [(= x 0) 0]
                       [(> x 0) 1]))

; ListN es:
; empty
; (cons Number ListN)
; interpretación: Un elemento de ListN es una lista de números

; signos : ListN -> ListN
; Dada una ListNs, devuelve otra ListN que contiene el resultado de aplicarle a cada elemento la función sgn2
(check-expect (signos empty) empty)
(check-expect (signos (list 45 32 -23 0 12)) (list 1 1 -1 0 1))
(check-expect (signos (list 4 5 -1 0 0 -5)) (list 1 1 -1 0 0 -1))
(define (signos l)
  (cond [(empty? l) empty]
        [else (cons (sgn2 (first l)) (signos (rest l)))]
        ))
