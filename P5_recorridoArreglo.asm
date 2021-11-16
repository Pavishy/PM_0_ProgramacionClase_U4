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
arreglo_p5 byte 10, 12, 15, 20, 30, 8

.code

	main5 PROC	
		;Lógica del Programa
		;cuando se trabaja con arreglos, los indices se recomienda sean 
		;accedidos utilizando a los registros edi o esi. 

		; para arreglos normales, es indistinta la utilización de un registro u otro

		
		mov eax, 0  ; limpia del registro para no tener contenido basura

		mov edi, 0 ; indice con el que se comenzará el recorrido

		mov ecx, sizeof arreglo_p5  ; posiciona la cantidad de elementos del registro
									; en ecx, debido a que este será utilizado
									; como contador en el ciclo (con loop)

		ciclo:
			mov al, arreglo_p5[edi]
			call writedec                     ; posicion 0
			call crlf
			inc edi
		loop ciclo
	
		;Tarea Programa. Realizar e imprimir la SUMA de los elementos de un arreglo

		exit	
	
	main5 ENDP
	
	END main5