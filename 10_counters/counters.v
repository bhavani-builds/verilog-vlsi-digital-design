// ============================================================
// VERILOG VLSI DIGITAL DESIGN
// STEP 10: 4-BIT SYNCHRONOUS UP/DOWN COUNTER
// ============================================================

module counter_4bit (
    input wire clk,
    input wire reset,
    input wire enable,
    input wire up_down,

    output reg [3:0] count
);

    always @(posedge clk or posedge reset) begin

        if (reset) begin

            count <= 4'b0000;

        end

        else if (enable) begin

            if (up_down) begin

                // Count UP
                count <= count + 4'b0001;

            end

            else begin

                // Count DOWN
                count <= count - 4'b0001;

            end

        end

    end

endmodule
