#define F_CPU 8000000L        // This should match the processor speed
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <util/delay.h>
#include <math.h>
#include <errno.h>

#include "adxl345.h"

//#define UART_BAUD_RATE 2400
#define BAUD_RATE 9600        //  rate. The usart_int routine

// Variables and #define for the RX ring buffer.
#define RX_BUFFER_SIZE 64
unsigned char rx_buffer[RX_BUFFER_SIZE];
volatile unsigned char rx_buffer_head;
volatile unsigned char rx_buffer_tail;

// Function prototypes.
unsigned char uart_buffer_empty(void);
void usart_prints(const char *ptr);
void usart_printf(const char *ptr);
void usart_init(void);
void getDate(int *yy,int *mm, int*dd);
void usart_putc(const char c);
unsigned char usart_getc(void);

int *path = NULL;
int path_counter = 0;

int main(void) {
	double ax = 0;
	double ay = 0;
	double az = 0;
	//char str[50];

	// Enable interrupts for USART
	sei();

	// Initialize USART and the accelerometer
	usart_init(); 
	adxl345_init();

	// Normal X, Y, Z values
	double x_baseline = -0.01; 
	double y_baseline = -0.07;
	double z_baseline = 1.03;

	double x_data;
	double y_data;
	double z_data;

	float cost;

	// Bluetooth Code
	usart_prints("AT+NAMEincidentMonitor");
	_delay_ms(1000);
	//set baud rate to 9600
	usart_prints("AT+BAUD9600");
	_delay_ms(1000);
	//secure for privacy
	//set PIN to 4321
	usart_prints("AT+PIN4321");
	_delay_ms(1000);

	// Passcode for Bluetooth communication
	char passkey = 'f';
	char entered = 'a';
	int flag = 0;
	DDRB = 0x01;
	int counter = 0;

	// The commented code is ideal implementation, however the accelerometer did not 
	// give only acceleration values, but also included factors like yaw that made
	// the ideal method behave in an unintended manner
	for(;;) {
		PORTB = 0X00;

		adxl345_getdata(&ax, &ay, &az);
		//x_data = fabs(x_baseline - ax);
		//y_data = fabs(y_baseline - ay);
		//z_data = fabs(z_baseline - az);
	    //sprintf(str, "X: %.2f Y: %.2f Z: %.2f ", ax, ay, az);
		//sprintf(str, "Z: %.2f ", az);

		//usart_prints(str);
		_delay_ms(10);

		//data is +/- 1 depending on orientation. acceleration data is read through that

		// Euclidean Distance of all three axes
		//cost = sqrt(pow(x_data, 2) + pow(y_data, 2) + pow(z_data, 2));
		cost = sqrt(pow(ax,2) + pow(ay,2) + pow(az,2));
		//cost = abs(x_data) + abs(y_data) + abs(z_data);
		//cost = x_data + y_data + z_data;

		/*sprintf(str, "%f", cost);
		usart_prints(str);
		usart_prints("  ");*/

		if(counter > 0) {
			counter -= 1;
		}

		//KEEP CODE works best this way
		if((cost > 1.9) && (counter == 0)) {
			flag = 1;
		}


		
		// Flag with Bluetooth
		if((flag == 1) && (counter == 0)) {
			PORTB = 0X01;              //Turn on buzzer
			usart_prints("WARNING!");  //Send warning via Bluetooth
			
			usart_prints("Enter key"); //Get disable
			entered = usart_getc();
			
			//Make sure correct disable is entered
			while(entered != passkey) {
				usart_prints("Wrong key");
				entered = usart_getc();
			}

			//Reset alarm
			flag = 0;
			counter = 10;

		}
		
	}
}




/*
/ USART FUNCTIONALITY
*/

// UART receive interrupt handler.
// To do: check and warn if buffer overflows.
ISR(USART_RX_vect) {
	char c = UDR0;
	rx_buffer[rx_buffer_head] = c;
	if (rx_buffer_head == RX_BUFFER_SIZE - 1) {
		rx_buffer_head = 0;
		} else {
		rx_buffer_head++;
	}
}

// Configures the USART for serial 8N1 with
// the Baud rate controlled by a #define.
void usart_init(void) {
	unsigned short s;
	
	// Set Baud rate, controlled with #define above.
	s = (double)F_CPU / (BAUD_RATE*16.0) - 1.0;
	UBRR0H = (s & 0xFF00);
	UBRR0L = (s & 0x00FF);

	// Receive complete interrupt enable: RXCIE0
	// Receiver & Transmitter enable: RXEN0,TXEN0
	UCSR0B = (1<<RXCIE0)|(1<<RXEN0)|(1<<TXEN0);

	// Along with UCSZ02 bit in UCSR0B, set 8 bits
	UCSR0C = (1<<UCSZ01)|(1<<UCSZ00);
	
	DDRD |= (1<< 1);         // PD0 is output (TX)
	DDRD &= ~(1<< 0);        // PD1 is input (Rx)
	// Empty buffers
	
	rx_buffer_head = 0;
	rx_buffer_tail = 0;
}

// Send NULL-terminated data from FLASH.
// Uses polling (and it blocks).
void usart_printf(const char *ptr) {
	char c;

	while(pgm_read_byte_near(ptr)) {
		c = pgm_read_byte_near(ptr++);
		usart_putc(c);
	}
}

// Send character via the USART.  Uses polling
// (and it blocks). Wait for UDRE0 to become
// set (=1), which indicates the UDR0 is empty
// and can accept the next character.
void usart_putc(const char c) {
	while (!(UCSR0A & (1<<UDRE0)))
	;
	UDR0 = c;
}

// Send NULL-terminated data from SRAM.
// Uses polling (and it blocks).
void usart_prints(const char *ptr) {
	while(*ptr) {
		while (!( UCSR0A & (1<<UDRE0))) //next data shifted
		;
		UDR0 = *(ptr++);
	}
}


// Get char from the receiver buffer.  This
// function blocks until a character arrives.
unsigned char usart_getc(void) {
	unsigned char c;
	while (rx_buffer_tail == rx_buffer_head)  //wait for an entered character in buffer
	;
	c = rx_buffer[rx_buffer_tail];            //read in data
	if (rx_buffer_tail == RX_BUFFER_SIZE-1) { //Buffer rollover
		rx_buffer_tail = 0;
		} else {                                  //Valid location
		rx_buffer_tail++;
	}
	return c; //return data
}

//returns true if buffer is empty
unsigned char uart_buffer_empty(void) {
	return (rx_buffer_tail == rx_buffer_head);
}

