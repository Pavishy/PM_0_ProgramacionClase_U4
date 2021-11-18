ImpPantalla MACRO texto
	local mensaje
	.data
		mensaje db texto,0
	.code
		push edx  ; guardo en la pila el valor
		mov edx, offset mensaje
		call writestring		
		pop edx   ;recupero el valor original de edx
ENDM

ImpPantallaLn MACRO texto
	local mensaje
	.data
		mensaje db texto,0
	.code
		push edx  ; guardo en la pila el valor
		mov edx, offset mensaje
		call writestring
		call crlf
		pop edx   ;recupero el valor original de edx
ENDM

ImpPantallaLnV2 MACRO texto
	local mensaje
	.data
		mensaje db texto,0
	.code
		push edx  
		mov edx, offset mensaje
		call writestring
		call writedec
		call crlf
		pop edx  
ENDM

ImpPantallaLnV0 MACRO texto
	local mensaje
	.data
		mensaje db texto,0
	.code
		push edx  
		mov edx, offset mensaje
		call writestring
		call readdec
		call crlf
		pop edx  
ENDM

Suma_V1 MACRO  ; los valores que usará el macro son almacenados en registros en el programa principal
			   ; y estos son consultados / accedidos desde el MACRO

	; sumar a los registros ebx, ecx

	.data

	.code
		
		add ebx, ecx  ; el valor resultado estará en ebx

ENDM


Suma_V2 MACRO a, b  		
	
	; sumar a los registros ebx, ecx que contendrán al valor de a y b respectivamente
	.data

	.code
		
		push ecx ; respaldar el valor de ecx 		

		mov ebx, a
		mov ecx, b

		add ebx, ecx  ; el valor resultado estará en ebx


		pop ecx ;recupero el valor original de ecx para que el usuario lo pueda seguir utilizando sin problema
ENDM


Suma_V3 MACRO a, b  				
	.data
		varA dword a
		varB dword b

	.code
				
		mov ebx, varA		

		add ebx, varB  ; el valor resultado estará en ebx
	
ENDM