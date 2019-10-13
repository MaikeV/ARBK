;
; Praktikum1.asm
;
; Created: 13-Oct-19 8:01:02 PM
; Author : Maike
;


.def tmp = r16
.def leds = r17

.org 0x00
	rjmp start 

start:
	ldi tmp, low(RAMEND)	;Stack Initialisierung auf Ober-/ Untergrenze des RAM
	out SPL, tmp
	ldi tmp, high(RAMEND)
	out SPH, tmp

	ldi tmp, (1<<PB2) | (1<<PB1) |(1<<PB0)	;Setzen der Ausgaenge als Output(1)
	out DDRB, tmp
	ldi leds,1	;Setzen des Startwertes

main:
	ldi PORTB, leds
	lsl leds	;linkshift auf leds 001 - 010 - 100 - 000
	brge leds, 5
	rjmp backwards
	rcall wait
	rjmp main

backwards:
	lsr leds	;rechtsshift auf leds 000 - 100 - 010
	lsr leds

back:
	ldi PORTB, leds
	lsr leds	;rechtsshift auf leds 010 - 001 - 000
	brle leds, 0
	rjmp main
	rcall wait
	rjmp back

wait:
	ldi  r18, 48
    ldi  r19, 0
    ldi  r20, 0

L1: dec  r20
    brne L1
    dec  r19
    brne L1
    dec  r18
    brne L1
    lpm
    nop
	ret
