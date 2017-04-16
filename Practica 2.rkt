;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica 2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;EJEMPLO
; Representamos temperaturas mediante números
; far->cel : Number -> Number
; recibe una temperatura en Fahrenheit, devuelve su equivalente en Celsius
; entrada: 32, salida: 0
; entrada: 212, salida: 100
; entrada: -40, salida: -40
(define (far->cel f)
  (* 5/9 (- f 32)))

(check-expect (far->cel -40) -40)
(check-expect (far->cel 32) 0)
(check-expect (far->cel 212) 100)

;EJERCICIO 1
; Calcula la distancia de un punto a la origen
; dist-origen : Number Number -> Number
; Recibe las cordenadas de un punto, devuelve su distancia a la origen
; entrada: 4 5, salida: 6.40
; entrada: 6 1, salida: 6.08
; entrada: -5 -9, salida: 10.29
(define (dist-origen x y)
  (sqrt(+ (* x x) (* y y))))

;(check-expect (dist-origen 4 5) #i6.4031242374328485)
;(check-expect (dist-origen 6 1) 6.08)
;(check-expect (dist-origen -5 -9) 10.29)

;EJERCICIO 2
; Calcula la distancia entre dos puntos
; dist-origen : Number Number Number Number -> Number
; Recibe las cordenadas de dos puntos, devuelve la distancia entre ellos
; entrada: 1 2 4 5, salida: 2.82
; entrada: 4 8 3 1, salida: 7.07
; entrada: 7 3 4 2, salida: 3.16
(define (dist-puntos x1 y1 x2 y2) 
        (sqrt (+ (* (- x1 x2) (- x1 x2)) (* (- y1 y2) (- y1 y2)))))

;(check-expect (dist-puntos 1 2 3 4) 2.82)
;(check-expect (dist-puntos 4 8 3 1) 7.07)
;(check-expect (dist-puntos 7 3 4 2) 3.16)

;EJERCICIO 3
; Calcula el volumen de un cubo
; volume-cubo : Number -> Number
; Recibe la longitud de la arista de un cubo, devuelve su volumen
; entrada: 5, salida: 125
; entrada: 2, salida: 8
; entrada: 8, salida: 512
(define (volume-cubo x)
  (* x (* x x)))

(check-expect (volume-cubo 5) 125)
(check-expect (volume-cubo 2) 8)
(check-expect (volume-cubo 8) 512)

;EJERCICIO 4
; Calcula la area de un cubo
; area-cubo : Number -> Number
; Recibe la longitud de la arista de un cubo, devuelve su area
; entrada: 2, salida: 24
; entrada: 6, salida: 216
; entrada: 8, salida: 384
(define (area-cubo x)
  (* 6 x x))

(check-expect (area-cubo 2) 24)
(check-expect (area-cubo 6) 216)
(check-expect (area-cubo 8) 384)

;EJERCICIO 5
; Calcula la area de una imagen
; area-imagen : Imagen -> Number
; Recibe una imagen, devuelve su area
; entrada:(square 20 "solid" "red"), salida: 400
; entrada: (rectangle 30 15 "solid" "green"), salida: 450
; entrada: (area-imagen (rectangle 20 40 "solid" "blue")), salida: 800
(define (area-imagen x)
  (* (image-width x) (image-height x)))

(check-expect (area-imagen (square 20 "solid" "red")) 400)
(check-expect (area-imagen (rectangle 30 15 "solid" "green")) 450)
(check-expect (area-imagen (rectangle 20 40 "solid" "blue")) 800)

;EJERCICIO 6
; Inserta "-" en la i-ésima posición del string
; string-insert : String Number -> String
; Recibe una String y un número, devuelve una String con "-" en la i-ésima posición del string
; entrada: "HelloWorld" 5, salida: Hello-World
; entrada: "DrRacket" 2, salida: Dr-Racket
; entrada: "Práctica2" 8, salida: Práctica-2
(define (string-insert str x)
  (string-append (substring str 0 x) "-" (substring str x)))

(check-expect (string-insert "HelloWorld" 5) "Hello-World")
(check-expect (string-insert "DrRacket" 2) "Dr-Racket")
(check-expect (string-insert "Práctica2" 8) "Práctica-2")

;EJERCICIO 7
; Extrae el último caracter de una cadena no vacía
; string-last : String -> String
; Recibe una String, devuelve el último caracter de una cadena no vacía
; entrada: "HelloWorld", salida: d
; entrada: "DrRacket", salida: t
; entrada: "Práctica2", salida: 2
(define (string-last str)
  (if (string? str)
      (substring str (- (string-length str) 1))
      "No es una String"))

(check-expect (string-last "HelloWorld") "d")
(check-expect (string-last "DrRacket") "t")
(check-expect (string-last "Práctica2") "2")

;EJERCICIO 8
; Devulve la misma cadena sin el último caracter
; string-remove-last : String -> String
; Recibe una String, devulve la misma cadena sin el último caracter
; entrada: "HelloWorld", salida: HelloWorl
; entrada: "DrRacket", salida: DrRacke
; entrada: "Práctica2", salida: Práctica
(define (string-remove-last str)
    (if (string? str)
      (substring str 0 (- (string-length str) 1))
      "No es una String"))

(check-expect (string-remove-last "HelloWorld") "HelloWorl")
(check-expect (string-remove-last "DrRacket") "DrRacke")
(check-expect (string-remove-last "Práctica2") "Práctica")