#include <msp430.h> 


/**
 * main.c
 */
float b = 6.0
int main(void)
{
    WDTCTL = WDTPW | WDTHOLD;    // stop watchdog timer
    int a = 4;
    unsigned char c1=0x0c
    unsigned char c2=0x0f;
            //AND
    unsigned char c3= c1&c2,
            //OR
    unsigned char c4= c1|c2;
