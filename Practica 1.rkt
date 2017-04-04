;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica 1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp")))))
;1 - PREDICADOS
;Ejemplo
(define (precio x) (if (< x 4) 
                       (* 18 x) 
                       (* 16.2 x)))
(precio 3)

;2 - CONDICIONALES
;Ejercicios
;1-
(define (image-clas img) (if (> (image-height img) (image-width img)) 
                             "Flaca" 
                             "Gorda"))
(image-clas (rectangle 20 30 "solid" "green"))
(image-clas (rectangle 30 20 "solid" "green"))

;2-
(define (image-clas2 img) (if (= (image-height img) (image-width img)) 
                              "Cuadrada" 
                              (if (> (image-height img) (image-width img)) 
                                  "Flaca" 
                                  "Gorda")))
(image-clas2 (square 20 "solid" "green"))

;3-
(define (triangulo-clas x y z) (if (and (= x y) (= y z))
                                   "Equilátero"
                                   (if (or (= x y) (= y z) (= x z))
                                       "Isóceles"
                                       "Escaleno")))
(triangulo-clas 60 60 60)
(triangulo-clas 50 50 80)
(triangulo-clas 50 60 70)

;4-
(define (triangulo-clas2 x y z) (if (= (+ x y z) 180)
                                    (if (and (= x y) (= y z))
                                        "Equilátero"
                                        (if (or (= x y) (= y z) (= x z))
                                            "Isóceles"
                                            "Escaleno"))
                                    "Suma distinta de 180 grados"))
(triangulo-clas2 50 60 60)
(triangulo-clas2 50 50 80)
(triangulo-clas2 50 60 70)

;5- 
(define PC 18);Precio Cuadernos
(define PL 2);Precio Lápices
(define (precio-total c l) (+ (if (>= l 5) 
                                  (* 0.85 PL l) 
                                  (* PL l)) 
                              (if (>= c 4) 
                                  (* 0.9 PC c) 
                                  (* PC c))))
(precio-total 6 8)

;6-
(define (precio-total2 c l) (if (>= (+ c l) 10)
                                (* 0.82 (+ (* c PC) (* l PL)))
                                (+ (if (>= l 5) 
                                       (* 0.85 PL l) 
                                       (* PL l))
                                   (if (>= c 4)
                                       (* 0.9 PC c) 
                                       (* PC c)))))
(precio-total2 6 8)

;7-
(define (pitagorica a b c) (if (or (= (* a a) (+ (* b b) (* c c)))
                                   (= (* b b) (+ (* a a) (* c c)))
                                   (= (* c c) (+ (* b b) (* a a))))
                               #true
                               #false))
(pitagorica 3 4 5)
(pitagorica 5 4 3)
(pitagorica 4 5 3)
(pitagorica 4 3 5)
(pitagorica 6 7 8)

;8-
(define (pitagorica2 a b c) (if (or (= (* a a) (+ (* b b) (* c c)))
                                   (= (* b b) (+ (* a a) (* c c)))
                                   (= (* c c) (+ (* b b) (* a a))))
                               (string-append "Los números " (number->string a) ", " (number->string b) " y " (number->string c) " forman una terna pitagórica.")
                               (string-append "Los números " (number->string a) ", " (number->string b) " y " (number->string c) " no forman una terna pitagórica.")))
(pitagorica2 3 4 5)
(pitagorica2 5 4 3)
(pitagorica2 4 5 3)
(pitagorica2 4 3 5)
(pitagorica2 6 7 8)

;3 - BANDERAS

;Ejemplo
(define ejemplo (place-image (rectangle 90 30 "solid" "red") 45 15
                             (place-image (circle 10 "solid" "blue") 45 45
                                          (empty-scene 90 60))))
ejemplo

;a-Peru
(define peru (place-image (rectangle 30 60 "solid" "red") 15 30 
                          (place-image (rectangle 30 60 "solid" "red") 75 30 
                                       (empty-scene 90 60))))
peru

;b-Italia
(define italia (place-image (rectangle 30 60 "solid" "red") 15 30 
                          (place-image (rectangle 30 60 "solid" "green") 75 30 
                                       (empty-scene 90 60))))
italia

;c- Banderas Verticales
(define (band-vertical c1 c2 c3) (place-image (rectangle 30 60 "solid" c1) 15 30 
                                              (place-image (rectangle 30 60 "solid" c2) 75 30
                                                           (place-image (rectangle 30 60 "solid" c3) 45 30 
                                                                        (empty-scene 90 60)))))
(band-vertical "green" "red" "blue")

;d- Alemania
(define alemania (place-image (rectangle 90 20 "solid" "black") 45 10 
                              (place-image (rectangle 90 20 "solid" "red") 45 30 
                                           (place-image (rectangle 90 20 "solid" "yellow") 45 50 
                                                        (empty-scene 90 60)))))
alemania

;e- Holanda
(define holanda (place-image (rectangle 90 20 "solid" "red") 45 10 
                              (place-image (rectangle 90 20 "solid" "white") 45 30 
                                           (place-image (rectangle 90 20 "solid" "blue") 45 50 
                                                        (empty-scene 90 60)))))
holanda
;f- Banderas horizontales
(define (band-horizontal c1 c2 c3) (place-image (rectangle 90 20 "solid" c1) 45 10 
                                                (place-image (rectangle 90 20 "solid" c2) 45 30 
                                                             (place-image (rectangle 90 20 "solid" c3) 45 50 
                                                                          (empty-scene 90 60)))))
(band-horizontal "red" "green" "blue")

;g- Cualquier bandera
(define (band-horizontal c1 c2 c3 tipo-band) (if ((string=? tipo-band "v") 
                                                 (place-image (rectangle 90 20 "solid" c1) 45 10 
                                                              (place-image (rectangle 90 20 "solid" c2) 45 30 
                                                                           (place-image (rectangle 90 20 "solid" c3) 45 50 
                                                                                        (empty-scene 90 60)))))))
(band-horizontal "red" "green" "blue")



