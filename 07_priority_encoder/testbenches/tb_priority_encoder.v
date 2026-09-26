// ============================================================
// TESTBENCH: 4-to-2 PRIORITY ENCODER
// ============================================================

`timescale 1ns/1ps

module tb_priority_encoder;

    reg [3:0] I;

    wire [1:0] Y;
    wire VALID;


    // ========================================================
    // DUT
    // ========================================================

    priority_encoder_4to2 DUT (
        .I(I),
        .Y(Y),
        .VALID(VALID)
    );


    // ========================================================
    // TEST
    // ========================================================

    initial begin

        $display("");
        $display("================================================");
        $display("          4-to-2 PRIORITY ENCODER");
        $display("================================================");

        $display(
            "I3 I2 I1 I0 | Y1 Y0 | VALID"
        );

        $display(
            "----------------------------"
        );


        // No input active
        I = 4'b0000;
        #10;

        $display(
            " %b  %b  %b  %b |  %b  %b |   %b",
            I[3],
            I[2],
            I[1],
            I[0],
            Y[1],
            Y[0],
            VALID
        );


        // I0 active
        I = 4'b0001;
        #10;

        $display(
            " %b  %b  %b  %b |  %b  %b |   %b",
            I[3],
            I[2],
            I[1],
            I[0],
            Y[1],
            Y[0],
            VALID
        );


        // I1 active
        I = 4'b0010;
        #10;

        $display(
            " %b  %b  %b  %b |  %b  %b |   %b",
            I[3],
            I[2],
            I[1],
            I[0],
            Y[1],
            Y[0],
            VALID
        );


        // I2 active
        I = 4'b0100;
        #10;

        $display(
            " %b  %b  %b  %b |  %b  %b |   %b",
            I[3],
            I[2],
            I[1],
            I[0],
            Y[1],
            Y[0],
            VALID
        );


        // I3 active
        I = 4'b1000;
        #10;

        $display(
            " %b  %b  %b  %b |  %b  %b |   %b",
            I[3],
            I[2],
            I[1],
            I[0],
            Y[1],
            Y[0],
            VALID
        );


        // I3 and I2 active
        // I3 wins
        I = 4'b1100;
        #10;

        $display(
            " %b  %b  %b  %b |  %b  %b |   %b",
            I[3],
            I[2],
            I[1],
            I[0],
            Y[1],
            Y[0],
            VALID
        );


        // I2 and I1 active
        // I2 wins
        I = 4'b0110;
        #10;

        $display(
            " %b  %b  %b  %b |  %b  %b |   %b",
            I[3],
            I[2],
            I[1],
            I[0],
            Y[1],
            Y[0],
            VALID
        );


        // All inputs active
        // I3 wins
        I = 4'b1111;
        #10;

        $display(
            " %b  %b  %b  %b |  %b  %b |   %b",
            I[3],
            I[2],
            I[1],
            I[0],
            Y[1],
            Y[0],
            VALID
        );


        $display("");
        $display("================================================");
        $display("       PRIORITY ENCODER TEST COMPLETED");
        $display("================================================");

        $finish;

    end

endmodule
