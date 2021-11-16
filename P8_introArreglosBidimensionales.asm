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
arreglo_p8 dword 10, 12, 15, 20, 30
		   dword  7,  5, 10, 12, 28

filas_p8 dword 2
columnas_p8 dword 5

.code

	main8 PROC	
		;Lógica del Programa
		;cuando se trabaja con arreglos, los indices se recomienda sean 
		;accedidos utilizando a los registros edi o esi. 

		; para arreglos normales, es indistinta la utilización de un registro u otro

		
		mov eax, 0  ; limpia del registro para no tener contenido basura

		mov edi, 0 ; indice con el que se comenzará el recorrido


		mov eax, arreglo_p8[edi]   ; 0
		call writedec
		call crlf
		add edi, 4
		mov eax, arreglo_p8[edi]   ; 1
		call writedec
		call crlf
		add edi, 4
		mov eax, arreglo_p8[edi]   ; 2
		call writedec
		call crlf
		add edi, 4
		mov eax, arreglo_p8[edi]   ; 3
		call writedec
		call crlf
		add edi, 4
		mov eax, arreglo_p8[edi]   ; 4
		call writedec
		call crlf
		add edi, 4
		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; FILA 2

		mov eax, arreglo_p8[edi]   ; 5
		call writedec
		call crlf
		add edi, 4

		mov eax, arreglo_p8[edi]   ; 6
		call writedec
		call crlf
		add edi, 4

		mov eax, arreglo_p8[edi]   ; 7
		call writedec
		call crlf
		add edi, 4

		mov eax, arreglo_p8[edi]   ; 8
		call writedec
		call crlf
		add edi, 4

		mov eax, arreglo_p8[edi]   ; 9
		call writedec
		call crlf
		


		exit	
	
	main8 ENDP
	
	END main8