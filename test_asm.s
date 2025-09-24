.section .bss
	.lcomm freeram, 8 # 8 bytes para un unsigned long
	
.section .rodata
print_format:	.asciz "Free ram: %lu bytes\n"

.section .text
.globl _start
.extern printf
	
_start:
	lea freeram(%rip), %rdi # pasamos un puntero a syscall
	mov $470, %rax
	syscall 		 # llamamos al syscall creado

	mov freeram(%rip), %rsi  # cargamos el valor para printf
	movq $print_format, %rdi # el formato en rdi
	xor %rax, %rax           # limpiamos rax
	call printf@plt		 # llamamos a printf
	
	mov $60, %rax		 # salimos del programa 
	mov $0, %rdi
	syscall
