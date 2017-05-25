;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Editor de Textos|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "docs.rkt" "teachpack" "htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;EDITOR DE TEXTOS

;Definición de la altura de la pantalla
(define ALTO 60)
;Definición del ancho de la pantalla
(define ANCHO 800)
;Definición del fondo de la pantalla
(define FONDO (empty-scene ANCHO ALTO))

;Un texto es: (make-texto String Color Number)
;El primer elemento es la cadena a mostrarse
;El segundo es el color de la cadena
;El tercero determinan el tamaño de fuente en píxeles
(define-struct texto [cadena color tam])

;Definición del estado inicial del programa
(define INICIAL (make-texto "" "indigo" 20))

;Borra la ultima letra de la cadena
;string-remove-last: String -> String
;Recibe una String, devuelve la misma String sin la ultima letra
(define (string-remove-last s)
  (if (not(string=? "" s))
      (substring s 0 (- (string-length s) 1))
      s))

;Maneja los colores de la cadena
;cambiaColor: texto String -> texto
;Cambia el color de la cadena con las teclas f1, f2, f3, f4, f5 y f6
(define (cambiaColor n k)
  (cond [(key=? k "f1") (make-texto (texto-cadena n) "indigo" (texto-tam n))]
        [(key=? k "f2") (make-texto (texto-cadena n) "black" (texto-tam n))]
        [(key=? k "f3") (make-texto (texto-cadena n) "blue" (texto-tam n))]
        [(key=? k "f4") (make-texto (texto-cadena n) "green" (texto-tam n))]
        [(key=? k "f5") (make-texto (texto-cadena n) "red" (texto-tam n))]
        [(key=? k "f6") (make-texto (texto-cadena n) "yellow" (texto-tam n))]))

;Maneja el tamaño de la fuente de la cadena
;cambiaTamanoFuente: texto String -> texto
;Cambia el tamaño de la fuente con las teclas "up" y "down"
(define (cambiaTamanoFuente n k)
  (cond[(key=? k "up") (make-texto (texto-cadena n) (texto-color n) (+ (texto-tam n) 1))]
       [(key=? k "down") (make-texto (texto-cadena n)
                                     (texto-color n)
                                     (if (< 1 (- (texto-tam n) 1)) ;Verifica si el tamaño de la fuente es menor que 1
                                         (- (texto-tam n) 1)
                                         (texto-tam n)))]
       [else n]))

;Imprime el estado del programa en la pantalla
;pantalla : texto -> Image
;Transforma el estado del sistema en una imagen a mostrar a través de la cláusula to-draw
(define (pantalla n)
  (place-image/align (text (texto-cadena n) (texto-tam n) (texto-color n))
                     0 0 "left" "top" FONDO))

;Maneja las entradas del teclado
;agregarCaracter : estado string -> estado
;Agrega los caracteres digitados a la cadena
;Borra caracteres con la tecla backspace
;Determina el tamanho de fuente con "up" y "down"
;Cambia el color de la cadena
(define (agregarCaracter n k)
  (cond
    ;Determina el tamaño de la fuente
    [(or (key=? k "up") (key=? k "down")) (cambiaTamanoFuente n k)]
    ;Determina el color de la fuente
    [(or (key=? k "f1") (key=? k "f2") (key=? k "f3") (key=? k "f4") (key=? k "f5") (key=? k "f6")) (cambiaColor n k)]
    ;Borra las letras con la tecla "backspace"
    [(key=? k "\b") (make-texto (string-remove-last (texto-cadena n)) (texto-color n) (texto-tam n))]
    ;Adiciona las letras precionadas a la cadena del estado
    [else (make-texto (string-append (texto-cadena n) k) (texto-color n) (texto-tam n))]))

(big-bang INICIAL                     ;Estado inicial del sistema
          [to-draw pantalla]          ;Diseño de la pantalla
          [on-key agregarCaracter])   ;Agregar caracter a la cadena
