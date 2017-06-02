;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 5 Ej 7|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
; Una Lista-de-montos es: 
; – '()
; – (cons NumeroPositivo Lista-de-montos)
; Lista-de-montos representa una lista con montos de dinero
(define Lista1 (cons 500 (cons 50 (cons 200 (cons 150 (cons 100 '()))))))

(define Lista2 (list 10 20 50 100 200 500))

(define Lista3 (list 0.50 1 2 5 0.10))

;suma : Lista-de-Montos -> Number
;dada una lista de Montos de dineiro, suma los montos y devuelve el total

(check-expect (suma Lista1 0) 1000)
(check-expect (suma Lista2 0) 880)
(check-expect (suma Lista3 0) 8.6)

(define (suma l n)
  (cond [(empty? l) n]
        [(cons? l) (suma (rest l) (+ n (first l)))]))