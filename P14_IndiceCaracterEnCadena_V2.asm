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
cadena_A_p14 db "Hola Mundx",0


.code

	main14v2 PROC	
		;Lógica del Programa		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		mov edi, offset cadena_A_p14 

		mov eax, 0 ;limpia el registro eax

		mov al, 'r'  ;caracter a buscar

		mov ecx, sizeof cadena_A_p14  ;total de elementos en la cadena
		dec ecx ; para quitarle el cero de termino en la comparacion 		

		mov ebx, 0 ; indice

		cicloBusqueda:

			scasb  ; 

			jz esigual
			jnz noesigual

			esigual:
				ImpPantallaLn "Es igual"	
				mov ecx, 1
				jmp continuar

			noesigual:
				ImpPantallaLn "No es igual"  ; modifica el registro de banderas
		
		continuar:

		inc ebx
		cmp ebx, ecx
		jl cicloBusqueda	
				
		;;;;;;;;;;;;;;;;;fuera del ciclo

		cmp ecx, 1
		jz encontrado
			;no encontrado
			ImpPantallaLn "No se encontro el caracter buscado"
			jmp salir

		encontrado:
			ImpPantallaLn "El caracter se encontro en el indice:"
			mov eax, ebx
			dec eax 
			call writedec

		salir: 

		exit	
	
	main14v2 ENDP
	
	END main14v2

	;Tareaa  INVESTIGAR "PREFIJOS DE REPITICION"