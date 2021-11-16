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
arreglo_p2 byte 10, 12, 15, 20, 30, 8

.code

	main2 PROC	
		;Lógica del Programa
		;cuando se trabaja con arreglos, los indices se recomienda sean 
		;accedidos utilizando a los registros edi o esi. 

		; para arreglos normales, es indistinta la utilización de un registro u otro

		
		mov edi, offset arreglo_p2 

		mov eax, 0
		mov al, [edi]
		call writedec                     ; posicion 0
		
		inc edi  ; incrementamos edi en 1
		
		call crlf
		mov al, [edi]
		call writedec                     ; posicion 1


		inc edi  ; incrementamos edi en 1
		
		call crlf
		mov al, [edi]
		call writedec                     ; posicion 2


		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		call crlf
		call crlf
		mov eax, sizeof arreglo_p2 ; devuelve la cantidad de bytes que tiene el arreglo
		call writedec


		exit	
	
	main2 ENDP
	
	END main2