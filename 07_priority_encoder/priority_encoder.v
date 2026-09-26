// ============================================================
// VERILOG VLSI DIGITAL DESIGN
// STEP 7: 4-to-2 PRIORITY ENCODER
// ============================================================

module priority_encoder_4to2 (
    input  wire [3:0] I,

    output reg [1:0] Y,
    output reg VALID
);

    always @(*) begin

        // Default values
        Y = 2'b00;
        VALID = 1'b0;

        // Highest priority: I3
        if (I[3] == 1'b1) begin

            Y = 2'b11;
            VALID = 1'b1;

        end

        // Second priority: I2
        else if (I[2] == 1'b1) begin

            Y = 2'b10;
            VALID = 1'b1;

        end

        // Third priority: I1
        else if (I[1] == 1'b1) begin

            Y = 2'b01;
            VALID = 1'b1;

        end

        // Lowest priority: I0
        else if (I[0] == 1'b1) begin

            Y = 2'b00;
            VALID = 1'b1;

        end

    end

endmodule
