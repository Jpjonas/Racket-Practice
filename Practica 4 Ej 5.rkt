;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 4 Ej 5|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;Calcula la distancia entre dos puntos
;distancia: posn posn -> Number
;Recibe dos posn, devuelve la distancia entre ellos
(define (distancia pos1 pos2)
  (cond [(and (posn? pos1) (posn? pos2)) 
         (sqrt (+ (sqr (- (posn-x pos2) (posn-x pos1))) 
                  (sqr (- (posn-y pos2) (posn-y pos1)))))]
        [else "Tipos incorrectos para la función."]))

(distancia (make-posn 3 2) (make-posn 3 3))