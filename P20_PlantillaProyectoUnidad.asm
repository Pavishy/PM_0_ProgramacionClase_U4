TITLE Intro Cadenas

;DESCRPICIÓN 
;Objetivo:  
;
; Autore(s):
;         García Ruiz Alejandro H.


; Semestre: 8vo Semestre ISC 
;FIN DESCRPICIÓN

INCLUDE Irvine32.inc  

INCLUDE MACROS.inc

.data
; Área de Declaración de Variables

;                           INDICE
palabras_20 db "PERRO",0    ; 0
			db "GATO-",0    ; 6
			db "OSO--",0    ; 12
			db "AZ---",0    ; 18
			db "FOCO-",0	; 24	 
			db "PAPAS",0    ; 30
			db "LAPIZ",0    ; 36

espacio_20 db "-",0
vidas dword 5

palabraSeleccionada_20 db 15 dup(0) 

contador_20 dword 0

palabraEscondida_20 db 15 dup(0)   ; "....."  .. es un punto por cada letra a descrubir

.code

	main20 PROC	
		;Lógica del Programa				

			Semilla  

			mov eax, 7     
			RangoAl 

			mov ebx, 6     
			mul ebx  

			
			mov esi, offset palabras_20  
			add esi, eax  

			mov edi, offset palabraSeleccionada_20 

			mov ecx, 6  

			ciclo:				

				mov ebx, edi  
				
				mov edi, offset espacio_20
				cmpsb  	

				jz detener   

				
					inc contador_20   
				
					dec esi					
							
					mov edi, ebx  
					mov eax, edi
				
					movsb ;copiar el valor 
					
				loop ciclo

					dec contador_20

			detener:
			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

						

			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			;Salto
			;ImpPantalla_N_Ln "Palabra Seleccionada: "
			;mov edx, offset palabraSeleccionada_20
			;EscribirTXT
			;Salto

			;;;;GENERAR PALABRA ESCONDIDA... 

				mov ecx, contador_20  

				mov edi, offset palabraEscondida_20

				mov eax, 0
				mov al, "."     

				rep stosb
				
			Salto
			ImpPantalla_N_Ln "Palabra Escondida: "
			mov edx, offset palabraEscondida_20
			EscribirTXT
			Salto

			
			; PROCEDIMIENTO EN DESARROLLO..."BUSCAR UNA LETRA EN LA PALABRA"


	MainMenu:	

			MOV EAX, 0

			Salto
			Salto

			ImpPantalla_N_Ln "Ingresa una Letra:  "
			LeerCARACTER  
			EscribirCARACTER 

			Salto

			ImpPantalla_N_Ln "La Letra ingresada es: "
			;sub al,20H
			EscribirCARACTER 

			;;;;;;;;
			Salto
			Salto

			mov edi, offset palabraSeleccionada_20	;	para buscar el caracter ingresado			
			mov esi, offset palabraEscondida_20   ; si existe, se usara para reeemplazar al punto por su caracter

			mov ecx, contador_20 ;

			ciclo2:

				inc esi ; para mantener en el mismo indice a ambas palabras para que ambos registros cuenten con la misma cantidad y no se reemplazen los
				; indices incorrectos, ya que esi debe de incrementar su espacio porque edi por medi de scasb incrementa en 1

				scasb  ; compara lo que esta en el acumulador con la memoria direccionada				
								
				; if es igual a cero.. then sobreescribimos con esa letra
				; else no hacemos nada

				
				jnz continuar  ; si no es igual
				
				; si es cero, entoces se realiza: 

					dec esi  ; regresa al indice en el que fue igual
					xchg esi, edi; intercambia "seleccionada" por "escondida"
					stosb     				
					dec edi   ; se debe decrementar en uno, debido a que edi se incremento 
							  ; de manera automatica con stosb 

					xchg esi, edi ;se regresan las palabras nuevamente a como estaban al principio					
					inc esi

				continuar:							
				
			loop ciclo2

			
			Salto
			ImpPantalla_N_Ln "Palabra Escondida: "
			mov edx, offset palabraEscondida_20
			EscribirTXT
			Salto

			
			JMP MainMenu
			

			;jz esigual
			;jnz noesigual
			;esigual:
			;	ImpPantallaLn "Es igual"
			;	jmp MainMenu

			;noesigual:
			;	ImpPantallaLn "NO es igual"
			;	jmp MainMenu

			Salto

		exit	

	main20 ENDP
	
	END main20