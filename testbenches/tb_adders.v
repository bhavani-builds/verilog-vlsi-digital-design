// ============================================================
// TESTBENCH: HALF ADDER AND FULL ADDER
// ============================================================

`timescale 1ns/1ps

module tb_adders;

    // ========================================================
    // HALF ADDER SIGNALS
    // ========================================================

    reg A;
    reg B;

    wire HA_SUM;
    wire HA_CARRY;


    // ========================================================
    // FULL ADDER SIGNALS
    // ========================================================

    reg CIN;

    wire FA_SUM;
    wire FA_COUT;


    // ========================================================
    // HALF ADDER DUT
    // ========================================================

    half_adder HA_DUT (
        .A(A),
        .B(B),
        .SUM(HA_SUM),
        .CARRY(HA_CARRY)
    );


    // ========================================================
    // FULL ADDER DUT
    // ========================================================

    full_adder FA_DUT (
        .A(A),
        .B(B),
        .CIN(CIN),
        .SUM(FA_SUM),
        .COUT(FA_COUT)
    );


    // ========================================================
    // TEST
    // ========================================================

    initial begin

        $display("");
        $display("================================================");
        $display("          HALF ADDER TEST");
        $display("================================================");

        $display(
            "A B | SUM CARRY"
        );

        $display(
            "----------------"
        );


        // 00
        A = 0;
        B = 0;
        CIN = 0;
        #10;

        $display(
            "%b %b |  %b    %b",
            A,
            B,
            HA_SUM,
            HA_CARRY
        );


        // 01
        A = 0;
        B = 1;
        CIN = 0;
        #10;

        $display(
            "%b %b |  %b    %b",
            A,
            B,
            HA_SUM,
            HA_CARRY
        );


        // 10
        A = 1;
        B = 0;
        CIN = 0;
        #10;

        $display(
            "%b %b |  %b    %b",
            A,
            B,
            HA_SUM,
            HA_CARRY
        );


        // 11
        A = 1;
        B = 1;
        CIN = 0;
        #10;

        $display(
            "%b %b |  %b    %b",
            A,
            B,
            HA_SUM,
            HA_CARRY
        );


        // ====================================================
        // FULL ADDER
        // ====================================================

        $display("");
        $display("================================================");
        $display("          FULL ADDER TEST");
        $display("================================================");

        $display(
            "A B CIN | SUM COUT"
        );

        $display(
            "------------------"
        );


        // 000
        A = 0;
        B = 0;
        CIN = 0;
        #10;

        $display(
            "%b %b  %b  |  %b    %b",
            A,
            B,
            CIN,
            FA_SUM,
            FA_COUT
        );


        // 001
        A = 0;
        B = 0;
        CIN = 1;
        #10;

        $display(
            "%b %b  %b  |  %b    %b",
            A,
            B,
            CIN,
            FA_SUM,
            FA_COUT
        );


        // 010
        A = 0;
        B = 1;
        CIN = 0;
        #10;

        $display(
            "%b %b  %b  |  %b    %b",
            A,
            B,
            CIN,
            FA_SUM,
            FA_COUT
        );


        // 011
        A = 0;
        B = 1;
        CIN = 1;
        #10;

        $display(
            "%b %b  %b  |  %b    %b",
            A,
            B,
            CIN,
            FA_SUM,
            FA_COUT
        );


        // 100
        A = 1;
        B = 0;
        CIN = 0;
        #10;

        $display(
            "%b %b  %b  |  %b    %b",
            A,
            B,
            CIN,
            FA_SUM,
            FA_COUT
        );


        // 101
        A = 1;
        B = 0;
        CIN = 1;
        #10;

        $display(
            "%b %b  %b  |  %b    %b",
            A,
            B,
            CIN,
            FA_SUM,
            FA_COUT
        );


        // 110
        A = 1;
        B = 1;
        CIN = 0;
        #10;

        $display(
            "%b %b  %b  |  %b    %b",
            A,
            B,
            CIN,
            FA_SUM,
            FA_COUT
        );


        // 111
        A = 1;
        B = 1;
        CIN = 1;
        #10;

        $display(
            "%b %b  %b  |  %b    %b",
            A,
            B,
            CIN,
            FA_SUM,
            FA_COUT
        );


        $display("");
        $display("================================================");
        $display("          ADDER TEST COMPLETED");
        $display("================================================");

        $finish;

    end

endmodule
