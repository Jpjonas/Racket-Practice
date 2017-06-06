;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ejercicio18) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; ListN es:
; - empty
; - (cons Número ListN)
; interpretación: un objeto de ListN es una lista cuyos objetos son números.

; eliminar : ListN Número -> ListN
; Dada una lista l  y un número n, devuelve una lista con aquellos elementos de l
; que son distintos a n
(check-expect (eliminar (list 1 2 3 2 7 6) 2) (list 1 3 7 6))
(check-expect (eliminar (list -2 -2 -2 -2) -2) empty)
(check-expect  (eliminar (list 1 2 3 2 7 6) 0)  (list 1 2 3 2 7 6))
(define (eliminar l n)
  (cond [(empty? l) empty]
        [else ( if (equal? (first l) n)
                   (eliminar (rest l) n)
                   (cons (first l) (eliminar (rest l) n)))]))
