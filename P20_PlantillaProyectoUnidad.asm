TITLE Intro Cadenas

;DESCRPICIÓN 
;Objetivo:  
;
; Autore(s):
;         García Ruiz Alejandro H.


; Semestre: 8vo Semestre ISC 
;FIN DESCRPICIÓN

INCLUDE Irvine32.inc  

INCLUDE MACROS.inc

.data
; Área de Declaración de Variables

;                           INDICE
palabras_20 db "PERRO",0    ; 0
			db "GATO-",0    ; 6
			db "OSO--",0    ; 12
			db "AZ---",0    ; 18
			db "FOCO-",0	; 24	 
			db "PAPAS",0    ; 30
			db "LAPIZ",0    ; 36

espacio_20 db "-",0

palabraSeleccionada_20 db 15 dup(0) 

contador_20 dword 0

palabraEscondida_20 db 15 dup(0)   ; "....."  .. es un punto por cada letra a descrubir

.code

	main20 PROC	
		;Lógica del Programa				
			
			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			;;FALTA AÑADIR UN MÉTODO PARA LA SELECCIÓN DE LA PALABRA POR EL USUARIO/ALEATORIO

			; se debe conocer la cantidad de palabras con las que cuenta el arreglo "palabras"
			; En este caso 7 palabras, por lo que el indice puede ir de 0 al 6

			;De igual manera se tiene que considerar al máximo numero de caracteres que puede tener la palabra
			; En nuestro ejemplo son 6 caracteres

			call randomize  ; establece la semilla para los numeros aleatorios

			mov eax, 7     ; cantidad de palabras
			call randomrange ; eax ; genera un aleatorio entre 0 y el valor de eax exclusivo
							 ;(Para este ejemplo del 0 al 6)

			mov ebx, 6     ;cantidad de caracteres máxima por palabra
			mul ebx  ; indice de palabra seleccionada * cantidad de caracteres
					 ; de esta manera en eax se almancerá el indice con el que comienza la palabra
					 ; que haya sido seleccionada aleatoriamente




			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			;;;; COPIA UNA PALABRA DEL ARREGLO A UNA VARIABLE AUXILIAR
			;;   NO CONSIDERA GUIONES AL COPIAR LA PALABRA
			
			mov esi, offset palabras_20  ;ARREGLO DE PALABRAS
			add esi, eax     ; relacionado al indice de la palabra seleccionada

			mov edi, offset palabraSeleccionada_20 ;VARIABLE AUXILIAR

			mov ecx, 6  ; considerar el máximo numero de caracteres que puede tener la palabra

			ciclo:				

				mov ebx, edi  ;respaldo del valor de edi, para posteriormente realizar 
							  ;la comparacion de la cadena y ver si el caracter actual es un guion o no
				
				mov edi, offset espacio_20
				cmpsb  ;compara esi con edi , para saber si el caracter actual es guion				

				jz detener   ;si es cero, es decir, si es guion, entonces se pasa a detener, 
							 ;porque significa que ya no existen caracteres que copiar
							 ;en caso contrario, se copia el caracter actual a "palabra_seleccionada"


				;En el caso de que No sea cero, es decir, el caracter actual no es un guion, es una letra,
				; entonces, se realiza el siguiente procedimiento:

					inc contador_20   ;incrementa en 1 
					;contador es utilizado para saber realmente cuantas letras tiene la palabra
					; que fue selecionada
				
					dec esi					
							
					mov edi, ebx  ;recuperar el valor de edi (asociado al destino)
					mov eax, edi
				
					movsb ;copiar el valor 
					
				loop ciclo

					dec contador_20

			detener:

			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			call crlf
			ImpPantallaLn "Palabra Seleccionada: "
			mov edx, offset palabraSeleccionada_20
			call writestring
			call crlf

			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			;;;;GENERAR PALABRA ESCONDIDA... 

				mov ecx, contador_20  ; tamaño de la palabra escogida

				mov edi, offset palabraEscondida_20

				mov eax, 0
				mov al, "."     

				repite:
					stosb  ; incrementa automaticamente a edi en uno
				loop repite
				
			call crlf
			ImpPantallaLn "Palabra Escondida: "
			mov edx, offset palabraEscondida_20
			call writestring
			call crlf

			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			;;;;; PROCEDIMIENTO EN DESARROLLO..."BUSCAR UNA LETRA EN LA PALABRA"

			;;;;;solicitar la letra a buscar

			MOV EAX, 0

			call crlf
			call crlf
			ImpPantallaLn "Ingresa una Letra:  "
			CALL READCHAR  ; guarda el caracter leido en "al"
			CALL WRITECHAR

			CALL CRLF 

			ImpPantallaLn "La Letra ingresada es: "
			CALL WRITECHAR

			;;;;;;;;
			call crlf
			call crlf
					

			mov edi, offset palabraSeleccionada_20	;	para buscar el caracter ingresado			
			mov esi, offset palabraEscondida_20   ; si existe, se usara para reeemplazar al punto por su caracter

			mov ecx, contador_20 ;

			ciclo2:

				inc esi ; para mantener en el mismo indice a ambas palabras

				scasb  ; compara lo que esta en el acumulador con la memoria direccionada				
								
				; if es igual a cero.. then sobreescribimos con esa letra
				; else no hacemos nada

				jnz continuar  ; si no es igual

				; si es cero, entoces se realiza: 

					dec esi  ; regresa al indice en el que fue igual
					xchg esi, edi; intercambia "seleccionada" por "escondida"
					stosb     				
					dec edi   ; se debe decrementar en uno, debido a que edi se incremento 
							  ; de manera automatica con stosb 

					xchg esi, edi ;se regresan las palabras nuevamente a como estaban al principio					
					inc esi

				continuar:				
	
			loop ciclo2

			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			call crlf
			ImpPantallaLn "Palabra Escondida: "
			mov edx, offset palabraEscondida_20
			call writestring
			call crlf
			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		exit	

	main20 ENDP
	END main20