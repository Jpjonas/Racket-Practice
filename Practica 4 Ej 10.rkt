;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 4 Ej 10|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;EJERCICIO 10

;Precio por el litro de nafta
(define PRECIONAFTA 19)
;Precio por el litro de diesel
(define PRECIODIESEL 17)
;Precio peaje
(define PRECIOPEAJE 50)
;Año actual
(define AÑO 2017)

;Estructura que representa un auto
;Define su modelo 
;año de fabricación
;el tipo de combustivel (diesel o nafta) 
;y el rendimiento óptimo en km/l
(define-struct auto (modelo 
                     año 
                     tpCombustivel 
                     rendOptimo))

;Calcula el costo de una viaje
;costo-viaje: Estructura(auto) Number -> Number
;Recibe una estructura del tipo auto y el número de kilómetros a recorrer
;Envia el precio del combustible usado para la función calcula-precio-por-año
(define (costo-viaje a km)
  (cond [(string=? (auto-tpCombustivel a) "nafta") (calcula-precio-por-año a km PRECIONAFTA)]
        [(string=? (auto-tpCombustivel a) "diesel") (calcula-precio-por-año a km PRECIODIESEL)]
        [else "nafta o diesel"]))

;Calcula el año del auto
;calcula-precio-por-año: auto Number Number
;Recibe una estructura auto, el número de kilómetros a recorrer y el precio del combustible
;Envia el rendimiento del auto para la función calcula-precio
(define (calcula-precio-por-año a km precio)
  (cond 
    ;Entre 1 y 5 años, el rendimiento disminuye 2%
    [(and (>= (- AÑO (auto-año a)) 0) (<= (- AÑO (auto-año a)) 5)) 
    (calcula-precio a km precio 0.98)]
    ;Entre 6 y 10 años, el rendimiento disminuye 6%
    [(and (>= (- AÑO (auto-año a)) 6) (<= (- AÑO (auto-año a)) 10)) 
    (calcula-precio a km precio 0.94)]
    ;Entre 11 y 15 años, el rendimiento disminuye 10%
    [(and (>= (- AÑO (auto-año a)) 11) (<= (- AÑO (auto-año a)) 15)) 
    (calcula-precio a km precio 0.90)]
    ;Más de 15 años, el rendimiento disminuye 15%
    [else (calcula-precio a km precio 0.85)]))

;Calcula el precio del viaje
;calcula-precio: auto Number Number Number
;Recibe una estructura auto, el número de kilómetros a recorrer, el precio del combustible y el rendimiento del auto
;Devuelve el costo del viaje
(define (calcula-precio a km precio rend)
  (+ (* (/ km (* rend (auto-rendOptimo a))) PRECIONAFTA) 
     (quotient  km 100)))

(costo-viaje (make-auto "Gol" 2013 "nafta" 13) 1900)