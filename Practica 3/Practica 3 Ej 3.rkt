;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica 3 Ej 3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;EJERCICIO 3

;Definición de la altura de la pantalla
(define ALTURAPANTALLA 300)
;Definición del ancho de la pantalla
(define ANCHOPANTALLA 300)

;dibujarCirculo : Number -> Image
;Dibuja un circulo de radio n en la pantalla
(define (dibujarCirculo n)
  (cond [(and (>= n 0) (< n 51)) (circle n "solid" "yellow")]
        [(and (> n 50) (< n 101)) (circle n "solid" "red")]
        [(> n 100) (circle n "solid" "green")]))

;pantalla : Number -> Image
;Transforma el estado del sistema en una imagen a mostrar a través de la cláusula to-draw
(define (pantalla n) 
  (place-image (dibujarCirculo n) (/ ANCHOPANTALLA 2) (/ ALTURAPANTALLA 2)
               (empty-scene ANCHOPANTALLA ALTURAPANTALLA)))

;decrementar : Number -> Number
;Devuelve el predecesor de un número positivo.
;Si el número es 0, devuelve 100. 
(define (decrementar n)
  (cond [(= n 0) 100]
        [else (- n 1)]))
  
;incrementar : Number -> Number
;Suma uno a su argumento.
;Si la altura o el ancho del dibujo son igual a la pantalla, devuelve 0.
(define (incrementar n) 
  (cond [(= n (/ ANCHOPANTALLA 2)) 0]
        [(= n (/ ALTURAPANTALLA 2)) 0]
        [else (+ n 1)]))

; eventosTeclado: Estado String -> Estado
(define (eventosTeclado n k) 
  (cond [(key=? k "0") 0]
        [(key=? k "1") 10]
        [(key=? k "2") 20]
        [(key=? k "3") 30]
        [(key=? k "4") 40]
        [(key=? k "5") 50]
        [(key=? k "6") 60]
        [(key=? k "7") 70]
        [(key=? k "8") 80]
        [(key=? k "9") 90]
        [else n]))

(big-bang 100; estado inicial del sistema
          [to-draw pantalla]       ;dibuja en la pantalla el círculo en el estado actual
          [on-key eventosTeclado]
          [on-tick incrementar]    ;incrementa o decreenta el radio del circulo com el tick del relogio 
          ;[on-tick decrementar]
)