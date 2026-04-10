module alu(
    input  logic [31:0] op1,
    input  logic [31:0] op2,
    input  logic [3:0]  ALUControl,
    output logic [31:0] result,
    output logic        zero
);

    // TODO: Implement ALU behavior for the required control codes.
    // Required operations:
    // - ADD, SUB, AND, OR, XOR
    // - SLL, SRL, SRA
    // - SLT, SLTU
    always_comb begin
        unique case (ALUControl)
            0: result = op1 + op2;
            1: result = op1 - op2;
            2: result = op1 & op2;
            3: result = op1 | op2;
            4: result = op1 ^ op2;
            5: result = op1 << op2;
            6: result = op1 >> op2;
            7: result = op1 >>> op2;
            8: result = 32'(op1 < op2);
            9: result = 32'($signed(op1) < $signed(op2));
            default: result = 0;
        endcase
    end

    // You may keep a PASS-B code for future use if you find it helpful.

    // TODO: Drive zero high when result == 0.
    assign zero = (result == 0);

endmodule
