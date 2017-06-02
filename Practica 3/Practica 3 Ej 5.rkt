;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica 3 Ej 5|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;EJERCICIO 5

;Definición de la altura de la pantalla
(define ALTOPANTALLA 300)
;Definición del ancho de la pantalla
(define ANCHOPANTALLA 300)
;Defición del radio de circulo
(define RADIOCIRCULO 100)
;Definicion color de la pantalla
(define COLORPANTALLA "white")

;dibujarCirculo : Number -> Image
;Dibuja un circulo de radio n en la pantalla
(define (dibujarCirculo c) (circle RADIOCIRCULO "solid" c))

;pantalla : Number -> Image
;Transforma el estado del sistema en una imagen a mostrar a través de la cláusula to-draw
(define (pantalla c) 
  (place-image (dibujarCirculo c) (/ ANCHOPANTALLA 2) (/ ALTOPANTALLA 2)
               (empty-scene ANCHOPANTALLA ALTOPANTALLA COLORPANTALLA)))

(define (cambiarColor c) 
  (cond [(string=? c "yellow") "red"]
        [(string=? c "red") "green"]
        [(string=? c "green") "blue"]
        [(string=? c "blue") "yellow"]
        [else "black"]))

(big-bang "yellow"; estado inicial del sistema
          [to-draw pantalla]       ;dibuja en la pantalla el círculo en el estado actual
          [on-tick cambiarColor]    
)
