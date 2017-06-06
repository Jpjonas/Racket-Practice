;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ejercicio27) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; ListStr es:
; - empty
; - (cons String ListStr)
; interpretación: un objeto en ListStr es una lista
; de strings

; pegar : ListStr -> String
; dada una lista de strings l, devuelve el string que se obtiene de
; concatenar todos los elementos de l
(check-expect (pegar (list "Las " "lis" "tas " "son " "complicadas" "."))
              "Las listas son complicadas.")
(check-expect (pegar (list "a" "b" "c" "d"))
              "abcd")
(check-expect (pegar empty)
              "")
(define (pegar l)
  (cond [(empty? l) ""]
        [else (string-append (first l) (pegar (rest l)))]
        ))