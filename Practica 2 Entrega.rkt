;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica 2 Entrega|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;EJERCICIO 6
; Inserta "-" en la i-ésima posición del string
; string-insert : String Number -> String
; Recibe una String y un número, devuelve una String con "-" en la i-ésima posición del string
; entrada: "HelloWorld" 5, salida: Hello-World
; entrada: "DrRacket" 2, salida: Dr-Racket
; entrada: "Práctica2" 8, salida: Práctica-2
(define (string-insert str x)
  (string-append (substring str 0 x) "-" (substring str x)))

(check-expect (string-insert "HelloWorld" 5) "Hello-World")
(check-expect (string-insert "DrRacket" 2) "Dr-Racket")
(check-expect (string-insert "Práctica2" 8) "Práctica-2")


;EJERCICIO 8
; Devulve la misma cadena sin el último caracter
; string-remove-last : String -> String
; Recibe una String, devulve la misma cadena sin el último caracter
; entrada: "HelloWorld", salida: HelloWorl
; entrada: "DrRacket", salida: DrRacke
; entrada: "Práctica2", salida: Práctica
(define (string-remove-last str)
    (if (string? str)
      (substring str 0 (- (string-length str) 1))
      "No es una String"))

(check-expect (string-remove-last "HelloWorld") "HelloWorl")
(check-expect (string-remove-last "DrRacket") "DrRacke")
(check-expect (string-remove-last "Práctica2") "Práctica")