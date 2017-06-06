;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ejercicio9) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; ListaB es:
; - empty
; - cons Boolean ListaB
; interpretación: una elemento de listaB es una lista
; cuyos elementos pertenecen al tipo Boolean.

; todos-verdaderos : ListaB -> Boolean
;  recibe como entrada una lista de valores booleanos y
; devuelve #true si todos los elementos de la lista son #true.
(check-expect (todos-verdaderos (list #t #t #t)) #t)
(check-expect (todos-verdaderos (list #t #f #t)) #f)
(check-expect (todos-verdaderos empty) #t)
(define (todos-verdaderos l)
  (cond [(empty? l) #t]
        [else (and (first l) (todos-verdaderos (rest l)))]
        ))

; uno-verdadero : ListaB -> Boolean
;  recibe como entrada una lista de valores booleanos y
; devuelve #true si algún elemento de la lista es #true.
(check-expect (uno-verdadero (list #f #t #t)) #t)
(check-expect (uno-verdadero (list #f #f #t)) #t)
(check-expect (uno-verdadero empty) #f)
(define (uno-verdadero l)
  (cond [(empty? l) #f]
        [else (or (first l) (uno-verdadero (rest l)))]
        ))





