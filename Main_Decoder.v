module Main_Decoder(
    input  [6:0] Op,
    output       RegWrite,
    output [1:0] ImmSrc,
    output       ALUSrc,
    output       MemWrite,
    output [1:0] ResultSrc,
    output       Branch,
    output       jump,
    output [1:0] ALUOp
);

    // enable write-back for LOAD, R-type, I-type ALU, JAL, JALR
    assign RegWrite = (Op == 7'b0000011   // LOAD
                    || Op == 7'b0110011   // R-type
                    || Op == 7'b0010011   // I-type ALU
                    || Op == 7'b1101111   // JAL
                    || Op == 7'b1100111)  // JALR
                  ? 1'b1
                  : 1'b0;

    // Modify ImmSrc assignment:
assign ImmSrc = (Op == 7'b0100011) ? 2'b01 :  // S-type (STORE)
                (Op == 7'b1100011) ? 2'b10 :  // B-type (BRANCH)
                (Op == 7'b1101111) ? 2'b11 :  // J-type (JAL)
                (Op == 7'b1100111) ? 2'b00 :  // I-type (JALR)
                2'b00;   // I-type (LOAD, I-ALU)

    // ALU source: immediate for LOAD, STORE, I-type ALU, and JALR
    assign ALUSrc = (Op == 7'b0000011   // LOAD
                   || Op == 7'b0100011   // STORE
                   || Op == 7'b0010011   // I-type ALU
                   || Op == 7'b1100111)  // JALR 
                 ? 1'b1
                 : 1'b0;

    assign MemWrite = (Op == 7'b0100011) ? 1'b1 : 1'b0;

    // select result source:
    assign ResultSrc = (Op == 7'b0000011) ? 2'b01 :   // LOAD
                       (Op == 7'b1101111) ? 2'b10 :   // JAL
                       (Op == 7'b1100111) ? 2'b10 :   // JALR
                                            2'b00;   // ALU default

    assign Branch = (Op == 7'b1100011) ? 1'b1 : 1'b0;

    // Jump signal for JAL and JALR
    assign jump = (Op == 7'b1101111 || Op == 7'b1100111) ? 1'b1 : 1'b0;

    
assign ALUOp = (Op == 7'b0110011) ? 2'b10 :  // R-type
               (Op == 7'b1100011) ? 2'b01 :  // BRANCH
               (Op == 7'b1101111 || Op == 7'b1100111) ? 2'b00 : // JAL/JALR - use ADD
               2'b00;   // default
endmodule
