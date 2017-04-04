;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica 1_2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp")))))
;EXPRESIONES CONDICIONALES

;Ejercicio 1
(define (sgn2 x)
  (cond [(< x 0) -1]
        [(= x 0) 0]
        [(> x 0) 1]))

(sgn2 -2)
(sgn2 0)
(sgn2 5)

;Ejercicio 2 ==============
;2
(define (clasifica-imagen img)
  (cond [(> (image-height img) (image-width img)) "Flaca"]
        [(< (image-height img) (image-width img)) "Gorda"]
        [(= (image-height img) (image-width img)) "Cuadradda"]))

(clasifica-imagen (square 20 "solid" "red"))
(clasifica-imagen (rectangle 20 40 "solid" "red"))
(clasifica-imagen (rectangle 40 20 "solid" "red"))

;4
(define (triangulo a b c)
  (cond [(not (= (+ a b c) 180)) "¡No es triangulo!"]
        [(= a b c) "Equilátero"]
        [(or (= a b) (= b c) (= a c)) "Isóceles"]
        [else "Escaleno"]))

(triangulo 60 60 60)
(triangulo 65 65 50)
(triangulo 50 60 70)
(triangulo 60 60 70)

;6
(define PC 18)
(define PL 2)

(define (precio c l)
  (cond [(>= (+ c l) 10) (* 0.82 (+ (* PC c) (* PL l)))]
        [(and (>= c 4) (>= l 5)) (+ (* 0.85 PL l) (* 0.9 PC c))]
        [(>= c 4) (+ (* PL l) (* 0.9 PC c))]
        [(>= l 5) (+ (* 0.85 PL l) (* PC c))]
        [else (+ (* PL l) (* PC c))]))

(precio 7 6)
(precio 6 2)
(precio 2 6)
(precio 4 5)
(precio 6 1)
(precio 1 6)
(precio 1 1)

;7

(define (pitagoras a b c)
  (cond [(= (* a a) (+ (* b b) (* c c))) true]
        [(= (* b b) (+ (* a a) (* c c))) true]
        [(= (* c c) (+ (* a a) (* b b))) true]
        [else false]))

(pitagoras 4 5 3)
(pitagoras 3 4 6)

;3===================
(pitagoras 3 5 6)
(pitagoras 3 5 4)

;4===================
(define (clasfica-imagen2 img)
  (cond [(>= (image-height img) (* 2 (image-width img))) "Muy Flaca"]
        [(<= (* 2 (image-height img)) (image-width img)) "Muy Gorda"]
        [else (clasifica-imagen img)]))

(clasfica-imagen2 (rectangle 20 60 "solid" "red"))
(clasfica-imagen2 (rectangle 80 15 "solid" "red"))
(clasfica-imagen2 (rectangle 60 60 "solid" "red"))
(clasfica-imagen2 (rectangle 50 60 "solid" "red"))
(clasfica-imagen2 (rectangle 20 15 "solid" "red"))
;Conviene poner primeiro las condiciones especificas hasta las mas generales

;5=======================
(define (clasificar-clima t) 
  (cond [(<= t 0) "Helado"]
        [(and (> t 0) (<= t 15)) "Frío"]
        [(and (> t 15) (<= t 25)) "Templado"]
        [(> t 25) "Caluroso"]))

(clasificar-clima -3)
(clasificar-clima 12)
(clasificar-clima 28)
;(clasificar 15)-> La función no está definida para 0, 15 y 25 grados

;PREDICADOS

;6, 7, 8, 9 y 10 ==================
(define (signo x) 
  (cond [(< x 0) -1]
        [(= x 0) 0]
        [(> x 0) 1]))

(define (signo2 x) 
  (cond [(number? x) 
         (signo x)]
        [(and (boolean? x) (not (false? x))) 
         (signo 1)]
        [(and (boolean? x) (false? x)) 
         (signo 0)]
        [(and (image? x) (> (image-height x) (image-width x))) 
         (signo -1)]
        [(and (image? x) (< (image-height x) (image-width x))) 
         (signo 1)]
        [(and (image? x) (= (image-height x) (image-width x))) 
         (signo 0)]
        [(and (string? x) (not (number? (string->number x)))) 
         "La cadena no se puede convertir a un número."]
        [(string? x) 
         (signo (string->number x))]
        [else 
         "Clase no soportada por la función."]))


(signo2 56)
(signo2 -99)
(signo2 0)

(signo2 "0")
(signo2 "56")
(signo2 "-99")
(signo2 "Hola")
(signo2 "0 hola")

(signo2 #t)
(signo2 #f)

(signo2 (square 20 "solid" "red"))
(signo2 (rectangle 20 40 "solid" "red"))
(signo2 (rectangle 40 20 "solid" "red"))

