;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 5 Ej 5|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;Es lo mismo que: (member? "Laura" (cons "a" (cons "b" (cons "Laura" '()))))

; contiene? : Contactos String -> Booleano
; dada una lista de Contactos, determina si el contacto escrito es un elemento de la misma
(check-expect (contiene? "Jonas" '()) #false)
(check-expect (contiene? "Sara" (cons "Sara" (cons "Pedro"  (cons "Esteban" '())))) #true)
(check-expect (contiene? "Sara" (cons "A" (cons "Marcos" (cons "C" '())))) #false)

(define (contiene? n l)
  (cond [(empty? l) #false]
        [else (if (string=? (first l) n)
                  #true
                  (contiene? n (rest l)))]))