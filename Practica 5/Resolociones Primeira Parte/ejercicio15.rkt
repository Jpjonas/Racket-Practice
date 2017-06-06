;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ejercicio15) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; ListN es:
; empty
; (cons Number ListN)
; interpretación: Un elemento de ListN es una lista de números

; mayores : ListN Number -> ListN
; dada una lista de números l y un número n,
; devuelve una lista con aquellos elementos de l que son mayores a n.
(check-expect (mayores (list 5 8 2 4 0) 3)
              (list 5 8 4))
(check-expect (mayores empty 10)
              empty)
(check-expect (mayores (list 90 30 65 60 60 34) 35)
              (list 90 65 60 60))
(define (mayores l n)
  (cond [(empty? l) empty]
        [else (if (> (first l) n)
                  (cons (first l) (mayores (rest l) n))
                  (mayores (rest l) n))]
        ))