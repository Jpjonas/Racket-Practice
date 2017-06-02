;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 4 Ej 3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;Calcula la distancia al origen
;dist-origen: posn -> Number
;Función responsable por calcular la distancia de un punto "posn" al origen
(define (dist-origen pos)
  (cond [(posn? pos) (sqrt (+ (sqr (posn-x pos)) (sqr (posn-y pos))))]
        [else "No es un posn"]))

(dist-origen (make-posn (/ 6 2) 4))
;5

(+ (dist-origen (make-posn 12 5)) 4)
;17