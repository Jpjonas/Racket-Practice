;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Practica 4 Ej 2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
(define p (make-posn 3 4))
(define q (make-posn -2 0.5))

(posn-x p)

;definición de p
(posn-x (make-posn 3 4))

;ley 1
3

;===========================
(- (posn-y p) (posn-y q))

;definición de p
(- (posn-y (make-posn 3 4)) (posn-y q))

;definición de q
(- (posn-y (make-posn 3 4)) (posn-y (make-posn -2 0.5)))

;ley 2
(- 4 (posn-y (make-posn -2 0.5)))

;ley 2
(- 4 0.5)

;Resta
3.5

;=========================================
(posn-y (make-posn (posn-x p) (posn-x q)))

;definición de p
(posn-y (make-posn (posn-x (make-posn 3 4)) (posn-x q)))

;definición de q
(posn-y (make-posn (posn-x (make-posn 3 4)) (posn-x (make-posn -2 0.5))))

;ley 1
(posn-y (make-posn 3 (posn-x (make-posn -2 0.5))))

;ley 1
(posn-y (make-posn 3 -2))

;ley 2
-2