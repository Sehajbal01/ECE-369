`timescale 1ns / 1ps

module Controller(Instruction, RegWrite, ALUSrc, RegDst, MemWrite, MemRead,
Branch,MemToReg, ALUOp, ControlWriteSrc);

    input [31:0] Instruction;
    
    output reg RegWrite, ALUSrc, RegDst, MemWrite, MemRead, Branch, MemToReg;
    output reg [1:0] ControlWriteSrc;
    output reg [3:0] ALUOp;
    
    always@(Instruction) begin
    
    ALUSrc <= 0; //Base R-Type instructions
    RegDst <= 1;
    MemWrite <= 0;
    MemRead <= 0;
    Branch <= 0;
    MemToReg <= 1;
    RegWrite <= 1;
    ALUOp <= 4'b0010;
    ControlWriteSrc <= 2'b00;
    
    case(Instruction[31:26])
    
    6'b001000: begin //addi Instruction
    ALUSrc <= 1;
    RegDst <= 1;
    MemWrite <= 0;
    MemRead <= 0;
    Branch <= 0;
    MemToReg <= 1;
    RegWrite <= 1;
    ALUOp <= 4'b0010;
    ControlWriteSrc <= 2'b00;
    end
    
    6'b001100: begin //andi instruction
    ALUSrc <= 1;
    RegDst <= 1;
    MemWrite <= 0;
    MemRead <= 0;
    Branch <= 0;
    MemToReg <= 1;
    RegWrite <= 1;
    ALUOp <= 4'b0010;
    ControlWriteSrc <= 2'b00;
    end
    
    6'b001101: begin //ori instruction
    ALUSrc <= 1;
    RegDst <= 1;
    MemWrite <= 0;
    MemRead <= 0;
    Branch <= 0;
    MemToReg <= 1;
    RegWrite <= 1;
    ALUOp <= 4'b0010;
    ControlWriteSrc <= 2'b00;
    end
    
    6'b001110: begin //xori instruction
    ALUSrc <= 1;
    RegDst <= 1;
    MemWrite <= 0;
    MemRead <= 0;
    Branch <= 0;
    MemToReg <= 1;
    RegWrite <= 1;
    ALUOp <= 4'b0010;
    ControlWriteSrc <= 2'b00;
    end
    
    6'b001010: begin //slti instruction
    ALUSrc <= 1;
    RegDst <= 1;
    MemWrite <= 0;
    MemRead <= 0;
    Branch <= 0;
    MemToReg <= 1;
    RegWrite <= 1;
    ALUOp <= 4'b0010;
    ControlWriteSrc <= 2'b00;
    end
    
    6'b000100: begin //beq instruction
    ALUSrc <= 0; 
    RegDst <= 0;
    MemWrite <= 0;
    MemRead <= 0;
    Branch <= 1; 
    MemToReg <= 0;
    RegWrite <= 0;
    ALUOp <= 4'b0001;
    ControlWriteSrc <= 2'b00;
    end
    
    6'b000101: begin //bne instruction
    ALUSrc <= 0; 
    RegDst <= 0;
    MemWrite <= 0;
    MemRead <= 0;
    Branch <= 1; 
    MemToReg <= 0;
    RegWrite <= 0;
    ALUOp <= 4'b0011;
    ControlWriteSrc <= 2'b00;
    end
    
    6'b000111: begin //bgtz instruction
    ALUSrc <= 0; 
    RegDst <= 0;
    MemWrite <= 0;
    MemRead <= 0;
    Branch <= 1; 
    MemToReg <= 0;
    RegWrite <= 0;
    ALUOp <= 4'b0100;
    ControlWriteSrc <= 2'b00;
    end
    
    6'b000110: begin //blez instruction
    ALUSrc <= 0; 
    RegDst <= 0;
    MemWrite <= 0;
    MemRead <= 0;
    Branch <= 1; 
    MemToReg <= 0;
    RegWrite <= 0;
    ALUOp <= 4'b0101;
    ControlWriteSrc <= 2'b00;
    end
    
    6'b000001: begin // bgez and bltz instruction
    ALUSrc <= 0; 
    RegDst <= 0;
    MemWrite <= 0;
    MemRead <= 0;
    Branch <= 1; 
    MemToReg <= 0;
    RegWrite <= 0;
    ALUOp <= 4'b0110;
    ControlWriteSrc <= 2'b00;
    end
    
    6'b100011: begin // lw instruction
    ALUSrc <= 1;
    RegDst <= 0;
    MemWrite <= 0;
    MemRead <= 1;
    Branch <= 0;
    MemToReg <= 1;
    RegWrite <= 1;
    ALUOp <= 4'b0000;
    ControlWriteSrc <= 2'b00;
    end
    
    6'b101011: begin // sw instruction
    ALUSrc <= 1;
    RegDst <= 0;
    MemWrite <= 1;
    MemRead <= 0;
    Branch <= 0;
    MemToReg <= 1;
    RegWrite <= 0;
    ALUOp <= 4'b0000;
    ControlWriteSrc <= 2'b00;
    end
    
    6'b101000: begin // sb instruction
    ALUSrc <= 1;
    RegDst <= 0;
    MemWrite <= 1;
    MemRead <= 0;
    Branch <= 0;
    MemToReg <= 1;
    RegWrite <= 0;
    ALUOp <= 4'b0000;
    ControlWriteSrc <= 2'b10;
    end
    
    6'b100000: begin // lb instruction
    ALUSrc <= 1;
    RegDst <= 0;
    MemWrite <= 0;
    MemRead <= 1;
    Branch <= 0;
    MemToReg <= 1;
    RegWrite <= 1;
    ALUOp <= 4'b0000;
    ControlWriteSrc <= 2'b10;
    end
    
    6'b101001: begin // sh instruction
    ALUSrc <= 1;
    RegDst <= 0;
    MemWrite <= 1;
    MemRead <= 0;
    Branch <= 0;
    MemToReg <= 1;
    RegWrite <= 0;
    ALUOp <= 4'b0000;
    ControlWriteSrc <= 2'b01;
    end
    
    6'b100001: begin // lh instruction
    ALUSrc <= 1;
    RegDst <= 0;
    MemWrite <= 0;
    MemRead <= 1;
    Branch <= 0;
    MemToReg <= 1;
    RegWrite <= 1;
    ALUOp <= 4'b0000;
    ControlWriteSrc <= 2'b01;
    end
    
    //ignore jump for now
    
    6'b000011: begin //jal
    ALUSrc <= 1;
    RegDst <= 0;
    MemWrite <= 0;
    MemRead <= 0;
    Branch <= 1;
    MemToReg <= 0;
    RegWrite <= 1;
    ALUOp <= 4'b0000;
    ControlWriteSrc <= 2'b01;
    end
    
    6'b000010: begin //j
    ALUSrc <= 1;
    RegDst <= 0;
    MemWrite <= 0;
    MemRead <= 1;
    Branch <= 0;
    MemToReg <= 1;
    RegWrite <= 1;
    ALUOp <= 4'b0000;
    ControlWriteSrc <= 2'b01;
    end
    //need to add the jump instructions
    
   
    
    
    
    
    endcase
    end
    
endmodule
    
