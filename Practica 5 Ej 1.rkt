;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 5 Ej 1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
; Contactos es:
; - '()
; - (cons String Contactos)
; interpretación: Contactos representa una lista de nombres de
; personas presentes en una agenda.
(cons "Jorge"
      (cons "Mateus"
            (cons "Jonas"
                  (cons "Marcos"
                        (cons "Ana" '())))))
                        
; contiene-Marcos? : Contactos -> Booleano
; dada una lista de Contactos, determina si "Marcos" es un elemento de la misma
 
(check-expect (contiene-Marcos? '()) #false)
(check-expect (contiene-Marcos? (cons "Sara" (cons "Pedro"  (cons "Esteban" '())))) #false)
(check-expect (contiene-Marcos? (cons "A" (cons "Marcos" (cons "C" '())))) #true)
(check-expect (contiene-Marcos? (cons "Juan" '())) #false)
(check-expect (contiene-Marcos? (cons "Marcos" '())) #true)
 
(define (contiene-Marcos? l) (cond [(empty? l) #false]
                                   [(cons? l) (if (string=? (first l) "Marcos")
                                                  #true
                                                  (contiene-Marcos? (rest l)))]))
