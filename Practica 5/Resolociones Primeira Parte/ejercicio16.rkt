;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ejercicio16) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
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

; La constante que determina la distancia máxima al origen para que un punto sea considerado cercano.
(define MAX 5)

; cerca : ListaDePuntos -> ListaDePuntos
; Dada una ListaDePuntos, devuelve otra ListaDePuntos que contiene aquellos puntos que tienen una distancia al origen menor a MAX
(check-expect (cerca empty) empty)
(check-expect (cerca (list (make-posn 3 5) (make-posn 1 2) (make-posn 0 1) (make-posn 5 6))) (list (make-posn 1 2) (make-posn 0 1)))
(check-expect (cerca (list (make-posn 5 5))) empty)
(define (cerca l)(cond[(empty? l) empty]
                      [else ( if (< (distancia (first l)) MAX)
                                    (cons (first l) (cerca (rest l)))
                                    (cerca (rest l)))]))
