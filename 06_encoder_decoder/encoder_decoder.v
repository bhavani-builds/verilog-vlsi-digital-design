// ============================================================
// VERILOG VLSI DIGITAL DESIGN
// STEP 6: ENCODER AND DECODER
// ============================================================


// ============================================================
// 2-to-4 DECODER
// ============================================================

module decoder_2to4 (
    input  wire [1:0] A,
    input  wire EN,

    output reg [3:0] Y
);

    always @(*) begin

        // Default output
        Y = 4'b0000;

        if (EN) begin

            case (A)

                2'b00:
                    Y = 4'b0001;

                2'b01:
                    Y = 4'b0010;

                2'b10:
                    Y = 4'b0100;

                2'b11:
                    Y = 4'b1000;

                default:
                    Y = 4'b0000;

            endcase

        end

    end

endmodule


// ============================================================
// 4-to-2 ENCODER
// ============================================================

module encoder_4to2 (
    input wire [3:0] I,

    output reg [1:0] Y,
    output reg VALID
);

    always @(*) begin

        Y = 2'b00;
        VALID = 1'b1;

        case (I)

            4'b0001:
                Y = 2'b00;

            4'b0010:
                Y = 2'b01;

            4'b0100:
                Y = 2'b10;

            4'b1000:
                Y = 2'b11;

            default: begin
                Y = 2'b00;
                VALID = 1'b0;
            end

        endcase

    end

endmodule
