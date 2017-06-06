;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ejercicio20) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; distancia : Posn -> Number
; Dada una estructura posn que representa un punto en el plano, devuelve su distancia al origen
(check-expect (distancia (make-posn 10 0)) 10)
(check-expect (distancia (make-posn 0 -2)) 2)
(check-expect (distancia (make-posn 0 0)) 0)
(check-expect (distancia (make-posn 3 4)) 5 )
(define (distancia p) (sqrt (+ (sqr(posn-x p) ) (sqr(posn-y p) ))))

; ListaDePuntos es:
; - empty
; - (cons Posn ListaDePuntos)
; interpretación: un objeto de ListaDePuntos es una lista de estructuras posn.

; ListN es:
; empty
; (cons Number ListN)
; interpretación: Un elemento de ListN es una lista de números

; distancias : ListaDePuntos -> ListN
; Dada una ListaDePuntos, devuelve una ListN que contiene la distancia al origen de cada uno de los puntos.
(check-expect (distancias empty) empty)
(check-expect(distancias (list (make-posn 3 4) (make-posn 0 4) (make-posn 12 5))) (list 5 4 13))
(check-expect (distancias (list (make-posn 4 3))) (list 5))
(define (distancias l)
  (cond [(empty? l) empty]
        [else (cons (distancia (first l)) (distancias (rest l)))]
        ))
