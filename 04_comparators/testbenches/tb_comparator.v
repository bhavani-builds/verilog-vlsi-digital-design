// ============================================================
// TESTBENCH: 4-BIT MAGNITUDE COMPARATOR
// ============================================================

`timescale 1ns/1ps

module tb_comparator;

    reg [3:0] A;
    reg [3:0] B;

    wire A_GREATER;
    wire A_EQUAL;
    wire A_LESS;


    // ========================================================
    // DUT
    // ========================================================

    comparator_4bit DUT (
        .A(A),
        .B(B),

        .A_GREATER(A_GREATER),
        .A_EQUAL(A_EQUAL),
        .A_LESS(A_LESS)
    );


    // ========================================================
    // TEST
    // ========================================================

    initial begin

        $display("");
        $display("================================================");
        $display("             4-BIT COMPARATOR TEST");
        $display("================================================");

        $display(
            " A     B    | A>B   A=B   A<B"
        );

        $display(
            "--------------------------------"
        );


        // Test 1
        A = 4'b0000;
        B = 4'b0000;
        #10;

        $display(
            "%b   %b   |  %b     %b     %b",
            A,
            B,
            A_GREATER,
            A_EQUAL,
            A_LESS
        );


        // Test 2
        A = 4'b0101;
        B = 4'b0011;
        #10;

        $display(
            "%b   %b   |  %b     %b     %b",
            A,
            B,
            A_GREATER,
            A_EQUAL,
            A_LESS
        );


        // Test 3
        A = 4'b0010;
        B = 4'b0110;
        #10;

        $display(
            "%b   %b   |  %b     %b     %b",
            A,
            B,
            A_GREATER,
            A_EQUAL,
            A_LESS
        );


        // Test 4
        A = 4'b1111;
        B = 4'b0001;
        #10;

        $display(
            "%b   %b   |  %b     %b     %b",
            A,
            B,
            A_GREATER,
            A_EQUAL,
            A_LESS
        );


        // Test 5
        A = 4'b1000;
        B = 4'b1000;
        #10;

        $display(
            "%b   %b   |  %b     %b     %b",
            A,
            B,
            A_GREATER,
            A_EQUAL,
            A_LESS
        );


        // Test 6
        A = 4'b0011;
        B = 4'b1010;
        #10;

        $display(
            "%b   %b   |  %b     %b     %b",
            A,
            B,
            A_GREATER,
            A_EQUAL,
            A_LESS
        );


        $display("");
        $display("================================================");
        $display("          COMPARATOR TEST COMPLETED");
        $display("================================================");

        $finish;

    end

endmodule
