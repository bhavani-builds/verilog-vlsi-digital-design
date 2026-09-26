// ============================================================
// VERILOG VLSI DIGITAL DESIGN
// STEP 1: BASIC LOGIC GATES
// ============================================================

module logic_gates (
    input  wire A,
    input  wire B,

    output wire AND_OUT,
    output wire OR_OUT,
    output wire NOT_OUT,
    output wire NAND_OUT,
    output wire NOR_OUT,
    output wire XOR_OUT,
    output wire XNOR_OUT
);

    // AND gate
    assign AND_OUT = A & B;

    // OR gate
    assign OR_OUT = A | B;

    // NOT gate
    assign NOT_OUT = ~A;

    // NAND gate
    assign NAND_OUT = ~(A & B);

    // NOR gate
    assign NOR_OUT = ~(A | B);

    // XOR gate
    assign XOR_OUT = A ^ B;

    // XNOR gate
    assign XNOR_OUT = ~(A ^ B);

endmodule
