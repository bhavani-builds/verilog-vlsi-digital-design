// ============================================================
// VERILOG VLSI DIGITAL DESIGN
// STEP 3: HALF SUBTRACTOR AND FULL SUBTRACTOR
// ============================================================


// ============================================================
// HALF SUBTRACTOR
// ============================================================

module half_subtractor (
    input  wire A,
    input  wire B,

    output wire DIFFERENCE,
    output wire BORROW
);

    // Difference = A XOR B
    assign DIFFERENCE = A ^ B;

    // Borrow = A' . B
    assign BORROW = (~A) & B;

endmodule


// ============================================================
// FULL SUBTRACTOR
// ============================================================

module full_subtractor (
    input  wire A,
    input  wire B,
    input  wire BIN,

    output wire DIFFERENCE,
    output wire BOUT
);

    // Difference
    assign DIFFERENCE = A ^ B ^ BIN;

    // Borrow output
    assign BOUT =
        ((~A) & B) |
        ((~A) & BIN) |
        (B & BIN);

endmodule
