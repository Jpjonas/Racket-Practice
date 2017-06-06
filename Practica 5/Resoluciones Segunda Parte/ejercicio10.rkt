;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ejercicio10) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Práctica 5, segunda parte
; Ejercicio 10

; listImg es:
; empty
; (cons Imagen listImg)
; interpretación: listImg representa una lista de imágenes

; sag : ListImg -> Number
;  dada una lista de imágenes l
; devuelve la suma de las áreas de aquellas imágenes gordas de l
(check-expect (sag (list (circle 20 "solid" "red")
                         (rectangle 40 20 "solid" "blue")
                         (rectangle 10 20 "solid" "yellow")
                         (rectangle 30 20 "solid" "green")))
              1400)
(check-expect (sag (list (circle 10 "solid" "red")
                         (rectangle 200 10 "solid" "yellow")))
              2000)
(check-expect (sag empty) 0)
(define (sag l)
  (foldr + 0 (map area (filter gorda? l))))

; area : Imagen -> Number
; dada una imagen, devuelve el área del rectángulo
; que la contiene
(check-expect (area (circle 50 "solid" "blue")) 10000)
(check-expect (area (rectangle 100 50 "solid" "blue")) 5000)
(check-expect (area (rectangle 10 50 "solid" "blue")) 500)
(define (area img)
  (* (image-width img) (image-height img)))



; gorda? : Imagen -> Boolean
; dada una imagen, devuelve #t si su ancho es mayor a su alto
(check-expect (gorda? (circle 50 "solid" "blue")) #f)
(check-expect (gorda? (rectangle 100 50 "solid" "blue")) #t)
(check-expect (gorda? (rectangle 10 50 "solid" "blue")) #f)
(define (gorda? img)
  (> (image-width img) (image-height img)))