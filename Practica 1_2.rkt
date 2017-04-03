;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica 1_2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;Ejercicio 1
(define (sgn2 x)
  (cond [(< x 0) -1]
        [(= x 0) 0]
        [(> x 0) 1]))

;Ejercicio 2
;2
(define (clasifica-imagen img)
  (cond[(> (image-height img) (image-width img)) "Flaca"]
       [(< (image-height img) (image-width img)) "Gorda"]
       [(= (image-height img) (image-width img)) "Cuadradda"]))

;4
(define (triangulo a b c)
  (cond[(= a b c) "Equilátero"]
       [(or (= a b) (= b c) (= a c)) "Isóceles"]
       [else "Escaleno"]
       ))

;6
(define ())