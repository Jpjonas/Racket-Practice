;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica 3 Ej 8|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;EJERCICIO 8

;Alto de la pantalla
(define ALTO 600)
;Ancho de la pantalla
(define ANCHO 800)
;Color del cielo
(define COLORCIELO "dark-blue")
;Cielo Vacio
(define CIELOVACIO (empty-scene ANCHO ALTO COLORCIELO))
;Color de las Estrallas
(define COLORESTR "yellow")
;Tamaño de las estrellas
(define TAMESTR 40)
;Estrellas
(define STAR (star TAMESTR "solid" COLORESTR))

(define (disenaCielo t) t)

(define (disenaEstrellas p x y e)
  (cond [(> x (- ANCHO TAMESTR)) p] 
        [(mouse=? e "button-down") (place-image STAR x y p)]
        [else p]))

(define (eventosTeclado p k)
  (cond [(key=? k " ") CIELOVACIO]
        [else p]))

(big-bang CIELOVACIO                     ;Estado inicial del sistema
          [to-draw disenaCielo]          ;Diseño de la pantalla
          [on-mouse disenaEstrellas]     ;Diseña las estrellas
          [on-key eventosTeclado]
)