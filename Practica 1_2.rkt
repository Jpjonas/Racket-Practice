;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica 1_2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;Ejercicio 1
(define (sgn2 x)
  (cond [(< x 0) -1]
        [(= x 0) 0]
        [(> x 0) 1]))
(sgn2 -2)
(sgn2 0)
(sgn2 5)

;Ejercicio 2
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
        [else "Escaleno"]
       ))
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
        [else (+ (* PL l) (* PC c))]
  ))

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
        [else false]
        ))

(pitagoras 3 4 5)
(pitagoras 3 5 4)
(pitagoras 4 5 3)
(pitagoras 3 4 6)