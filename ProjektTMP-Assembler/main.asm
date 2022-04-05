;
; ProjektTMP.asm
;
; Created: 12.05.2021 18:32:06
; Authors : Adrian Przywara & Marietta Sobejko
;


; Replace with your application code
.include "m328PBdef.inc"
	.org 0
	jmp start

	.DSEG
	.ORG 0x100 ;Zmienne
	LowRegister: .BYTE 1 ;3 i 4 wyœwietlacz
	HighRegister: .BYTE 1 ;1 i 2 wyœwietlacz
	isStoped: .BYTE 1 ;status czy jest zatrzymany
	NewNumber: .BYTE 1 ;dopisywana cyfra podczas zmiany godziny
	PressedButton: .BYTE 1 ;kod 1 z N wciœnietêgo przycisku
	whichNumber: .BYTE 1 ;na którym wyœwietlaczu wpisaæ now¹ liczbê

	.CSEG
	.ORG 0x32
	prime: .DB 0x7E, 0x30, 0x6D, 0x79, 0x33, 0x5B, 0x5F, 0x70, 0x7F, 0x7B  ;Tabela transkodowa

	.org PCINT1addr
	jmp keypad_ISR

	.ORG 0x100

	;Initialization
	start:
	;Stos
	ldi r16, high(ramend)
	out SPH, r16
	ldi r16, low(ramend)
	out SPL, r16

	;Wyjœcia dla wyœwietlacza
	ldi r16, 0xFF
	out ddrd, r16
	out ddre, r16

	;SET UP KEYPAD, 4 rows x 4 cols
	;Set colums as inputs and rows as outputs
	ldi r20, 0x00
	out ddrc, r20
	ldi r20, 0x0f
	out ddrb, r20

	;Set columns to high (pull ups) and rows to low
	ldi r20, 0x00
	out portb, r20
	ldi r20, 0x0f
	out portc, r20

	;Select columns as interrupt triggers
	ldi r20, (1<<pcint8)|(1<<pcint9)|(1<<pcint10)|(1<<pcint11)
	sts pcmsk1, r20

	;Enable pcint1
	ldi r20, (1<<pcie1)
	sts pcicr, r20

	;Reset register for output
	ldi r18, 0x00
	sts LowRegister,r18
	sts HighRegister,r18

	ldi r16, 0 ;Pocz¹tkowe warunki logiczne oraz wartoœæ zmienianej liczby
	sts isStoped, r16
	sts NewNumber, r16
	sts whichNumber, r16

	;Wartoœci przy których ma zwiêkszyæ wartoœæ kolejnych cyfr
	ldi r20, 10
	ldi r24, 6
	ldi r25, 4
	ldi r26, 3
	licznik: ;wlasciwy licznik, nieskoñczona pêtla
			ldi r16, 0 ;Inicjalizacja liczników
			ldi r17, 0
			licz1wys:
				licz2wys:
					licz3wys:
						licz4wys:
							sts LowRegister,r16
							sts HighRegister,r17
							ldi r23,10
							powtorz10x: ;opóŸnienie licznika
								call wyswietl
								sei ;chwilowe w³¹czenie obs³ugi przerwañ
								nop
								cli ;wy³¹czenie
								dec r23
								brne powtorz10x
							ldi r21,1 ;test warunku czy jest zatrzymany licznik 
							lds r22,isStoped
							lds r16,LowRegister
							lds r17,HighRegister
							cp r21,r22
							breq licz4wys ;jak tak to omija inkrementacjê
							inc r16 ;zwiêkszenie wartoœci licznika
							mov r19,r16
							andi r19,0x0f ;test, jeœli liczba na wyjœciu osi¹gnie wartoœæ 10 to wychodzi z pêtli
							cp r19,r20
							brne licz4wys

						andi r16,0xf0 ;zeruje 4 wyœwietlacz i zwiêksza wartoœæ trzeciego
						swap r16
						inc r16
						mov r19,r16
						swap r16
						cp r19,r24 ;test, jeœli liczba na wyjœciu osi¹gnie wartoœæ 6 to wychodzi z pêtli
						brne licz3wys

					ldi r16, 0
					inc r17 ;zeruje 3 i 4 wyœwietlacz i zwiêksza wartoœæ drugiego
					mov r19,r17
					andi r19,0x0f
					mov r27,r17
					andi r27,0xf0
					swap r27
					;test liczby na 1 wyœwietlaczu, jeœli jest równa 2 to wyjdzie z pêtli po osi¹gniêciu wartoœci 4 na drugim, w przeciwnym wypadku wyjdzie po osi¹gniêciu 10
					ldi r28,2
					cp r27,r28
					brne NextS0
					cp r19,r25
					breq dalej
					rjmp licz3wys
					NextS0:
					cp r19,r20
					breq dalej
					rjmp licz3wys

				dalej:
				andi r17,0xf0 ;zeruje 2 wyœwietlacz i zwiêksza wartoœæ pierwszego
				swap r17
				inc r17
				mov r19,r17
				swap r17
				cp r19,r26 ; po przekroczeniu wartoœci 23.59 wraca na pocz¹tek pêtli
				brne licz1wys
			rjmp licznik


	;Obs³uga przerwania w wyniku wciœniêcia przycisku
	keypad_ISR:
		push r16
		push r17
		push r18
		;Set columns as outputs and rows as inputs
		ldi r16, 0x00
		out ddrb, r16
		ldi r16, 0x0f
		out ddrc, r16

		;Set rows to high (pull ups) and columns to low
		ldi r16, 0x0f
		out portb, r16
		ldi r16, 0x00
		out portc, r16

		;Read Port B. Rows code in low nibble
		in r16, pinb

		;Store rows code to r17 on low nibble
		mov r17, r16
		andi r17, 0x0f

		;Set columns as inputs and rows as outputs
		ldi r16, 0x00
		out ddrc, r16
		ldi r16, 0x0f
		out ddrb, r16

		;Set columns to high (pull ups) and rows to low
		ldi r16, 0x0f
		out portc, r16
		ldi r16, 0x00
		out portb, r16

		;Read Port C. Columns code in low nibble
		in r16, pinc

		;Store columns code to r18 on high nibble
		mov r18, r16
		andi r18, 0x0f
		swap r18

		;Merge codes
		add r17,r18

		;Przechowanie kodu 1 z N przycisku w zmiennej PressedButton
		sts PressedButton,r17

		call DecodeWhichButtonPressed ;wywo³anie funkcji dekoduj¹cej kod przycisku na odpowieni¹ funkcjê programu

		pop r18
		pop r17
		pop r16
		reti

	czekaj: ;podprogram dla opoznienia
		push r16
		push r17
		ldi r16, 150
		DELAY1:
			ldi r17, 100
			DELAY2:
				nop
				dec r17
				brne DELAY2
			dec r16
			brne DELAY1
		pop r17
		pop r16
		ret

	wyswietl: ;podprogram do wyswietlania
		push r16

		cli
		ldi zl, low(2*prime)
		ldi zh, high(2*prime)
		ldi r16, 0b00001000 ;4 wyswietlacz
		com r16 
		out porte, r16

		lds r16,LowRegister
		andi r16,0x0f
		add zl,r16
		lpm r16, z
		com r16
		out portd, r16

		call czekaj

		ldi zl, low(2*prime)
		ldi zh, high(2*prime)
		ldi r16, 0b0000100 ;3 wyswietlacz
		com r16 
		out porte, r16

		lds r16,LowRegister
		swap r16
		andi r16,0x0f
		add zl,r16
		lpm r16, z
		com r16
		out portd, r16
		
		call czekaj

		ldi zl, low(2*prime)
		ldi zh, high(2*prime)
		ldi r16, 0b00000010 ;2 wyswietlacz
		com r16 
		out porte, r16

		lds r16,HighRegister
		andi r16,0x0f
		add zl,r16
		lpm r16, z
		com r16
		out portd, r16
		cbi portd, 7 ;aktywacja wyœwietlania kropki dziesiêtnej
		
		call czekaj

		ldi zl, low(2*prime)
		ldi zh, high(2*prime)
		ldi r16, 0b00000001 ;1 wyswietlacz
		com r16 
		out porte, r16

		lds r16,HighRegister
		swap r16
		andi r16,0x0f
		add zl,r16
		lpm r16, z
		com r16
		out portd, r16

		call czekaj
		sei
		pop r16
		ret



	MoveRegisters: ;Funkcja zmieniaj¹ca liczbê znajduj¹c¹ siê na wyœwietlaczu
		push r16
		push r17
		push r18
		push r19
		push r20
		push r21

		lds r16, LowRegister ;Pobranie aktualnej zawartoœci rejestrów
		lds r17, HighRegister
		lds r18, whichNumber
		lds r20, NewNumber

		;wybór na który wpisaæ wyœwietlacz
		ldi r19,0 
		cp r18,r19
		breq First

		ldi r19,1
		cp r18,r19
		breq Second

		ldi r19,2
		cp r18,r19
		breq Third

		ldi r19,3
		cp r18,r19
		breq Fourth

		rjmp EndOfMove
		
		;wpisanie na odpowiedni wyœwietlacz z pominiêciem wartoœci, których nie powinno na nim byæ
		First:
		andi r16,0xf0
		add r16, r20
		rjmp EndOfMove

		Second: ;pominiêcie cyfr 6,7,8,9
		ldi r19,6
		cp r19,r20
		breq RelativeHalfRoute
		ldi r19,7
		cp r19,r20
		breq RelativeHalfRoute
		ldi r19,8
		cp r19,r20
		breq RelativeHalfRoute
		ldi r19,9
		cp r19,r20
		breq RelativeHalfRoute
		andi r16,0x0f
		swap r20
		add r16, r20
		rjmp EndOfMove

		Third: ;Test czy na pierwszym wyœwietlaczu od lewej jest 2, jak tak to pominiêcie cyfr 4,5,6,7,8,9, w przeciwnym wypadku wszystkie dozwolone
		ldi r19,2
		mov r21, r17
		andi r21, 0xf0
		swap r21
		cp r19,r21
		brne Not2OnFourth
		ldi r19,4
		cp r19,r20
		breq RelativeHalfRoute
		ldi r19,5
		cp r19,r20
		breq RelativeHalfRoute
		ldi r19,6
		cp r19,r20
		breq RelativeHalfRoute
		ldi r19,7
		cp r19,r20
		breq RelativeHalfRoute
		ldi r19,8
		cp r19,r20
		breq RelativeHalfRoute
		ldi r19,9
		cp r19,r20
		breq RelativeHalfRoute
		Not2OnFourth:
		andi r17,0xf0
		add r17, r20
		rjmp EndOfMove

		RelativeHalfRoute: ;D³u¿szy skok warunkowy
		rjmp EndOfMove

		Fourth: ;Pominiêcie cyfr 3,4,5,6,7,8,9
		ldi r19,3
		cp r19,r20
		breq EndOfMove
		ldi r19,4
		cp r19,r20
		breq EndOfMove
		ldi r19,5
		cp r19,r20
		breq EndOfMove
		ldi r19,6
		cp r19,r20
		breq EndOfMove
		ldi r19,7
		cp r19,r20
		breq EndOfMove
		ldi r19,8
		cp r19,r20
		breq EndOfMove
		ldi r19,9
		cp r19,r20
		breq EndOfMove

		ldi r19,2 ;test wpisywanej cyfry, jeœli 2 to sprawdŸ jaka liczba jest na 3 wyœwietlaczu
		cp r20,r19
		brne DodajFourth
		;Test czy na 2 wyœwietlaczu jest cyfra z zakresu 0-3
		mov r21,r17
		andi r21,0x0f
		ldi r19,0
		cp r19,r21
		breq DodajFourth	
		ldi r19,1
		cp r19,r21
		breq DodajFourth
		ldi r19,2
		cp r19,r21
		breq DodajFourth
		ldi r19,3
		cp r19,r21
		breq DodajFourth
		;Jeœli nie to zmienia wartoœæ 2 wyœwietlacza na 3
		ldi r19, 3
		andi r17,0xf0
		add r17, r19
		DodajFourth:
		andi r17,0x0f
		swap r20
		add r17, r20
		rjmp EndOfMove

		EndOfMove:

		sts LowRegister,r16		;Wys³anie na wyjœcie nowej zawartoœci rejestrów
		sts HighRegister,r17

		pop r21
		pop r20
		pop r19
		pop r18
		pop r17
		pop r16

		ret


	DecodeWhichButtonPressed: ;Funkcja dekoduj¹ca z kodu 1 z N, który przycisk zosta³ wcisniêty i uruchamiaj¹ca przypisan¹ dla niego funkcje
		push r16
		push r17

		lds r16, PressedButton

		;Przyciski odpowiedzialne za zmianê cyfry na wyœwietlaczu
		ldi r17, 0b00010001
		cp r16,r17
		brne NextStep0 ;Ominiêcie b³êdu 'relative branch out of reach' i czêœci kodu
		ldi r17,7
		sts NewNumber,r17
		call Button0_9
		jmp EndOfDecode

		NextStep0:
		ldi r17, 0b00100001
		cp r16,r17
		brne NextStep1
		ldi r17,8
		sts NewNumber,r17
		call Button0_9
		jmp EndOfDecode

		NextStep1:
		ldi r17, 0b01000001
		cp r16,r17
		brne NextStep2
		ldi r17,9
		sts NewNumber,r17
		call Button0_9
		jmp EndOfDecode

		NextStep2:
		ldi r17, 0b00010010
		cp r16,r17
		brne NextStep3
		ldi r17,4
		sts NewNumber,r17
		call Button0_9
		jmp EndOfDecode

		NextStep3:
		ldi r17, 0b00100010
		cp r16,r17
		brne NextStep4
		ldi r17,5
		sts NewNumber,r17
		call Button0_9
		jmp EndOfDecode

		NextStep4:
		ldi r17, 0b01000010
		cp r16,r17
		brne NextStep5
		ldi r17,6
		sts NewNumber,r17
		call Button0_9
		jmp EndOfDecode

		NextStep5:
		ldi r17, 0b00010100
		cp r16,r17
		brne NextStep6
		ldi r17,1
		sts NewNumber,r17
		call Button0_9
		jmp EndOfDecode

		NextStep6:
		ldi r17, 0b00100100
		cp r16,r17
		brne NextStep7
		ldi r17,2
		sts NewNumber,r17
		call Button0_9
		jmp EndOfDecode

		NextStep7:
		ldi r17, 0b01000100
		cp r16,r17
		brne NextStep8
		ldi r17,3
		sts NewNumber,r17
		call Button0_9
		jmp EndOfDecode

		NextStep8:
		ldi r17, 0b00011000
		cp r16,r17
		brne NextStep9
		ldi r17,0
		sts NewNumber,r17
		call Button0_9
		jmp EndOfDecode
		
		;Przyciski odpowiedzialne za wybór na którym wyœwietlaczu zmieniæ cyfrê
		NextStep9:
		ldi r17, 0b10000001
		cp r16,r17
		brne NextStep10
		ldi r17,0
		sts whichNumber,r17
		jmp EndOfDecode
			
		NextStep10:
		ldi r17, 0b10000010
		cp r16,r17
		brne NextStep11
		ldi r17,1
		sts whichNumber,r17
		jmp EndOfDecode
			
		NextStep11:
		ldi r17, 0b10000100
		cp r16,r17
		brne NextStep12
		ldi r17,2
		sts whichNumber,r17
		jmp EndOfDecode
			
		NextStep12:
		ldi r17, 0b10001000
		cp r16,r17
		brne NextStep13
		ldi r17,3
		sts whichNumber,r17
		jmp EndOfDecode

		NextStep13:
		ldi r17, 0b00101000
		cp r16,r17
		brne NextStep14
		call ButtonStart ;Przycisk do uruchomienia licznika 
		jmp EndOfDecode

		NextStep14:
		ldi r17, 0b01001000
		cp r16,r17
		brne NextStep15
		call ButtonStop ;Przycisk do zatrzymania licznika 
		jmp EndOfDecode

		NextStep15:
		EndOfDecode:
		pop r17
		pop r16
		ret

		;Funkcja sprawdzaj¹ca czy licznik jest zatrzymany i wywo³uj¹ca funkcja zmieniaj¹c¹ wartoœæ wyœwietlacza
		Button0_9:
			push r16
			push r17
			ldi r16,1

			lds r17,isStoped ;Test czy zatrzymany
			cp r16,r17
			brne EndOfButton0_9

			call MoveRegisters ;Funkcja zmianiaj¹ca wartoœæ wyœwietlacza

			EndOfButton0_9:

			pop r17
			pop r16
			ret

		ButtonStart: ;Funkcja zeruj¹ca zawartoœæ "isStoped" uruchamiaj¹ca licznik
			push r16

			ldi r16,0
			sts isStoped,r16

			pop r16
			ret

		ButtonStop: ;Funkcja ustawiaj¹ca zawartoœæ "isStoped" zatrzymuj¹ca licznik
			push r16

			ldi r16,1
			sts isStoped,r16

			pop r16
			ret
;Koniec programu
stop: rjmp stop