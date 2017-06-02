;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 5 Ej 9|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;lista-booleanos es:
;-'()
; – (cons boolean lista-booleanos)
(define Lista1 (list #true #true #false #true #false #false))
(define Lista2 (list #true #true #true))
(define Lista3 (list #false #false #false))

;todos-verdaderos : lista-booleanos -> booleano
;recibe una lista de booleanos, devuelve #true si todos los valores son #true

(check-expect (todos-verdaderos Lista1) #false)
(check-expect (todos-verdaderos Lista2) #true)
(check-expect (todos-verdaderos Lista3) #false)

(define (todos-verdaderos l) 
  (cond [(empty? l) #true]
        [else (if (false? (first l))
                  #false
                  (todos-verdaderos (rest l)))]))

;uno-verdadero : lista-booleanos -> booleano
;recibe un lista de booleanos, devuelve #true si al menos uno de los elementos de la lista es #true

(check-expect (uno-verdadero Lista1) #true)
(check-expect (uno-verdadero Lista2) #true)
(check-expect (uno-verdadero Lista3) #false)

(define (uno-verdadero l)
  (cond [(empty? l) #false] 
        [else (if (not (false? (first l)))
                  #true
                  (uno-verdadero (rest l)))]))