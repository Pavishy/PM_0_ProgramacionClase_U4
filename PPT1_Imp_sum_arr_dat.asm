TITLE Suma de elementos del Arreglo

;DESCRPICI�N 
;Objetivo: Programa
; Autore(s): Equipo 1
; Semestre: 8vo Semestre ISC 
;FIN DESCRPICI�N

INCLUDE Irvine32.inc  
INCLUDE MACROS.inc

.data
; �rea de Declaraci�n de Variables
arreglo_p byte 10, 12, 15, 20, 30, 8

.code

	mainsumarr PROC	
		;L�gica del Programa
		
		mov eax, 0

		mov edi, 0 

		mov ecx, sizeof arreglo_p

		ciclo:

			add al, arreglo_p[edi]
			
			inc edi
		loop ciclo

		ImpPantallaLnV2 "La sumatoria del arreglo es: "
	
		;Tarea Programa. 
		;Imprimir la Suma de los elementos del arreglo

		exit	
	
	mainsumarr ENDP
	END mainsumarr

