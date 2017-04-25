;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica 3 Ej 2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;EJERCICIO 2

;dibujarCirculo : Number -> Image
;Dibuja un circulo de radio n en la pantalla
(define (dibujarCirculo n)
  (circle n "solid" "blue"))

;pantalla : Number -> Image
;Transforma el estado del sistema en una imagen a mostrar a través de la cláusula to-draw
(define (pantalla n) 
  (place-image (dibujarCirculo n) 150 150
               (empty-scene 300 300)))

;decrementar : Number -> Number
;Devuelve el predecesor de un número positivo.
;Si el número es 0, devuelve 100. 
(define (decrementar n)
  (cond [(= n 0) 100]
        [else (- n 1)]))
  
;incrementar : Number -> Number
;suma uno a su argumento
(define (incrementar n) (+ n 1))

(big-bang 100; estado inicial del sistema
          [to-draw pantalla]       ;dibuja en la pantalla el círculo en el estado actual
          [on-tick incrementar]    ;incrementa o decreenta el radio del circulo com el tick del relogio 
          ;[on-tick decrementar]
          )