;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ejercicios7-8) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #t)))
;; Práctica 5, primera parte, ejercicios 7 y 8

; Una Lista-de-montos es: 
; – '()
; – (cons NumeroPositivo Lista-de-montos)
; Lista-de-montos representa una lista con montos de dinero


; suma : Lista-de-montos -> Numero
; dada una lista de montos, calcula la suma de sus elementos
(check-expect (suma empty) 0)
(check-expect (suma (list 4 7 5)) 16)
(check-expect (suma (list 1 2 3 4 5 6 7 8 9 10)) 55)
(define (suma l)
  (cond [(empty? l) 0]
        [(cons? l) (+ (first l) (suma (rest l)))]
        ))

; Una Lista-de-numeros es: 
; – '()
; – (cons Numero Lista-de-numeros)

; pos? : Lista-de-numeros -> Booleano
; dada una lista de números, devuelve true si
; todos sus elementos son positivos
(check-expect (pos? (list 7 5 3)) #t)
(check-expect (pos? empty) #t)
(check-expect (pos? (list 7 -5 -3)) #f)
(define (pos? l)
  (cond [(empty? l) #t]
        [(cons? l) (and (> (first l) 0) (pos? (rest l)))]
        ))

; checked-suma : Lista-de-números -> Numero/String
; dada una lista l, devuelve la suma de sus elementos,
; si l es una Lista-de-montos. Caso contrario, devuelve
; un mensaje de error.
(check-expect (checked-suma empty) 0)
(check-expect (checked-suma (list 5 6 7)) 18)
(check-expect (checked-suma (list 6 -7)) "La lista no es una Lista-de-montos")
(define (checked-suma l)
  (if (pos? l)
  (suma l)
  "La lista no es una Lista-de-montos"
  ))
        

