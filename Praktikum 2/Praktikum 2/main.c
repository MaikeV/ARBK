/*
 * Praktikum 2.c
 *
 * Created: 20-Oct-19 12:45:27 PM
 * Author : Maike
 */ 

#include <avr/io.h>
#define F_CPU 32000000UL
#include <util/delay.h>


int main(void) {
    DDRB |= (1 << PB0) | (1 << PB1) | (1 << PB2); //Alle Ports auf Output setzen
	
    while (1) {
		leftShift();
		rightShift();
    }
	
	return 0;
}

void leftShift() {
	unsigned char value = (0x01);
	
	while(value != 8) {
		PORTB = value;
		//_delay_ms(800);
		value = (value << 1);
	}
}

void rightShift() {
	unsigned char value = 2;
	
	while (value != 1) {
		PORTB = value;
		//_delay_ms(800);
		value = (value >> 1);
	}
}

