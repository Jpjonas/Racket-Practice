;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 4 Ej 4|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;Calcula el punto simétrico
;simetrico: posn -> posn
;Recibe un posn, devuelve un posn simétrico al origen
(define (simetrico pos)
  (cond [(posn? pos) (make-posn (- (posn-x pos)) (- (posn-y pos)))]
        [else "No es posn!"]))

(simetrico (make-posn 3 4))
(simetrico (make-posn 10 -7))
