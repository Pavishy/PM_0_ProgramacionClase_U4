TITLE NombrePrograma
;DESCRPICIÓN 
;Objetivo: Archivo de Ejemplo
;
; Autore(s):
; Semestre: 8vo Semestre ISC 
;FIN DESCRPICIÓN

INCLUDE Irvine32.inc  
INCLUDE MACROS.inc

.data
; Área de Declaración de Variables
cadena_A_p19 db "Hola Mundx",0


.code

	main19 PROC	
		;Lógica del Programa		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		mov edi, offset cadena_A_p19 

		mov eax, 0 ;limpia el registro eax

		mov al, 'x'  ;caracter a buscar

		mov ecx, sizeof cadena_A_p19  ;total de elementos en la cadena
		dec ecx ; para quitarle el cero de termino en la comparacion 		

		mov ebx, 0 ; indice

		REPNZ scasb   ; el prefino de repeticion REPNZ:
					  ; 1.- comprueba la bandera de cero y por otro lado, comprueba a ecx
					  ; 2.- decrementa de manera automatica a ecx en uno

		call dumpregs

		;;;;;;;;;;;;;;;;;fuera del prefijo de repeticion

		jz encontrado
			;no encontrado
			ImpPantallaLn "No se encontro el caracter buscado"
			jmp salir

		encontrado:
			ImpPantallaLn "El caracter se encontro en el indice:"
			; al total de elementos se le debe restar los que faltan y el resultado será
			; los que han pasado
			mov eax, sizeof cadena_A_p19 ;se obtiene el total de elementos de la cadena
			dec eax  ; para quitar el cero de la cadena

			sub eax, ecx ;total de elementos - elementos restantes = elementos evaluados
			dec eax  ; a los elementos que hhan pasado le restamos uno para obtener el indice 
					 ; debido a que los indices comienzan en cero

			call writedec

			;;;;;;;;;;;;;;;;;;;;;
			call crlf
			dec edi  ; este decremento es necesario debio a que scasb incrementa de manera automatica a edi
			mov al, [edi]
			call writechar

		salir: 

		exit	
	
	main19 ENDP
	END main19