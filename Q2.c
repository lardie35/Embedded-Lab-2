#include <msp430.h>

int sum(int s1, int s2)
{
    int s = s1 + s2;

    return s;
}

/**
 * main.c
 */
int main(void)
{
    WDTCTL = WDTPW | WDTHOLD;    // stop watchdog timer

    int a = 0b0100101010110101;
    int b = 0b0100001110110101;
    //0b0100101010110101 0b0100001110110101
    int d = sum(a, b);

    while(1);

    return 0;
}
