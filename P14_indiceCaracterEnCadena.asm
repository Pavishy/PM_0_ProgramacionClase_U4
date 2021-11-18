TITLE NombrePrograma

;DESCRPICIÓN 
;Objetivo: Archivo de Ejemplo
;
; Autore(s):
;         Apellido Nombre Integrante 1
;         Apellido Nombre Integrante 2

; Semestre: 8vo Semestre ISC 
;FIN DESCRPICIÓN

INCLUDE Irvine32.inc  
INCLUDE MACROS.inc

.data
; Área de Declaración de Variables
cadena_A_p14 db "Hola Mundo",0


.code

	main14 PROC	
		;Lógica del Programa		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		mov edi, offset cadena_A_p14 

		mov eax, 0 ;limpia el registro eax

		mov al, 'M'  ;caracter a buscar

		mov ecx, sizeof cadena_A_p14  ;total de elementos en la cadena
		dec ecx ; para quitarle el cero de termino en la comparacion 
		;dec ecx

		cicloBusqueda:

			scasb  ; 

			jz esigual
			jnz noesigual

			esigual:
				ImpPantallaLn "Es igual"	
				mov ecx, 1

			noesigual:
				ImpPantallaLn "No es igual"  ; modifica el registro de banderas
			
		loop cicloBusqueda	
				


		exit	
	
	main14 ENDP
	
	END main14