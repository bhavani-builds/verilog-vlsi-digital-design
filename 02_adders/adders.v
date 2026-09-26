// ============================================================
// VERILOG VLSI DIGITAL DESIGN
// STEP 2: HALF ADDER AND FULL ADDER
// ============================================================


// ============================================================
// HALF ADDER
// ============================================================

module half_adder (
    input  wire A,
    input  wire B,

    output wire SUM,
    output wire CARRY
);

    assign SUM   = A ^ B;
    assign CARRY = A & B;

endmodule


// ============================================================
// FULL ADDER
// ============================================================

module full_adder (
    input  wire A,
    input  wire B,
    input  wire CIN,

    output wire SUM,
    output wire COUT
);

    assign SUM = A ^ B ^ CIN;

    assign COUT =
        (A & B) |
        (B & CIN) |
        (A & CIN);

endmodule
