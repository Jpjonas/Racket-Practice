;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 5.2 Ej20|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define (dist-un-punto p)
  (sqrt (+ (sqr (posn-x p)) (sqr (posn-y p)))))

(define (distancia l)
  (cond [(empty? l) empty]
        [else (map dist-un-punto l)]))

(distancia (list (make-posn 3 4) (make-posn 7 8)))