;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica 3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp")))))
;EJERCICIO 10
; Calcula la distancia en Manhattan
; distancia-manhattan : posn -> Number
; recibe una posición en Manhattan, devuelve su distancia al origen 
(define (distancia-manhattan p)
  (+ (posn-x p) (posn-y p)))

(check-expect (distancia-manhattan (make-posn 5 12)) 17)
(check-expect (distancia-manhattan (make-posn 3 23)) 26)
(check-expect (distancia-manhattan (make-posn 51 2)) 53)

;EJERCICIO 11
; Estructura para tiempo
(define-struct tiempo (horas minutos segundos))

; Calcula la cantidad de segundos que pasaron desde la medianoche
; tiempo->segundos : tiempo -> Number
; recibe un tiempo, devuelve cuantos segundos pasaron desde la medianoche 
(define (tiempo->segundos t)
  (+ (* (tiempo-horas t) 3600) (* (tiempo-minutos t) 60) (tiempo-segundos t)))

(check-expect (tiempo->segundos (make-tiempo 12 31 24)) 45084)
(check-expect (tiempo->segundos (make-tiempo 3 25 56)) 12356)
(check-expect (tiempo->segundos (make-tiempo 7 39 3)) 27543)