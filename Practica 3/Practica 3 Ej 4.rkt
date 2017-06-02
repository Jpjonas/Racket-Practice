;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica 3 Ej4|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;EJERCICIO 4

;Definición de la altura de la pantalla
(define ALTOPANTALLA 400)
;Definición del ancho de la pantalla
(define ANCHOPANTALLA 700)
;Definición del radio del circulo
(define RADIOCIRCULO 10)
;Definicion de la constante de movimiento
(define DELTA 5)

;dibujarCirculo : Number -> Image
;Dibuja un circulo de radio "RADIOCIRCULO" en la pantalla
(define dibujarCirculo (circle RADIOCIRCULO "solid" "blue"))

;pantalla : Number -> Image
;Transforma el estado del sistema en una imagen a mostrar a través de la cláusula to-draw
(define (pantalla n) 
  (place-image dibujarCirculo (/ ANCHOPANTALLA 2) n
               (empty-scene ANCHOPANTALLA ALTOPANTALLA)))

;eventosTeclado: Estado String -> Estado
;Recibe una tecla del teclado
;si es "up" desplaza la imagen "DELTA" hacia arriba
;si es "down" desplaza la imagen "DELTA" hacia abajo
(define (eventosTeclado n k)
  (cond [(> n ALTOPANTALLA) ALTOPANTALLA]
        [(< n 0) 0]
        [(key=? k "up") (- n DELTA)]
        [(key=? k "down") (+ n DELTA)]
        [(key=? k " ") (/ ALTOPANTALLA 2)]
        [else n]))

(define (mouse-handler n x y event) 
  (cond [(string=? event "button-down") y]
        [else n]))

(big-bang (/ ALTOPANTALLA 2) ; estado inicial del sistema
          [to-draw pantalla] ;dibuja en la pantalla el círculo en el estado inicial
          [on-key eventosTeclado]
          [on-mouse mouse-handler]
          )