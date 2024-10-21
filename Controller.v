`timescale 1ns / 1ps

module Controller(Instruction, RegWrite, ALUSrc, RegDst, MemWrite, MemRead,
Branch,MemToReg,Jump, ALUOp);

    input [31:0] Instruction;
    
    output reg RegWrite, ALUSrc, RegDst, MemWrite, MemRead, Branch, MemToReg, Jump;
    output reg [1:0]ALUOp;
    
    always@(Instruction) begin
    case(Instruction[31:26])
    6'b000000 : begin // R-type instructions
    ALUSrc <= 0;
    RegDst <= 1;
    MemWrite <= 0;
    MemRead <= 0;
    Branch <= 0;
    MemToReg <= 1;
    Jump <= 0;
    RegWrite <= 1;
    ALUOp <= 10;
    end
    
    6'b000100: begin
    ALUSrc <= 0;
    RegDst <= 0;
    MemWrite <= 0;
    MemRead <= 0;
    Branch <= 1;
    MemToReg <= 1;
    Jump <= 0;
    RegWrite <= 1;
    ALUOp <= 01;
    end
    
    6'b100011: begin
    ALUSrc <= 1;
    RegDst <= 0;
    MemWrite <= 0;
    MemRead <= 1;
    Branch <= 0;
    MemToReg <= 1;
    Jump <= 0;
    RegWrite <= 1;
    ALUOp <= 00;
    end
    
    6'b101011: begin
    ALUSrc <= 1;
    RegDst <= 0;
    MemWrite <= 1;
    MemRead <= 0;
    Branch <= 0;
    MemToReg <= 1;
    Jump <= 0;
    RegWrite <= 1;
    ALUOp <= 00;
    end
    
    endcase
    end
    
endmodule
    
