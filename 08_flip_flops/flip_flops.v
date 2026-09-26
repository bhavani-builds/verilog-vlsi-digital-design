// ============================================================
// VERILOG VLSI DIGITAL DESIGN
// STEP 8: FLIP-FLOPS
// SR, D, JK AND T FLIP-FLOPS
// ============================================================


// ============================================================
// SR FLIP-FLOP
// ============================================================

module sr_flip_flop (
    input wire clk,
    input wire reset,
    input wire S,
    input wire R,

    output reg Q
);

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            Q <= 1'b0;
        end

        else begin

            case ({S, R})

                2'b00:
                    Q <= Q;       // HOLD

                2'b01:
                    Q <= 1'b0;    // RESET

                2'b10:
                    Q <= 1'b1;    // SET

                2'b11:
                    Q <= 1'bx;    // INVALID

                default:
                    Q <= 1'b0;

            endcase

        end

    end

endmodule


// ============================================================
// D FLIP-FLOP
// ============================================================

module d_flip_flop (
    input wire clk,
    input wire reset,
    input wire D,

    output reg Q
);

    always @(posedge clk or posedge reset) begin

        if (reset)
            Q <= 1'b0;

        else
            Q <= D;

    end

endmodule


// ============================================================
// JK FLIP-FLOP
// ============================================================

module jk_flip_flop (
    input wire clk,
    input wire reset,
    input wire J,
    input wire K,

    output reg Q
);

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            Q <= 1'b0;
        end

        else begin

            case ({J, K})

                2'b00:
                    Q <= Q;       // HOLD

                2'b01:
                    Q <= 1'b0;    // RESET

                2'b10:
                    Q <= 1'b1;    // SET

                2'b11:
                    Q <= ~Q;      // TOGGLE

                default:
                    Q <= 1'b0;

            endcase

        end

    end

endmodule


// ============================================================
// T FLIP-FLOP
// ============================================================

module t_flip_flop (
    input wire clk,
    input wire reset,
    input wire T,

    output reg Q
);

    always @(posedge clk or posedge reset) begin

        if (reset)
            Q <= 1'b0;

        else if (T)
            Q <= ~Q;

        else
            Q <= Q;

    end

endmodule
