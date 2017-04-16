;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica 2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;EJEMPLO
; Representamos temperaturas mediante números
; far->cel : Number -> Number
; recibe una temperatura en Fahrenheit, devuelve su equivalente en Celsius
; entrada: 32, salida: 0
; entrada: 212, salida: 100
; entrada: -40, salida: -40
(define (far->cel f)
  (* 5/9 (- f 32)))

;EJERCICIO 1
; Calcula la distancia de un punto a la origen
; dist-origen : Number Number -> Number
; Recibe las cordenadas de un punto, devuelve su distancia a la origen
; entrada: 4 5, salida: 6.40
; entrada: 6 1, salida: 6.08
; entrada: -5 -9, salida: 10.29
(define (dist-origen x y)
  (sqrt(+ (* x x) (* y y))))

(dist-origen 4 5)
(dist-origen 6 1)
(dist-origen -5 -9)

;EJERCICIO 2
; Calcula la distancia entre dos puntos
; dist-origen : Number Number Number Number -> Number
; Recibe las cordenadas de dos puntos, devuelve la distancia entre ellos
; entrada: 1 2 4 5, salida: 2.82
; entrada: 4 8 3 1, salida: 7.07
; entrada: 7 3 4 2, salida: 3.16
(define (dist-puntos x1 y1 x2 y2) 
        (sqrt (+ (* (- x1 x2) (- x1 x2)) (* (- y1 y2) (- y1 y2)))))

(dist-puntos 1 2 3 4)
(dist-puntos 4 8 3 1)
(dist-puntos 7 3 4 2)

;EJERCICIO 3
; Calcula el volumen de un cubo
; volume-cubo : Number -> Number
; Recibe la longitud de la arista de un cubo, devuelve su volumen
; entrada: 5, salida: 125
; entrada: 2, salida: 8
; entrada: 8, salida: 512
(define (volume-cubo x)
  (* x (* x x)))

(volume-cubo 5)
(volume-cubo 2)
(volume-cubo 8)

;EJERCICIO 4
; Calcula la area de un cubo
; area-cubo : Number -> Number
; Recibe la longitud de la arista de un cubo, devuelve su area
; entrada: 2, salida: 24
; entrada: 6, salida: 216
; entrada: 8, salida: 384
(define (area-cubo x)
  (* 6 x x))

(area-cubo 2)
(area-cubo 6)
(area-cubo 8)


