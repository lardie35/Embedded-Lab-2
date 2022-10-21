;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
Main_loop:
            ; Store initial values into Registers

            mov.w #0A109h, R4 ; Storing the value 1010 0001 0000 1001 into Register 4
            mov.w #0EF1Ah, R5 ; Storing the value 1110 1111 0001 1010 into Register 5
            mov.w #0001h, R6 ; Storing the value x0001h  into Register 6

            ; Using the and operation to see if the lst bit or least significant bit of R4 and R5 is 1 using the value in R6

            and R6,R4
            and R6,R5

            ; Compare the value stores in R4 with R6 to see if the lest significant bit of the value stored in R4 is 1

            cmp.w R6, R4

            ; If the LSB of R6 is 1, then it equals R6 and moves to th R4EqualToR6 Label of the code
            jeq R4EqualToR6;

            ; If the LSB of R4 is 0, then then program ends
            jmp Main_loop;

R4EqualToR6:

            cmp.w R6, R5
            jeq R5EqualToR6;
            jmp Main_loop;

R5EqualToR6:

            mov.w #0FF0h, R9

            jmp Main_loop;
                                            

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
