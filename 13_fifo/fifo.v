// ============================================================
// VERILOG VLSI DIGITAL DESIGN
// STEP 13: SYNCHRONOUS FIFO
//
// FIFO Configuration:
// Depth = 4
// Width = 8 bits
// ============================================================

module fifo_4x8 (
    input wire clk,
    input wire reset,

    input wire write_en,
    input wire read_en,

    input wire [7:0] data_in,

    output reg [7:0] data_out,

    output wire full,
    output wire empty
);

    // ========================================================
    // FIFO MEMORY
    // ========================================================

    reg [7:0] memory [0:3];


    // ========================================================
    // READ AND WRITE POINTERS
    // ========================================================

    reg [1:0] write_ptr;
    reg [1:0] read_ptr;


    // Number of stored elements
    reg [2:0] count;


    // ========================================================
    // FIFO STATUS
    // ========================================================

    assign empty = (count == 3'd0);

    assign full = (count == 3'd4);


    // ========================================================
    // FIFO OPERATION
    // ========================================================

    always @(posedge clk or posedge reset) begin

        if (reset) begin

            write_ptr <= 2'b00;
            read_ptr  <= 2'b00;

            count <= 3'd0;

            data_out <= 8'b00000000;

        end

        else begin

            // =================================================
            // WRITE OPERATION
            // =================================================

            if (write_en && !full) begin

                memory[write_ptr] <= data_in;

                write_ptr <= write_ptr + 2'b01;

            end


            // =================================================
            // READ OPERATION
            // =================================================

            if (read_en && !empty) begin

                data_out <= memory[read_ptr];

                read_ptr <= read_ptr + 2'b01;

            end


            // =================================================
            // COUNT UPDATE
            // =================================================

            case ({
                write_en && !full,
                read_en && !empty
            })

                // Write only
                2'b10:
                    count <= count + 3'd1;

                // Read only
                2'b01:
                    count <= count - 3'd1;

                // No operation
                2'b00:
                    count <= count;

                // Read and write simultaneously
                2'b11:
                    count <= count;

                default:
                    count <= count;

            endcase

        end

    end

endmodule
