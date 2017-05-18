;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Editor de Textos|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;EDITOR DE TEXTOS

;Definición de la altura de la pantalla
(define ALTOPANTALLA 60)
;Definición del ancho de la pantalla
(define ANCHOPANTALLA 800)
;Un texto es: (make-texto String Color Number)
;Intepretación: El primer elemento es la cadena a mostarse, mientras que el segundo y
;el tercero determinan el color y tamaño de fuente en píxeles respectivamente.
(define-struct texto [s color tam])


;pantalla : Number -> Image
;Transforma el estado del sistema en una imagen a mostrar a través de la cláusula to-draw
(define (pantalla n) 
  (place-image/align (text (texto-s n) (texto-tam n) (texto-color n))
                     0 0 "left" "top" (empty-scene ANCHOPANTALLA ALTOPANTALLA)))

;agregarCaracter : estado string -> estado
;Agrega los caracteres digitados a la cadena y imprimi en pantalla
;Borra caracteres con la tecla backspace
(define (agregarCaracter n k)
  (cond 
    [(key=? k "up") (make-texto (texto-s n) (texto-color n) (+ (texto-tam n) 1))]
    [(key=? k "down") (make-texto (texto-s n) (texto-color n) (- (texto-tam n) 1))]
    [(key=? k "f1") (make-texto (texto-s n) "black" (texto-tam n))]
    [(key=? k "f2") (make-texto (texto-s n) "red" (texto-tam n))]
    [(key=? k "f3") (make-texto (texto-s n) "green" (texto-tam n))]
    [(key=? k "f4") (make-texto (texto-s n) "yellow" (texto-tam n))]
    [(key=? k "f5") (make-texto (texto-s n) "indigo" (texto-tam n))]
    [(key=? k "f6") (make-texto (texto-s n) "grey" (texto-tam n))]
    ;Borra las letras con la tecla "backspace"
    [(and (key=? k "\b") (> (string-length (texto-s n)) 0))
     (make-texto (substring (texto-s n) 0 (- (string-length (texto-s n)) 1)) (texto-color n) (texto-tam n))]
    ;Imprime la letras precionadas en la pantalla
    [(not (key=? k "\b")) (make-texto (string-append (texto-s n) k) (texto-color n) (texto-tam n))]
    [else n]))

(big-bang (make-texto "" "indigo" 20) ;Estado inicial del sistema
          [to-draw pantalla]          ;Diseño de la pantalla
          [on-key agregarCaracter])   ;Agregar caracter a la cadena


