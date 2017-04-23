;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica 3 Ej 2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;EJERCICIO 2

;dibujarCirculo : Number -> Image
(define (dibujarCirculo r)
  (circle r "solid" "blue"))

;pantalla2: Estado -> Image
(define (pantalla c)
  (place-image (dibujaCirculo c) 150 150
     (empty-scene 300 300)))

; eventosTeclado: Estado String -> Estado
(define (eventosTick c k)
  (cond [(key=? k "a") "blue"]
        [(key=? k "r") "red"]
        [(key=? k "v") "green"]
        [(key=? k "n") "black"]
        [else c]))

(big-bang 100; estado inicial del sistema
          [to-draw pantalla]       ; dibuja en la pantalla 
                                   ; el círculo en el estado actual
          [on-key eventosTeclado]
          )