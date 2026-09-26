// ============================================================
// VERILOG VLSI DIGITAL DESIGN
// STEP 4: 4-BIT MAGNITUDE COMPARATOR
// ============================================================

module comparator_4bit (
    input  wire [3:0] A,
    input  wire [3:0] B,

    output wire A_GREATER,
    output wire A_EQUAL,
    output wire A_LESS
);

    // A > B
    assign A_GREATER = (A > B);

    // A == B
    assign A_EQUAL = (A == B);

    // A < B
    assign A_LESS = (A < B);

endmodule
