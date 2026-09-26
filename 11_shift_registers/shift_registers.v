// ============================================================
// VERILOG VLSI DIGITAL DESIGN
// STEP 11: SHIFT REGISTERS
// SISO, SIPO, PISO AND PIPO
// ============================================================


// ============================================================
// SISO
// SERIAL IN -> SERIAL OUT
// ============================================================

module siso_register (
    input wire clk,
    input wire reset,
    input wire serial_in,

    output wire serial_out
);

    reg [3:0] shift_reg;

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            shift_reg <= 4'b0000;
        end

        else begin
            shift_reg <= {
                shift_reg[2:0],
                serial_in
            };
        end

    end

    assign serial_out = shift_reg[3];

endmodule


// ============================================================
// SIPO
// SERIAL IN -> PARALLEL OUT
// ============================================================

module sipo_register (
    input wire clk,
    input wire reset,
    input wire serial_in,

    output reg [3:0] parallel_out
);

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            parallel_out <= 4'b0000;
        end

        else begin
            parallel_out <= {
                parallel_out[2:0],
                serial_in
            };
        end

    end

endmodule


// ============================================================
// PISO
// PARALLEL IN -> SERIAL OUT
// ============================================================

module piso_register (
    input wire clk,
    input wire reset,
    input wire load,

    input wire [3:0] parallel_in,

    output wire serial_out
);

    reg [3:0] shift_reg;

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            shift_reg <= 4'b0000;
        end

        else if (load) begin
            shift_reg <= parallel_in;
        end

        else begin
            shift_reg <= {
                shift_reg[2:0],
                1'b0
            };
        end

    end

    assign serial_out = shift_reg[3];

endmodule


// ============================================================
// PIPO
// PARALLEL IN -> PARALLEL OUT
// ============================================================

module pipo_register (
    input wire clk,
    input wire reset,
    input wire load,

    input wire [3:0] parallel_in,

    output reg [3:0] parallel_out
);

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            parallel_out <= 4'b0000;
        end

        else if (load) begin
            parallel_out <= parallel_in;
        end

    end

endmodule
