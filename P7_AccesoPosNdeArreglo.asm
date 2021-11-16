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
arreglo_p7 dword 10, 12, 15, 20, 30, 8

.code

	main7 PROC	
		;Lógica del Programa
		;cuando se trabaja con arreglos, los indices se recomienda sean 
		;accedidos utilizando a los registros edi o esi. 

		; para arreglos normales, es indistinta la utilización de un registro u otro

		
		mov eax, 0  ; limpia del registro para no tener contenido basura

		mov edi, 0 ; indice con el que se comenzará el recorrido

		mov ecx, sizeof arreglo_p7  ; posiciona la cantidad de bytes del arreglo en el registro
									; en ecx, debido a que este será utilizado
									; como contador en el ciclo (con loop)
		
		mov eax, ecx
		call writedec

		;;PARA OBTENER LA CANTIDAD DE ELEMENTOS EN EL ARREGLO SE ´PUEDE:
		mov ebx, 4   ; porque cada variable dword tiene un total de 4bytes
		mov edx, 0   ; para poder limpiar el registro para el residuo y evitar errores
		div ebx
		;eax contendrá la cantidad de elementos del arreglo

		call crlf
		call writedec
		mov ecx, eax   ; posicionamos a ecx el total de elementos del arreglo, para utilizarlo como contador

		call crlf
		call crlf

		ImpPantallaLn "Que posicion del arreglo desea visualizar?:"

		call readint  ; eax

		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		; TAREA REALIZAR LA VALIDACIÓN: 
		;validar que el indice se encuentre dentro del intervalo aceptado  [ 0  -  n-1 ]

		;SI PASA LA VALIDACIÓN ENTONCES: 

		mov ebx, 4  ; cantidad de bytes que tiene una variable de tipo dword

		mul ebx     ; multiplica al indice deseado por el usuario * 4, para obtener la ubicacion
					; del indice en memoria

		mov edi, eax  

		call crlf

		mov eax, arreglo_p7[edi]
		call writedec

		call crlf

		
		exit	
	
	main7 ENDP
	
	END main7