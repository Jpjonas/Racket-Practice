;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 5 Ej 12|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Una Lista-de-numeros es: 
; – '()
; – (cons Numero Lista-de-numeros)

(define Lista1 (list 500 30 -25 90))

(define Lista2 (list 35 47 38 35 30 34))

(define Lista3 (list 84 93 -435 345 843))

;pos? : Lista-de-numeros -> boolean
;dada una lista de números, determina si todos los elementos son positivos o no
(define (pos? l)
  (cond [(empty? l) #true]
        [else (if (>=(first l) 0)
                  (pos? (rest l))
                  #false)]))

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

;cant-elementos : datos -> Number
;Recibe una lista con elementos de cualquier tipo y la cantidad ya contada,
;devuelve la cantidad de elementos en la lista
(check-expect (cant-elementos Lista1 0) 4)
(check-expect (cant-elementos Lista2 0) 6)
(check-expect (cant-elementos Lista3 0) 5)
(define (cant-elementos l n)
  (cond [(empty? l) n]
        [else (cant-elementos (rest l) (+ n 1))]))

;Representa el promedio de una lista de elementos
;promedio : Lista-de-numeros -> Number
;Recibe una lista de numeros
;Devuelve el promedio de la lista
(define (promedio l)
  (/ (checked-suma l 0) (cant-elementos l 0)))

(promedio Lista1)
(promedio Lista2)
(promedio Lista3)