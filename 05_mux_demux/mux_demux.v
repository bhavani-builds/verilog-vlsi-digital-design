// ============================================================
// VERILOG VLSI DIGITAL DESIGN
// STEP 5: MULTIPLEXER AND DEMULTIPLEXER
// ============================================================


// ============================================================
// 4-to-1 MULTIPLEXER
// ============================================================

module mux_4to1 (
    input  wire [3:0] I,
    input  wire [1:0] S,

    output reg Y
);

    always @(*) begin

        case (S)

            2'b00:
                Y = I[0];

            2'b01:
                Y = I[1];

            2'b10:
                Y = I[2];

            2'b11:
                Y = I[3];

            default:
                Y = 1'b0;

        endcase

    end

endmodule


// ============================================================
// 1-to-4 DEMULTIPLEXER
// ============================================================

module demux_1to4 (
    input  wire D,
    input  wire [1:0] S,

    output reg [3:0] Y
);

    always @(*) begin

        // Default output
        Y = 4'b0000;

        case (S)

            2'b00:
                Y[0] = D;

            2'b01:
                Y[1] = D;

            2'b10:
                Y[2] = D;

            2'b11:
                Y[3] = D;

            default:
                Y = 4'b0000;

        endcase

    end

endmodule
