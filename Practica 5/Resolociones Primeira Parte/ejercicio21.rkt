;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ejercicio21) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; ListImg es:
; empty
; (cons Imagen ListImg)
; interpretación: Un elemento de ListImg es una lista de imágenes

; ListN es:
; empty
; (cons Number ListN)
; interpretación: Un elemento de ListN es una lista de números


; anchos : ListImg -> ListN
; dada una lista de imágenes,
; devuelve una lista con el ancho de cada una.
(check-expect (anchos (list (circle 30 "solid" "red") (rectangle 10 30 "outline" "blue")))
              (list 60 10))
(check-expect (anchos empty)
              empty)
(check-expect (anchos (list (circle 60 "solid" "red") (circle 15 "solid" "red") (circle 100 "solid" "red")))
              (list 120 30 200))
(define (anchos l)
  (cond [(empty? l) empty]
        [else (cons (image-width (first l))  (anchos (rest l)))]
        ))
                      
