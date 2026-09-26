// ============================================================
// VERILOG VLSI DIGITAL DESIGN
// STEP 16: INTEGRATED RTL VLSI SYSTEM
//
// Integrated blocks:
// 1. ALU
// 2. Register
// 3. Counter
// 4. Status logic
//
// This top-level design demonstrates RTL integration.
// ============================================================

module vlsi_system (

    input wire clk,
    input wire reset,

    // ALU inputs
    input wire [3:0] A,
    input wire [3:0] B,

    // ALU operation
    input wire [2:0] OP,

    // Register control
    input wire load,

    // Counter control
    input wire enable,
    input wire up_down,

    // Outputs
    output wire [3:0] alu_result,
    output wire alu_carry,
    output wire alu_zero,

    output wire [3:0] registered_result,

    output wire [3:0] counter_value

);

    // ========================================================
    // ALU
    // ========================================================

    alu_4bit ALU (

        .A(A),
        .B(B),

        .OP(OP),

        .RESULT(alu_result),
        .CARRY(alu_carry),
        .ZERO(alu_zero)

    );


    // ========================================================
    // RESULT REGISTER
    // ========================================================

    register_4bit RESULT_REGISTER (

        .clk(clk),
        .reset(reset),

        .load(load),

        .D(alu_result),

        .Q(registered_result)

    );


    // ========================================================
    // COUNTER
    // ========================================================

    counter_4bit COUNTER (

        .clk(clk),
        .reset(reset),

        .enable(enable),
        .up_down(up_down),

        .count(counter_value)

    );

endmodule


// ============================================================
// 4-BIT ALU
// ============================================================

module alu_4bit (

    input wire [3:0] A,
    input wire [3:0] B,

    input wire [2:0] OP,

    output reg [3:0] RESULT,
    output reg CARRY,
    output reg ZERO

);

    reg [4:0] TEMP;

    always @(*) begin

        RESULT = 4'b0000;
        CARRY  = 1'b0;
        TEMP   = 5'b00000;

        case (OP)

            // ADD
            3'b000: begin

                TEMP = A + B;

                RESULT = TEMP[3:0];

                CARRY = TEMP[4];

            end


            // SUBTRACT
            3'b001: begin

                RESULT = A - B;

                CARRY = 1'b0;

            end


            // AND
            3'b010: begin

                RESULT = A & B;

            end


            // OR
            3'b011: begin

                RESULT = A | B;

            end


            // XOR
            3'b100: begin

                RESULT = A ^ B;

            end


            // NOT
            3'b101: begin

                RESULT = ~A;

            end


            // LEFT SHIFT
            3'b110: begin

                RESULT = A << 1;

            end


            // RIGHT SHIFT
            3'b111: begin

                RESULT = A >> 1;

            end


            default: begin

                RESULT = 4'b0000;

                CARRY = 1'b0;

            end

        endcase


        // ZERO FLAG

        if (RESULT == 4'b0000)

            ZERO = 1'b1;

        else

            ZERO = 1'b0;

    end

endmodule


// ============================================================
// 4-BIT REGISTER
// ============================================================

module register_4bit (

    input wire clk,
    input wire reset,
    input wire load,

    input wire [3:0] D,

    output reg [3:0] Q

);

    always @(posedge clk or posedge reset) begin

        if (reset)

            Q <= 4'b0000;

        else if (load)

            Q <= D;

    end

endmodule


// ============================================================
// 4-BIT SYNCHRONOUS UP/DOWN COUNTER
// ============================================================

module counter_4bit (

    input wire clk,
    input wire reset,

    input wire enable,
    input wire up_down,

    output reg [3:0] count

);

    always @(posedge clk or posedge reset) begin

        if (reset)

            count <= 4'b0000;

        else if (enable) begin

            if (up_down)

                count <= count + 4'b0001;

            else

                count <= count - 4'b0001;

        end

    end

endmodule
