module ALU_Decoder(
    input [1:0] ALUOp,
    input [2:0] funct3,
    input [6:0] funct7,
    input [6:0] op,
    output reg [2:0] ALUControl
);

    always @* begin
        case(ALUOp)
            2'b00: ALUControl = 3'b000; // LW/SW/ADDI - ADD
            2'b01: ALUControl = 3'b001; // Branch - SUB
            2'b10: begin // R-type/I-type ALU operations
                case(funct3)
                    3'b000: begin // ADD/SUB
                        if (op == 7'b0110011 && funct7[5] == 1'b1) // SUB
                            ALUControl = 3'b001;
                        else // ADD/ADDI
                            ALUControl = 3'b000;
                    end
                    3'b001: ALUControl = 3'b100; // SLL
                    3'b010: ALUControl = 3'b101; // SLT
                    3'b011: ALUControl = 3'b110; // SLTU
                    3'b100: ALUControl = 3'b010; // XOR
                    3'b101: begin // SRL/SRA
                        if (funct7[5] == 1'b1) // SRA
                            ALUControl = 3'b111;
                        else // SRL
                            ALUControl = 3'b011;
                    end
                    3'b110: ALUControl = 3'b011; // OR
                    3'b111: ALUControl = 3'b010; // AND
                    default: ALUControl = 3'b000;
                endcase
            end
            default: ALUControl = 3'b000;
        endcase
    end

endmodule