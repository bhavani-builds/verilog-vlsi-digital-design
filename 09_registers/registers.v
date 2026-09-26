// ============================================================
// VERILOG VLSI DIGITAL DESIGN
// STEP 9: 4-BIT REGISTER
// ============================================================

module register_4bit (
    input wire clk,
    input wire reset,
    input wire load,

    input wire [3:0] D,

    output reg [3:0] Q
);

    always @(posedge clk or posedge reset) begin

        if (reset) begin

            Q <= 4'b0000;

        end

        else if (load) begin

            Q <= D;

        end

    end

endmodule
