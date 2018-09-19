// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@R2
	M = 0
(LOOP)
	@R1 			//M recebe Registrador R1
		D = M		//D recebe Registrador M
	@END			//Chama o rotulo end caso R1 seja igual a 0
		D;JEQ		//Pula diretamente para o rotulo end
	@R0         	//Registrador M recebe o valor de R0
		D = M       //Registrador D recebe o valor de M
	@R2         	//Registrador M recebe o valor de R2
		M = D + M   //Registrador M recebe a soma de do valor que esta em D mais o valor que esta em M
	@R1         	//Registrador M recebe o valor de R1
		M = M - 1   //Registrador M e decrementado de uma unidade
		D = M		//Registrador D recebe o valor do Registrador M
	@LOOP			//Chama o rotulo realizando uma recurção
		D;JGT   	//Checa se M e maior que 0
		
(END) //Loop infinitl para evitar o programa executar lixo de memoria
	@END
		0;JMP