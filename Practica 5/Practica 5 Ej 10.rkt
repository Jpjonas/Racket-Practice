;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 5 Ej 10|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;Una Lista-de-cadenas es:
;– '()
; – (cons Numero Lista-de-cadenas)

(define Lista1 (list "Holla" "Mundo"))
(define Lista2 (list "Mundo" "Holla"))
(define Lista3 (list "ABC" "DEF"))

;cat : Lista-de-cadenas -> String
;Recibe una lista de Strings y devuelve una string que es la concatenación de todos los elementos de l

(check-expect (cat Lista1 "") "HollaMundo")
(check-expect (cat Lista2 "") "MundoHolla")
(check-expect (cat Lista3 "") "ABCDEF")

(define (cat l s)
  (cond [(empty? l) s]
        [else (cat (rest l) (string-append s (first l)))]))