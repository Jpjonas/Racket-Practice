;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 4|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;Una posición es (make-posn Number Number)
;interpretación: un elemento en posn representa una
;posición en coordenadas cartesianas
;(define-struct posn [x y])

;El primer número representa la cordenada x y el segundo 
;la cordenada y de una posición en el plano
;(define make-posn x y)

;Devuelve la cordenada x de una posición.
;(define posn-x pos)

;Devuelve la cordenada y de una posición.
;(define posn-y pos)

;Devuelve #true si es una posición, o #false si no es.
;(define posn? pos)

;============================================================
(define p (make-posn 3 4))
(define q (make-posn -2 0.5))

(posn-y (make-posn (posn-y q) (posn-x p)))

;definición de q
(posn-y (make-posn (posn-y (make-posn -2 0.5)) (posn-x p)))

;(ley 2)
(posn-y (make-posn 0.5 (posn-x p)))

;definición de p
(posn-y (make-posn 0.5 (posn-x (make-posn 3 4))))

;(ley 1)
(posn-y (make-posn 0.5 3))

;(ley 2)
3
posn-x