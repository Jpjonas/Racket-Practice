;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica 1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp")) #f)))
;1 - PREDICADOS
;Ejemplo
(define (precio x)
  (if (< x 4) 
      (* 18 x) 
      (* 16.2 x)))

(precio 3)

;2 - CONDICIONALES
;Ejercicios
;1-
(define (image-clas img)
  (if (> (image-height img) (image-width img)) 
      "Flaca" 
      "Gorda"))

(image-clas (rectangle 20 30 "solid" "green"))
(image-clas (rectangle 30 20 "solid" "green"))

;2-
(define (image-clas2 img)
  (if (= (image-height img) (image-width img)) 
      "Cuadrada" 
      (if (> (image-height img) (image-width img)) 
          "Flaca" 
          "Gorda")))

(image-clas2 (square 20 "solid" "green"))

;3-
(define (triangulo-clas x y z)
  (if (and (= x y) (= y z))
      "Equilátero"
      (if (or (= x y) (= y z) (= x z))
          "Isóceles"
          "Escaleno")))

(triangulo-clas 60 60 60)
(triangulo-clas 50 50 80)
(triangulo-clas 50 60 70)

;4-
(define (triangulo-clas2 x y z)
  (if (= (+ x y z) 180)
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
(define (precio-total c l)
  (+ (if (>= l 5) 
         (* 0.85 PL l) 
         (* PL l)) 
     (if (>= c 4) 
         (* 0.9 PC c) 
         (* PC c))))

(precio-total 6 8)

;6-
(define (precio-total2 c l)
  (if (>= (+ c l) 10)
      (* 0.82 (+ (* c PC) (* l PL)))
      (+ (if (>= l 5) 
             (* 0.85 PL l) 
             (* PL l))
         (if (>= c 4)
             (* 0.9 PC c) 
             (* PC c)))))

(precio-total2 6 8)

;7-
(define (pitagorica a b c)
  (if (or (= (* a a) (+ (* b b) (* c c)))
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
(define (pitagorica2 a b c)
  (if (or (= (* a a) (+ (* b b) (* c c)))
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
(define ejemplo
  (place-image (rectangle 90 30 "solid" "red") 45 15
               (place-image (circle 10 "solid" "blue") 45 45
                            (empty-scene 90 60))))

ejemplo

;a-Peru
(define peru
  (place-image (rectangle 30 60 "solid" "red") 15 30 
               (place-image (rectangle 30 60 "solid" "red") 75 30 
                            (empty-scene 90 60))))

peru

;b-Italia
(define italia
  (place-image (rectangle 30 60 "solid" "red") 15 30 
               (place-image (rectangle 30 60 "solid" "green") 75 30 
                            (empty-scene 90 60))))

italia

;c- Banderas Verticales ======================================================

(define TBW 90) ;-> image width
(define TBH 60) ;-> image height

(define (band-vertical c1 c2 c3)
  (place-image (rectangle (/ TBW 3) TBH "solid" c1) (/ TBW 6) (/ TBH 2) 
               (place-image (rectangle (/ TBW 3) TBH "solid" c3) (/ (* 5 TBW) 6) (/ TBH 2)
                            (place-image (rectangle (/ TBW 3) TBH "solid" c2) (/ TBW 2) (/ TBH 2) 
                                         (empty-scene TBW TBH)))))

(band-vertical "green" "red" "blue")

;d- Alemania
(define alemania
  (place-image (rectangle TBW (/ TBH 3) "solid" "black") (/ TBW 2) (/ TBH 6)
               (place-image (rectangle TBW (/ TBH 3) "solid" "red") (/ TBW 2) (/ (* 5 TBH) 6) 
                            (place-image (rectangle TBW (/ TBH 3) "solid" "yellow") (/ TBW 2) (/ TBH 2)  
                                         (empty-scene TBW TBH)))))
alemania

;e- Holanda
(define holanda
  (place-image (rectangle 90 20 "solid" "red") 45 10 
               (place-image (rectangle 90 20 "solid" "white") 45 30 
                            (place-image (rectangle 90 20 "solid" "blue") 45 50 
                                         (empty-scene 90 60)))))

holanda

;f- Banderas horizontales ========================================================
(define (band-horizontal c1 c2 c3)
  (place-image (rectangle TBW (/ TBH 3) "solid" c1) (/ TBW 2) (/ TBH 6)
               (place-image (rectangle TBW (/ TBH 3) "solid" c3) (/ TBW 2) (/ (* 5 TBH) 6)
                            (place-image (rectangle TBW (/ TBH 3) "solid" c2) (/ TBW 2) (/ TBH 2)
                                         (empty-scene TBW TBH)))))

(band-horizontal "red" "green" "blue")

;g- Cualquier bandera horizontal o vertical
;Tipo-band:
;0-> Vertical
;1-> Horizontal
(define (bandera c1 c2 c3 tipo-band)
  (if (= tipo-band 0)
      (band-vertical c1 c2 c3)
      (band-horizontal c1 c2 c3)))

(bandera "red" "green" "blue" 1)
(bandera "red" "green" "blue" 0)

;h-
(bandera "blue" "white" "red" 0)

;i-
;Tipo-band:
;0-> Vertical
;1-> Horizontal
;img-> imagen que sobrepone la bandera
;alignh-> alinamento horizontal
;alignv-> alinamento vertical
(define (disena-bandera1 c1 c2 c3 tipo-band img alignh alignv)
  (overlay/align alignh alignv img (bandera c1 c2 c3 tipo-band)))

;Sudan
(disena-bandera1 "red" "white" "black" 1 (rotate 30 (triangle 60 "solid" "green")) "left" "center")
;Argentina
(disena-bandera1 "blue" "white" "blue" 1 (circle 10 "solid" "yellow") "center" "center")
;Camerún
(disena-bandera1 "green" "red" "yellow" 0 (star 10 "solid" "yellow") "center" "center")

;j-
;Tipo-band:
;0-> Vertical
;1-> Horizontal
;img1-> imagen que sobrepone la bandera
;img2-> imagen que sobrepone la bandera y la img1
;alignh-> alinamento horizontal
;alignv-> alinamento vertical
(define (disena-bandera2 c1 c2 c3 tipo-band img1 img2 alignh alignv)
  (overlay/align alignh alignv img1 img2 (bandera c1 c2 c3 tipo-band)))

;Brasil
(disena-bandera2 "green" "green" "green" 0 (circle 15 "solid" "blue") (rhombus 50 115 "solid" "yellow") "center" "center")