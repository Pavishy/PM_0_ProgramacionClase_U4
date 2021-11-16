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
arreglo_p9 dword 10, 12, 15, 20, 30
		   dword  7,  5, 10, 12, 28

filas_p9 dword 2
columnas_p9 dword 5

.code

	main9 PROC	
		;Lógica del Programa
		;cuando se trabaja con arreglos, los indices se recomienda sean 
		;accedidos utilizando a los registros edi o esi. 
			
		mov eax, 0  ; limpia del registro para no tener contenido basura

		;mov edi, 1 ; indice de las filas       ; fila 1 ; considerando que se comienza en 0
		;mov esi,  4 ; loc de mem de la columna accesada ; columna 1 ; considerando que se comienza en 0


		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		ImpPantallaLn "Cual es el indice de la fila que deseas: "
		call readint  ; eax

		;ubicacion de la loc. de mem. asociada a la fila buscada = 4 * totalColumnas * indiceFila
		;mov eax, edi   ; mueve al indiceFila deseado a edi, para poder multiplicar
		mov ebx, 4     ; total de bytes de cada elemento del arreglo (tamaño del tipo de dato)
		mul ebx        ; multiplica por el total de bytes que tiene cada elemento en el arreglo 
		mul columnas_p9 ; (4 * indiceFila) * totalColumnas

		mov edi, eax  ; posicionamiento en edi de la localidad de memoria asociada al indice
					  ; de la fila buscada


		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;						

		ImpPantallaLn "Cual es el indice de la columna que deseas: "
		call readint  ;eax
		
		mov ebx, 4
		mul ebx

		mov esi, eax ; posicionamiento en edi de la localidad de memoria asociada al indice
					 ; de la columna buscada

		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


		mov eax, arreglo_p9[edi + esi]

		call writedec
		call crlf
		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


		exit	
	
	main9 ENDP
	
	END main9