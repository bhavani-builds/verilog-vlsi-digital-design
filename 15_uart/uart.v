// ============================================================
// VERILOG VLSI DIGITAL DESIGN
// STEP 15: UART TRANSMITTER
//
// UART Configuration:
// Data       = 8 bits
// Start bit  = 1 bit
// Stop bit   = 1 bit
// Data order = LSB first
// ============================================================

module uart_tx #(
    parameter CLK_FREQ  = 10_000_000,
    parameter BAUD_RATE = 1_000_000
)(
    input wire clk,
    input wire reset,

    input wire start,
    input wire [7:0] data_in,

    output reg tx,
    output reg busy,
    output reg done
);

    // Number of clock cycles required for one UART bit
    localparam integer CLKS_PER_BIT = CLK_FREQ / BAUD_RATE;

    // Counters
    reg [31:0] baud_counter;
    reg [3:0]  bit_counter;

    // Data register
    reg [7:0] data_reg;

    // UART states
    localparam IDLE  = 2'b00;
    localparam START = 2'b01;
    localparam DATA  = 2'b10;
    localparam STOP  = 2'b11;

    reg [1:0] state;

    always @(posedge clk or posedge reset) begin

        if (reset) begin

            tx           <= 1'b1;
            busy         <= 1'b0;
            done         <= 1'b0;

            baud_counter <= 32'd0;
            bit_counter  <= 4'd0;
            data_reg     <= 8'd0;

            state        <= IDLE;

        end

        else begin

            // done is a one-clock pulse
            done <= 1'b0;

            case (state)

                // ------------------------------------------------
                // IDLE
                // ------------------------------------------------
                IDLE: begin

                    tx           <= 1'b1;
                    busy         <= 1'b0;
                    baud_counter <= 32'd0;
                    bit_counter  <= 4'd0;

                    if (start) begin

                        data_reg <= data_in;

                        busy <= 1'b1;

                        // Start bit
                        tx <= 1'b0;

                        state <= START;

                    end

                end

                // ------------------------------------------------
                // START BIT
                // ------------------------------------------------
                START: begin

                    if (baud_counter == CLKS_PER_BIT - 1) begin

                        baud_counter <= 32'd0;

                        // First data bit
                        tx <= data_reg[0];

                        bit_counter <= 4'd0;

                        state <= DATA;

                    end

                    else begin

                        baud_counter <= baud_counter + 1'b1;

                    end

                end

                // ------------------------------------------------
                // DATA BITS
                // ------------------------------------------------
                DATA: begin

                    if (baud_counter == CLKS_PER_BIT - 1) begin

                        baud_counter <= 32'd0;

                        if (bit_counter == 4'd7) begin

                            // All 8 data bits transmitted
                            tx <= 1'b1;

                            state <= STOP;

                        end

                        else begin

                            bit_counter <= bit_counter + 1'b1;

                            // Shift to next data bit
                            data_reg <= {
                                1'b0,
                                data_reg[7:1]
                            };

                            tx <= data_reg[1];

                        end

                    end

                    else begin

                        baud_counter <= baud_counter + 1'b1;

                    end

                end

                // ------------------------------------------------
                // STOP BIT
                // ------------------------------------------------
                STOP: begin

                    if (baud_counter == CLKS_PER_BIT - 1) begin

                        baud_counter <= 32'd0;

                        tx <= 1'b1;

                        busy <= 1'b0;

                        done <= 1'b1;

                        state <= IDLE;

                    end

                    else begin

                        baud_counter <= baud_counter + 1'b1;

                    end

                end

                default: begin

                    state <= IDLE;

                    tx <= 1'b1;

                    busy <= 1'b0;

                end

            endcase

        end

    end

endmodule
