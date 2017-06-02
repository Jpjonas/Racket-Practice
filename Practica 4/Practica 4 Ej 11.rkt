;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 4 Ej 11|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;EJERCICIO 11

;Estructura para representa un alumno
;Nombre del alumno -> String
;Promedio de sus calificaciones (un valor entre 0 y 10)
;Porcentaje de asistencia a clases (un valor entre 0 y 100)
(define-struct alumno (nombre
                       promedio
                       asistencia))

;Calcula la condición del alumno
;condicion: alumno -> String
;Recibe un valor do tipo alumno
;Devuelve una String indicando su condición: "Libre", "Regular" o "Promovido"
;(check-expect (condicion (make-alumno "A" 9 90)) "Promovido")
;(check-expect (condicion (make-alumno "A" 8 50)) "Libre")
;(check-expect (condicion (make-alumno "A" 7 80)) "Regular")
;(check-expect (condicion (make-alumno "A" 2 90)) "Libre")
(define (condicion a)  
  (cond [(not (alumno? a)) "No es un alumno!"]
        [(>= (alumno-asistencia a) 60) 
         (cond [(< (alumno-promedio a) 6) "Libre"]
               [(and (>= (alumno-promedio a) 6) (< (alumno-promedio a) 8)) "Regular"]
               [else "Promovido"])]
        [else "Libre"]))

