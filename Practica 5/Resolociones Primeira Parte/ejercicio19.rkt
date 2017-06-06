;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ejercicio19) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; ListN es:
; empty
; (cons Number ListN)
; interpretación: Un elemento de ListN es una lista de números

; raices : ListN -> ListN
; dada una lista de números,
;devuelve una lista con las raíces cuadradas de sus elementos.
(check-expect (raices (list 1 4 16 9)) (list 1 2 4 3))
(check-expect (raices empty) empty)
(check-expect (raices (list 0 36 64 49)) (list 0 6 8 7))
(define (raices l)
  (cond [(empty? l) empty]
        [else  (cons (sqrt (first l)) (raices (rest l)))]
        ))
