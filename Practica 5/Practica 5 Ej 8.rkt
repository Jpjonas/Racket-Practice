;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 5 Ej 8|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
; Una Lista-de-numeros es: 
; – '()
; – (cons Numero Lista-de-numeros)

(define Lista1 (list 500 30 -25 90))

(define Lista2 (list 35 47 38 35 30 34))

(define Lista3 (list 84 93 -435 345 843))

;pos? : Lista-de-numeros -> boolean
;dada una lista de números, determina si todos los elementos son positivos o no

(check-expect (pos? Lista1) #false)
(check-expect (pos? Lista2) #true)
(check-expect (pos? Lista3) #false)

(define (pos? l)
  (cond [(empty? l) #true]
        [else (if (>=(first l) 0)
                  (pos? (rest l))
                  #false)]))

(pos? (cons 5 '())) 
(pos? (cons -1 '()))

;checked-suma : Lista-de-numeros Number -> Number
;dada una lista de numeros y el valor de la suma de los numeros anteriores
;suma los números si son mayores que cero

(check-expect (checked-suma Lista1 0) 0)
(check-expect (checked-suma Lista2 0) 219)
(check-expect (checked-suma Lista3 0) 0)

(define (checked-suma l n)
  (cond [(not (pos? l)) 0]
        [(empty? l) n]
        [else (checked-suma (rest l) (+ (first l) n))]))

;Si aplicamos una lista-de-numeros a la función suma calculará la resta de los números negativos