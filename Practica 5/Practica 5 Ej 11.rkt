;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 5 Ej 11|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
(define Lista1 (list "asd" 12 #true))

;cant-elementos : datos -> Number
;Recibe una lista con elementos de cualquier tipo y la cantidad ya contada, devuelve la cantidad de elementos en la lista

(check-expect (cant-elementos Lista1 0) 3)
;(check-expect (cant-elementos Lista2 0))
;(check-expect (cant-elementos Lista3 0))

(define (cant-elementos l n)
  (cond [(empty? l) n]
        [else (cant-elementos (rest l) (+ n 1))]))