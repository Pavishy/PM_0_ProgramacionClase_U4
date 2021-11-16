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
arreglo_p dword 10, 12, 15, 20
		    dword  7,  5, 10, 12
			dword  1,  2,  3,  4

filas_p dword 3
columnas_p dword 4
num dword ?

.code

	sumatr3 PROC    ;;;;;;;;;FALTA
	
	;escribe tu mensaje
	call readint
	mov num, eax
	mov ebx, 0
	mov ecx, 11

	Ciclo:
		 mov eax, dword ptr[arreglo_p+ecx*4]
		 
         cmp eax, num
		    jle NextPart
		  
		  inc ebx
		  push eax

		 NextPart:
			 dec ecx
			 cmp ecx, 0
		 jge Ciclo


   cicloprint:
        
		cmp ebx, 0
		 je salir

		 dec ebx
		 pop eax
		 call writeint
		 call crlf
		 jmp cicloprint
	
	salir:
	exit	
	sumatr3 ENDP
	END sumatr3