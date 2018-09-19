// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
//Colocando o ultimo indice da tela na variavel fim
@24575 		//Posição do registrador
	D = A	//Registrador D recebe posição de memoria 24575	
@FIM		//Variavel fim
	M = D	//Variavel fim recebe o registrador D

(APAGAR)
@SCREEN
	D = A
@CONT
	M = D			//CONT recebe o valor de SCREEN

(MANTER_APAGADO)
@KBD
	D = M
@IMPRIMIR
	D;JNE			//Se valor to teclado for maior que 0
@FIM
	D = M
@CONT
	D = D - M  		//D = FIM - CONT
@MANTER_APAGADO
	D; JLT			//if CONT > FIM then goto MANTER_APAGADO
@CONT
	A = M			
	M = 0
@CONT
	M = M + 1		//Adiciona 1 ao contador
@MANTER_APAGADO
	0; JMP

(IMPRIMIR)
@SCREEN
	D = A
@CONT
	M = D
	
(MANTER_IMPRIMIDO)
@KBD
	D = M
@APAGAR
	D; JEQ		   	//Se o valor de teclado for = 0 pular para rotulo apagar
@FIM
	D = M
@CONT
	D = D - M
@MANTER_IMPRIMIDO
	D; JLT			// Se contador for menor que 0 pula para o rotulo manter imprimido
@CONT
	A = M
	M = -1
@CONT
	M = M + 1
@MANTER_IMPRIMIDO
	D; JMP 			//Pular para rotulo manter imprimido