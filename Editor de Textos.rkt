;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Editor de Textos|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;EDITOR DE TEXTOS

;Un texto es: (make-texto String Color Number)
;El primer elemento es la cadena a mostrarse
;El segundo es el color de la cadena
;El tercero determina el tamaño de la fuente en píxeles
(define-struct texto [cadena color tam])

;Definición de la altura de la pantalla
(define ALTO 60)
;Definición del ancho de la pantalla
(define ANCHO 800)
;Definición del fondo de la imagen
(define FONDO (empty-scene ANCHO ALTO))
;Definición del estado inicial del sistema
(define INICIAL (make-texto "" "indigo" 20))

;Borra la ultima letra de la cadena
;string-remove-last: String -> String
;Recibe una String, devuelve la misma String sin la ultima letra
;(check-expect (string-remove-last "hola") "hol")
;(check-expect (string-remove-last "hoy") "ho")
;(check-expect (string-remove-last "mundo") "mund")
(define (string-remove-last s)
  (if (not(string=? "" s))
      (substring s 0 (- (string-length s) 1))
      s))

;Representa las caracteristicas del texto (contenido, tamaño de la fuente y color)
;mediante la estructura "texto" y un color con un string.
;cambiaColor: texto String -> texto
;Cambia el elemento color de una estructura "texto" f1, f2, f3, f4, f5 y f6.
;(check-expect (cambiaColor (make-texto "hola" "red" 20) "f3") (make-texto "hola" "green" 20))
;(check-expect (cambiaColor (make-texto "" "black" 20) "f1") (make-texto "" "black" 20))
;(check-expect (cambiaColor (make-texto "-mundo" "indigo" 20) "f5") (make-texto "-mundo" "indigo" 20))
(define (cambiaColor n k)
  (cond [(key=? k "f1") (make-texto (texto-cadena n) "black" (texto-tam n))]
        [(key=? k "f2") (make-texto (texto-cadena n) "red" (texto-tam n))]
        [(key=? k "f3") (make-texto (texto-cadena n) "green" (texto-tam n))]
        [(key=? k "f4") (make-texto (texto-cadena n) "yellow" (texto-tam n))]
        [(key=? k "f5") (make-texto (texto-cadena n) "indigo" (texto-tam n))]
        [(key=? k "f6") (make-texto (texto-cadena n) "grey" (texto-tam n))]
        [else n]))

;Representa las caracteristicas del texto (contenido, tamaño de la fuente y color) con la estructura
;"texto" y la tecla precionada con un string.
;cambiaTamañoFuente: texto String -> texto
;Cambia el tamaño de la fuente con las teclas "up" y "down"
;(check-expect (cambiaTamañoFuente (make-texto "test" "black" 20) "up") (make-texto "test" "black" 21))
;(check-expect (cambiaTamañoFuente (make-texto "tset" "black" 12) "down") (make-texto "tset" "black" 11))
;(check-expect (cambiaTamañoFuente (make-texto "42" "black" 1) "down") (make-texto "42" "black" 1))
(define (cambiaTamañoFuente n k)
  (cond[(key=? k "up") (make-texto (texto-cadena n) (texto-color n) (+ (texto-tam n) 1))]
       [(key=? k "down") (make-texto (texto-cadena n)
                                     (texto-color n)
                                     (if (< 1 (- (texto-tam n) 1))
                                         (- (texto-tam n) 1)
                                         (texto-tam n)))]))

;Representa las caracteristicas del texto (contenido, tamaño de la fuente y color) con la estructura
;"texto" y la pantalla del editor de texto mediante una imagen.
;pantalla : texto -> Image
;Imprime el string de la variable "texto" en una imagen.
(define (pantalla n)
  (place-image/align (text (texto-cadena n) (texto-tam n) (texto-color n))
                     0 0 "left" "top" FONDO))

;Representa las características del texto (contenido, tamaño de la fuente y color) con la
;estructura "texto" y la tecla precionada con un string.
;keyboardHandler : texto string -> texto
;Agrega los caracteres digitados a la cadena, borra caracteres con la tecla backspace
;(en el caso que la cadena no sea vacía), determina el tamanho de fuente con "up" y "down"
;y cambia el color de la cadena.
;(check-expect (keyboardHandler (make-texto "" "indigo" 20) "a") (make-texto "a" "indigo" 20))
;(check-expect (keyboardHandler (make-texto "Buenas" "indigo" 20) " ") (make-texto "Buenas " "indigo" 20))
;(check-expect (keyboardHandler (make-texto "Winter is Coming" "indigo" 20) "f1") (make-texto "Winter is Coming" "black" 20))
;(check-expect (keyboardHandler (make-texto "qsy" "indigo" 20) "\b") (make-texto "qs" "indigo" 20))
;(check-expect (keyboardHandler (make-texto "" "indigo" 20) "\b") (make-texto "" "indigo" 20))
(define (keyboardHandler n k)
  (cond
    ;Determina el tamaño de la fuente
    [(or (key=? k "up") (key=? k "down"))
     (cambiaTamañoFuente n k)]
    ;Determina el color de la fuente
    [(or (key=? k "f1") (key=? k "f2") (key=? k "f3") (key=? k "f4") (key=? k "f5") (key=? k "f6"))
     (cambiaColor n k)]
    ;Borra las letras con la tecla "backspace"
    [(key=? k "\b")
     (make-texto (string-remove-last (texto-cadena n)) (texto-color n) (texto-tam n))]
    ;Adiciona las letras precionadas a la cadena del estado
    [else (make-texto (string-append (texto-cadena n) k) (texto-color n) (texto-tam n))]))

(big-bang INICIAL 
          [to-draw pantalla]          ;Diseño de la pantalla
          [on-key keyboardHandler])   ;Agregar caracter a la cadena
