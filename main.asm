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
            ; Store values in R3, R4, and R5
            mov.w #2D97h, R4;
            mov.w #6239h, R5;
            mov.w #4AF1h, R6;

            call #operation_function;

            jmp Main_loop;

operation_function:

            mov.w #203Ch,R7

            ; Performing the and operaation between thr first value (#2D97h), stored in R3, and the second value (#6239h), stored in R4

            and R4,R5; stores the resulting value in R4


            ; Perfoms the or operation between the value in R4, the result of the and operation, and the third value (#AF31h), stored in R5

            bis R5,R6; stores the resulting value in R5


            ; Store the final result, that is stored in R5, into memory address &203Ch

            mov.w R6, 0(R7)

            ret;
                                            

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
            
