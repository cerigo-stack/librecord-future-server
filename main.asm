.text
.global _start


_start:

	//call 	_print
	//open socket
	
	mov	$41, %rax
	mov	$2, %rdi	#AF_INET
	mov	$1, %rsi	#SOCK_STREAM
	mov	$0, %rdx
	syscall

	//bind
	mov	%rax, %rdi
	mov	$49, %rax
	push	$0	#8 bytes padding
	pushw	$0	#2 bytes address 0.0.0.0
	pushw	$0	#2 bytes address 0.0.0.0
	pushw	$0xc832	#2 bytes port
	pushw	$2	#2 bytes AF_INET
	mov	%rsp, %rsi
	mov	$16, %rdx
	syscall


	//listen
	mov	$50, %rax
	mov	$10, %rsi
	syscall

	//accept
	mov	$43, %rax
	mov	$0, %rsi
	mov	$0, %rdx
	syscall
	
	push	%rax	
	pop	%rdi
	
	//write to connection
	mov	$1, %rax
	mov	$sup, %rsi
	mov	$5, %rdx
	syscall 

	//close with 0 
	mov	$60, %rax
	mov	$0, %rdi
	syscall


.data
sup:
	.ascii "sup!\n"
