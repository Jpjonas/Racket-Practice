;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 4 Ej 6|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;Definición de la altura de la pantalla
(define ALTOPANTALLA 400)
;Definición del ancho de la pantalla
(define ANCHOPANTALLA 700)
;Definición del radio del circulo
(define RADIOCIRCULO 20)
;Definicion de la constante de movimiento
(define DELTA 5)

;dibujarCirculo : Number -> Image
;Dibuja un circulo de radio "RADIOCIRCULO" en la pantalla
(define dibujarCirculo (circle RADIOCIRCULO "solid" "blue"))

;pantalla : posn -> Image
;Transforma el estado del sistema en una imagen a mostrar a través de la cláusula to-draw
(define (pantalla n) 
  (place-image dibujarCirculo (posn-x n) (posn-y n)
               (empty-scene ANCHOPANTALLA ALTOPANTALLA)))

;eventosTeclado: Estado String -> Estado
;Recibe una tecla del teclado
;si es "up" desplaza la imagen "DELTA" hacia arriba
;si es "down" desplaza la imagen "DELTA" hacia abajo
;si es "left" desplaza la imagen "DELTA" hacia la izquierda
;si es "right" desplaza la imagen "DELTA" hacia la derecha
(define (eventosTeclado n k)
  (cond [(key=? k "up") (make-posn (posn-x n) (- (posn-y n) DELTA))]
        [(key=? k "down") (make-posn (posn-x n) (+ (posn-y n) DELTA))]
        [(key=? k "left") (make-posn (- (posn-x n) DELTA) (posn-y n))]
        [(key=? k "right") (make-posn (+ (posn-x n) DELTA) (posn-y n))]
        [(key=? k " ") (make-posn (/ ANCHOPANTALLA 2) (/ ALTOPANTALLA 2))]
        [else n]))

;mouse-handler Estado Number Number String -> Estado
;Recibe una posición del mouse
;Desplaza la imagen para posición del mouse en la pantalla
(define (mouse-handler n x y event) 
  (cond [(string=? event "move") (make-posn x y)]
        [else n]))

(big-bang (make-posn (/ ANCHOPANTALLA 2) (/ ALTOPANTALLA 2)) ; estado inicial del sistema
          [to-draw pantalla]                                 ;dibuja en la pantalla el círculo en el estado inicial
          [on-key eventosTeclado]                            
          [on-mouse mouse-handler]
)