;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ejercicio6) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Práctica 5, segunda parte
; ejercicio 6

; listP es
; - empty
; (cons posn listP)
; interpretación: un objeto en  listP es una lista de posn

; sumdist : ListP -> Number
; dada una lista l, devuelve la suma de las
; distancias de los puntos al origen
(check-expect (sumdist (list (make-posn 3 4) (make-posn 0 3))) 8)
(check-expect (sumdist (list (make-posn 0 6))) 6)
(check-expect (sumdist empty) 0)
(define (sumdist l)
  (foldr + 0 (map dist-origen l)))

; dist-origen : posn -> Number
; dada una posición, devuelve la distancia al origen
; del punto que representa
(check-expect (dist-origen (make-posn 15 0)) 15)
(check-expect (dist-origen (make-posn 3 4)) 5)
(check-expect (dist-origen (make-posn 0 16)) 16)
(define (dist-origen p)
  (sqrt (+ (sqr (posn-x p)) (sqr (posn-y p)))))
