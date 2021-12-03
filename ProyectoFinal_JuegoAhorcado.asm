TITLE JUEGO DEL AHORCADO

;DESCRPICIÓN 
;Objetivo:  
;Autore(s):
;         Mi Equipo
;Semestre: 8vo Semestre ISC 
;FIN DESCRPICIÓN

INCLUDE Irvine32.inc  
INCLUDE MACROS.inc

.data
; Área de Declaración de Variables

palabras_arreglo db "PERRO",0    ; 0
			db "GATO-",0    ; 6
			db "OSO--",0    ; 12
			db "PAZ--",0    ; 18
			db "FOCO-",0	; 24	 
			db "PAPAS",0    ; 30
			db "LAPIZ",0    ; 36

Espacio db "-",0
palabraSeleccionada db 15 dup(0) 

Vidas dword 10
contador dword 0
LetrasDescubiertas dword 0
Elije dword 0

palabraEscondida db 15 dup(0)

.code

	ahorcado PROC	
			;Lógica del Programa		
			
			ImpPantallaLn "    JUEGO DEL AHORCADO _ _ _ _ _"
			ImpPantallaLn "(X)                            O"
			ImpPantallaLn "(0J0)                         /|\"
			ImpPantallaLn "(UwU)                          |"
			ImpPantallaLn "(#)                           / \"

Play:

			Semilla  

			mov eax, 7     
			RangoAl 

			mov ebx, 6     
			mul ebx  

			mov esi, offset palabras_arreglo  
			add esi, eax  
			mov edi, offset palabraSeleccionada
			mov ecx, 6  

ciclo:				

				mov ebx, edi  
				mov edi, offset Espacio
				cmpsb  	
				jz detener   

					inc contador   
				
					dec esi					
							
					mov edi, ebx  
					mov eax, edi
				
					movsb 
					
				loop ciclo

					dec contador

detener:

				mov ecx, contador  

				mov edi, offset palabraEscondida

				mov eax, 0
				mov al, "."     

				rep stosb
				
			Salto
			ImpPantalla_N_Ln "Palabra Escondida: "
			mov edx, offset palabraEscondida
			EscribirTXT
			Salto

MainMenu:	

			mov eax, 0
			Salto

			ImpPantalla_N_Ln "Ingresa una Letra en Mayuscula:  "
			LeerCARACTER  
			EscribirCARACTER 
			Salto

			ImpPantalla_N_Ln "La Letra ingresada es: "
			;sub al,20H
			EscribirCARACTER 

			Salto

			mov edi, offset palabraSeleccionada				
			mov esi, offset palabraEscondida  
			mov ecx, contador

ciclo2:

				inc esi 
				scasb  		
				
				jnz continuar 

					dec esi 
					xchg esi, edi
					stosb     				
					dec edi  

					xchg esi, edi 			
					inc esi
					
					inc letrasdescubiertas

continuar:							
				
			loop ciclo2
		
			Salto
			ImpPantalla_N_Ln "Palabra Escondida: "
			mov edx, offset palabraEscondida
			EscribirTXT
			Salto
			jmp Comparar
			Salto
			
Comparar:
				mov ecx,LetrasDescubiertas
				cmp contador,ecx
				jz esigual
				jnz noesigual
				esigual:
					Salto
					ImpPantallaLn "    (UwU)  GANASTE!!! (UwU)"
					
					ImpPantallaLn "              \O/"
					ImpPantallaLn "               |"
					ImpPantallaLn "               |"
					ImpPantallaLn "              / \"
					jmp Reintentar
					Salto
					
noesigual:
					dec vidas
					mov eax,vidas
					ImpPantalla_N_Ln "VIDA #"
					EscribirNUM
					Salto
					jmp Fin
					Salto
			
Fin:
					cmp vidas,0
					jz sale
					jnz continua
					sale:
						Salto
						ImpPantallaLn " (X) FIN DEL JUEGO ! PERDISTE (X)"
						ImpPantallaLn "                _"
						ImpPantallaLn "               /|\"
						ImpPantallaLn "                |"
						ImpPantallaLn "               \ /"
						Salto
						ImpPantalla_N_Ln "La Palabra Era: "
						mov edx, offset palabraSeleccionada
						EscribirTXT
						Salto
						jmp Reintentar
					continua:
						jmp MainMenu

Reintentar:
					Salto
					ImpPantalla "Quieres Volver a Jugar??? (SI: 0 / NO: 1): "
					LeeNTeclado
					Salto
					mov Elije, eax
					Salto
					cmp Elije,0
					jz Jugar
					jmp Salir

Jugar:
				ImpPantallaLn "(0J0) -NUEVA PARTIDA- (0J0)"
				Salto
				mov Vidas,10
				mov contador,0
				mov LetrasDescubiertas,0
				mov Elije,0
			    jmp Play

			Salto

		Salir:
		  exit	

	ahorcado ENDP
	END ahorcado