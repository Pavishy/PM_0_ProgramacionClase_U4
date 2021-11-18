TITLE NombrePrograma

;DESCRPICIÓN 
;Objetivo: Archivo de Ejemplo
;
; Autore(s):
; Semestre: 8vo Semestre ISC 
;FIN DESCRPICIÓN

INCLUDE Irvine32.inc  
INCLUDE MACROS.inc

.data
; Área de Declaración de Variables
arreglo_p dword 10, 12, 15, 20
		    dword  7,  5, 10, 12
			dword  1,  2,  3,  4

num dword 2

.code

	sumatr4 PROC 
	
	ImpPantallaLn "Numeros pares de la matriz: "

	mov ebx, 0
	mov ecx, 11

	Ciclo:
		 mov eax, dword ptr[arreglo_p+ecx*4]
		 push eax
		 mov edx, 0
		 div num
		 pop eax

         cmp edx, 0
		    jne NextPart
		  
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
	
	sumatr4 ENDP
	END sumatr4

