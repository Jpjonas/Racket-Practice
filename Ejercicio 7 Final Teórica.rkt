;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Ejercicio 7 Final Teórica|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define (p x) (even? x))

(define (q x) (< x 100))

(define (R l) (filter p (filter q l)))

(define (s x) (and (even? x) (< x 100)))

(define (T l) (filter s l))

(R (list 2 30 1 102 101))

(T (list 2 30 1 102 101))
