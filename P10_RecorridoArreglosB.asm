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
arreglo_p10 dword 10, 12, 15, 20
		    dword  7,  5, 10, 12
			dword  1,  2,  3,  4

filas_p10 dword 3
columnas_p10 dword 4

.code

	main10 PROC	
		;Lógica del Programa
		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		mov ecx, 0 ; contador para las iteraciones

		recorrido_fila:			

				;ubicacion de la loc. de mem. asociada a la fila buscada = 4 * totalColumnas * indiceFila
				mov eax, ecx   ; mueve al indiceFila deseado a edi, para poder multiplicar
				mov ebx, 4     ; total de bytes de cada elemento del arreglo (tamaño del tipo de dato)
				mul ebx        ; multiplica por el total de bytes que tiene cada elemento en el arreglo 
				mul columnas_p10 ; (4 * indiceFila) * totalColumnas

				mov edi, eax  ; posicionamiento en edi de la localidad de memoria asociada al indice
								; de la fila buscada
				
				push ecx
				mov ecx, 0  ; contador auxiliar para las columnas

			recorrido_columna:
				
				mov eax, ecx		
				mov ebx, 4
				mul ebx

				mov esi, eax ; posicionamiento en edi de la localidad de memoria asociada al indice
							 ; de la columna buscada

				mov eax, arreglo_p10[edi + esi]  ;acceso a la fila y columna "deseada"

				call writedec
				ImpPantalla " - "
		
			inc ecx
			cmp ecx, columnas_p10
			jl recorrido_columna

			call crlf

			pop ecx ; recupera el contador de filas que se encuentra en la pila/stack
		inc ecx
		cmp ecx, filas_p10
		jl recorrido_fila


		exit	
	
	main10 ENDP
	
	END main10


