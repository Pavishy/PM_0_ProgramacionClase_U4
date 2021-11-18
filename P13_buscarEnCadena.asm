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
cadena_A_p13 db "Hola Mundo", 0


.code

	main13 PROC	
		;Lógica del Programa		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		mov edi, offset cadena_A_p13 

		mov eax, 0 ;limpia el registro eax

		mov al, 'H'  ;caracter a buscar


		scasb  ; 

		jz esigual
		jnz noesigual

		esigual:
			ImpPantallaLn "Es igual"
			jmp salir

		noesigual:
			ImpPantallaLn "No es igual"  ; modifica el registro de banderas
			
			dec edi			
			scasb

			;Si no es igual, entonces checo si es mayor o es menor
			jg esmayor
			; si es menor 
			ImpPantallaLn "Es menor"  ; es menor la letra en "al" que la letra con la que se compara en la cadena
			jmp salir
			

		esmayor:
			ImpPantallaLn "Es mayor"
			

		salir:


		exit	
	
	main13 ENDP
	
	END main13