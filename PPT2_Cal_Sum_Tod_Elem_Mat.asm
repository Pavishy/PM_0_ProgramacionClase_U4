TITLE Suma de elementos de una matriz

;DESCRPICI�N 
;Objetivo: Programa
; Autore(s): Equipo 1
; Semestre: 8vo Semestre ISC 
;FIN DESCRPICI�N

INCLUDE Irvine32.inc  
INCLUDE MACROS.inc

.data
; �rea de Declaraci�n de Variables
arreglo_p dword 10, 12, 15, 20
		    dword  7,  5, 10, 12
			dword  1,  2,  3,  4

suma dword ?

.code

	sumatr PROC
	mov ecx, 11
	mov ebx, 0

	ciclo:
	
	add ebx, dword ptr [arreglo_p+ecx*4]
	dec ecx
	
	cmp ecx, 0
	jge ciclo

	mov eax, ebx
	
	ImpPantallaLnV2 "La sumatoria de la matriz es: "

	exit

	sumatr ENDP
	END sumatr


;;; 298