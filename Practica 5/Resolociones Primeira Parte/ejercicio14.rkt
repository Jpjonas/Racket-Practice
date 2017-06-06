;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ejercicio14) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; ListStr es:
; - empty
; - (cons String ListStr)
; interpretación: un objeto en ListStr es una lista
; de strings

; Longitud máxima para considerar a una palabra "corta"
(define MAX 4)

; cortas : ListStr -> ListStr
; dada una lista de strings l,
; devuelve una lista con aquellas palabras de l de longitud menor o igual a MAX.
(check-expect (cortas empty) empty)
(check-expect (cortas (list "Lista" "de" "palabras" "sin" "sentido"))
              (list "de" "sin"))
(check-expect (cortas (list "Listas" "aaaaaaa" "bbbbbb" "abcdef"))
              empty)
(define (cortas l)
  (cond [(empty? l) empty]
        [else (if (<= (string-length (first l)) MAX) ; palabra corta
                  (cons (first l) (cortas (rest l)))
                  (cortas (rest l)))
                  ]
        ))
