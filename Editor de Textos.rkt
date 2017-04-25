;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Editor de Textos|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;EDITOR DE TEXTOS

;Definición de la altura de la pantalla
(define ALTOPANTALLA 60)
;Definición del ancho de la pantalla
(define ANCHOPANTALLA 800)

;pantalla : Number -> Image
;Transforma el estado del sistema en una imagen a mostrar a través de la cláusula to-draw
(define (pantalla cadena) 
  (place-image/align (text cadena 20 "indigo")
                     0 0 "left" "top" (empty-scene ANCHOPANTALLA ALTOPANTALLA)))

(define (agregarCaracter n t))

(big-bang ""               ; estado inicial del sistema
          [to-draw pantalla]
          [on-key])


