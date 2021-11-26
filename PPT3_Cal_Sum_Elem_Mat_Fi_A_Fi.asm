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

suma dword ?

.code

	sumatr2 PROC
	mov ecx, 3
	
	; 0_3 - 4_7 - 8_11
	
	
	mov ebx, 0

	ciclo:
	
	add ebx, dword ptr [arreglo_p+ecx*4]
	dec ecx
	
	cmp ecx, 0
	jge ciclo

	mov eax, ebx
	ImpPantalla_N_Ln "La sumatoria de la fila 1 es: "
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	mov ecx, 7
	
	mov ebx, 0

	ciclo2:
	
	add ebx, dword ptr [arreglo_p+ecx*4]
	dec ecx
	
	cmp ecx, 4
	jge ciclo2

	mov eax, ebx
	ImpPantalla_N_Ln "La sumatoria de la fila 2 es: "
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	mov ecx, 11
	
	mov ebx, 0

	ciclo3:
	
	add ebx, dword ptr [arreglo_p+ecx*4]
	dec ecx
	
	cmp ecx, 8
	jge ciclo3

	mov eax, ebx
	ImpPantalla_N_Ln "La sumatoria de la fila 3 es: "

	exit

	sumatr2 ENDP
	END sumatr2
