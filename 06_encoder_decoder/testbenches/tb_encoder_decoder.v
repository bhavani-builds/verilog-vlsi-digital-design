// ============================================================
// TESTBENCH: ENCODER AND DECODER
// ============================================================

`timescale 1ns/1ps

module tb_encoder_decoder;

    // ========================================================
    // DECODER SIGNALS
    // ========================================================

    reg [1:0] A;
    reg EN;

    wire [3:0] DECODER_Y;


    // ========================================================
    // ENCODER SIGNALS
    // ========================================================

    reg [3:0] I;

    wire [1:0] ENCODER_Y;
    wire VALID;


    // ========================================================
    // DECODER DUT
    // ========================================================

    decoder_2to4 DECODER_DUT (
        .A(A),
        .EN(EN),
        .Y(DECODER_Y)
    );


    // ========================================================
    // ENCODER DUT
    // ========================================================

    encoder_4to2 ENCODER_DUT (
        .I(I),
        .Y(ENCODER_Y),
        .VALID(VALID)
    );


    // ========================================================
    // TEST
    // ========================================================

    initial begin

        // ----------------------------------------------------
        // DECODER TEST
        // ----------------------------------------------------

        $display("");
        $display("================================================");
        $display("              2-to-4 DECODER TEST");
        $display("================================================");

        $display(
            "EN A1 A0 | Y3 Y2 Y1 Y0"
        );

        $display(
            "-----------------------"
        );


        EN = 1;
        A = 2'b00;
        #10;

        $display(
            " %b  %b  %b |  %b  %b  %b  %b",
            EN,
            A[1],
            A[0],
            DECODER_Y[3],
            DECODER_Y[2],
            DECODER_Y[1],
            DECODER_Y[0]
        );


        A = 2'b01;
        #10;

        $display(
            " %b  %b  %b |  %b  %b  %b  %b",
            EN,
            A[1],
            A[0],
            DECODER_Y[3],
            DECODER_Y[2],
            DECODER_Y[1],
            DECODER_Y[0]
        );


        A = 2'b10;
        #10;

        $display(
            " %b  %b  %b |  %b  %b  %b  %b",
            EN,
            A[1],
            A[0],
            DECODER_Y[3],
            DECODER_Y[2],
            DECODER_Y[1],
            DECODER_Y[0]
        );


        A = 2'b11;
        #10;

        $display(
            " %b  %b  %b |  %b  %b  %b  %b",
            EN,
            A[1],
            A[0],
            DECODER_Y[3],
            DECODER_Y[2],
            DECODER_Y[1],
            DECODER_Y[0]
        );


        // Disable decoder
        EN = 0;
        A = 2'b10;
        #10;

        $display(
            " %b  %b  %b |  %b  %b  %b  %b",
            EN,
            A[1],
            A[0],
            DECODER_Y[3],
            DECODER_Y[2],
            DECODER_Y[1],
            DECODER_Y[0]
        );


        // ----------------------------------------------------
        // ENCODER TEST
        // ----------------------------------------------------

        $display("");
        $display("================================================");
        $display("              4-to-2 ENCODER TEST");
        $display("================================================");

        $display(
            "I3 I2 I1 I0 | Y1 Y0 | VALID"
        );

        $display(
            "----------------------------"
        );


        I = 4'b0001;
        #10;

        $display(
            " %b  %b  %b  %b |  %b  %b |   %b",
            I[3],
            I[2],
            I[1],
            I[0],
            ENCODER_Y[1],
            ENCODER_Y[0],
            VALID
        );


        I = 4'b0010;
        #10;

        $display(
            " %b  %b  %b  %b |  %b  %b |   %b",
            I[3],
            I[2],
            I[1],
            I[0],
            ENCODER_Y[1],
            ENCODER_Y[0],
            VALID
        );


        I = 4'b0100;
        #10;

        $display(
            " %b  %b  %b  %b |  %b  %b |   %b",
            I[3],
            I[2],
            I[1],
            I[0],
            ENCODER_Y[1],
            ENCODER_Y[0],
            VALID
        );


        I = 4'b1000;
        #10;

        $display(
            " %b  %b  %b  %b |  %b  %b |   %b",
            I[3],
            I[2],
            I[1],
            I[0],
            ENCODER_Y[1],
            ENCODER_Y[0],
            VALID
        );


        // Invalid input
        I = 4'b0000;
        #10;

        $display(
            " %b  %b  %b  %b |  %b  %b |   %b",
            I[3],
            I[2],
            I[1],
            I[0],
            ENCODER_Y[1],
            ENCODER_Y[0],
            VALID
        );


        $display("");
        $display("================================================");
        $display("       ENCODER / DECODER TEST COMPLETED");
        $display("================================================");

        $finish;

    end

endmodule
