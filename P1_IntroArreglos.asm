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
arreglo_p1 byte 10, 12, 15, 20, 30, 8

.code

	main1 PROC
	
		;Lógica del Programa

		mov eax, 0

		mov al, arreglo_p1
		call writedec
		
		
		

		exit	
	
	main1 ENDP
	
	END main1