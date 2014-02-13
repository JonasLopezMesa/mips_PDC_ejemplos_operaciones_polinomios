
        	.data        	
        	 	

cad1:	.asciiz "Evaluación polinomio f(x) = ax^2 + bx + c en un intervalo [r,s] \n";
cad2:	.asciiz "Introduzca los valores de a,b y c (separados por retorno de carro):\n";
cad3:	.asciiz "Introduzca [r,s] (r y s enteros, r <= s) (separados por retorno de carro):\n";
cad4:	.asciiz "f(";
cad5:	.asciiz ") = ";
cad6:	.asciiz "\n";
       
                      
        	.text				
main:                	

	
	li	$v0,4		
	la	$a0,cad1	     
	syscall
	
	
	li	$v0,4		
	la	$a0,cad2	    
	syscall
	
	li $v0, 6
	syscall
	mov.s $f20,$f0
	
	li $v0, 6
	syscall
	mov.s $f22,$f0
	
	li $v0, 6
	syscall
	mov.s $f24,$f0
	
		
	li	$v0,4	
	la	$a0,cad3	    
	syscall
	
	li	$v0,5		
	syscall
	move	$s0,$v0		
	
	li	$v0,5	
	syscall
	move	$s1,$v0	
	
	mtc1 $s1, $f4
	cvt.s.w $f8, $f4
	
	
	while:	bgt $s0, $s1, endw
  
			mtc1 $s0, $f4		#en el bucle
			cvt.s.w $f6, $f4
			
			mul.s $f2, $f6, $f6
			mul.s $f2, $f20. $f2
			mul.s $f4, $f22, $f6
			add.s $f2, $f4, $f2
			add.s $f2, $f2, $f24
			
			
			
			li	$v0,4	
			la	$a0,cad4	    
			syscall
			
			li	$v0,1
			move $a0,$s0
			syscall
			
			li	$v0,4	
			la	$a0,cad5	    
			syscall
			
			mov.s $f12, $f2
			li $v0,2
			syscall
			
			li	$v0,4	
			la	$a0,cad6	    
			syscall
			
			add $s0, $s0, 1
			
			b while
	endw:	li $v0, 10
			syscall

	