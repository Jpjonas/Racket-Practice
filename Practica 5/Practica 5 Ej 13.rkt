;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 5 Ej 13|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; ListNumber es:
; - empty
; - (cons String ListNumber)
; interpretación: un objeto en ListStr es una lista
; de strings


; cortas : ListStr -> ListStr
; dada una lista de números l,
; devuelve una lista con los numeros pares
(check-expect (filtra-pares empty) empty)
(check-expect (filtra-pares (list 4 5 6 7)) (list 4 6))
(check-expect (filtra-pares (list 1 3 5 7 9)) empty)
(define (filtra-pares l)
  (cond [(empty? l) empty]
        [else (if (= (remainder (first l) 2) 0) ;numero par
                  (cons (first l) (filtra-pares (rest l)))
                  (filtra-pares (rest l)))]
                  
        ))
