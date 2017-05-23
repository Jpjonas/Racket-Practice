;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 4 Ej 12|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;EJERCICIO 12

;Precio del metro cuadrado de la Zona A
(define ZonaA 20000)
;Precio del metro cuadrado de la Zona B
(define ZonaB 15000)
;Precio del metro cuadrado de la Zona C
(define ZonaC 10000)
;Precio del metro cuadrado de la Zona D
(define ZonaD 5000)

;Estructura que representa una casa
;propietario -> String
;dirección -> String
;superficie en metros cuadrados -> Number
;zona -> String
(define-struct casa (propietario
                     direccion
                     superficie
                     zona))

;Datos de la venta de dicha propiedad
;venta: casa -> String
;Recibe un valor del tipo casa
;Envia el precio de cada zona para la función calcula-precio
(define (venta c)
  (cond [(not (casa? c)) "Tipo de dato incorrecto"]
        [(string=? (casa-zona c) "A") (calcula-precio c 20000)]
        [(string=? (casa-zona c) "B") (calcula-precio c 15000)]
        [(string=? (casa-zona c) "C") (calcula-precio c 10000)]
        [(string=? (casa-zona c) "D") (calcula-precio c 5000)]
        [else "No se puede calcular el precio de venta por no disponer de los valores del metro cuadrado para la zona solicitada"]))

;Calculña el precio de la casa
;calcula-precio: casa Number -> String
;Recibe un valor del tipo casa y el precio por el metro cuadrado
;Envia el precio de la casa para la función mensaje
(define (calcula-precio c valorm)
  (cond [(> (* valorm (casa-superficie c)) 1000000) (* valorm (casa-superficie c) 1.05)]
        [else (* valorm (casa-superficie c) 0.97)]))





