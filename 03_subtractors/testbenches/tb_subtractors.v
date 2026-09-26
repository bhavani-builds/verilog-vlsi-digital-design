// ============================================================
// TESTBENCH: HALF SUBTRACTOR AND FULL SUBTRACTOR
// ============================================================

`timescale 1ns/1ps

module tb_subtractors;

    // ========================================================
    // HALF SUBTRACTOR SIGNALS
    // ========================================================

    reg A;
    reg B;

    wire HS_DIFFERENCE;
    wire HS_BORROW;


    // ========================================================
    // FULL SUBTRACTOR SIGNALS
    // ========================================================

    reg BIN;

    wire FS_DIFFERENCE;
    wire FS_BOUT;


    // ========================================================
    // HALF SUBTRACTOR DUT
    // ========================================================

    half_subtractor HS_DUT (
        .A(A),
        .B(B),
        .DIFFERENCE(HS_DIFFERENCE),
        .BORROW(HS_BORROW)
    );


    // ========================================================
    // FULL SUBTRACTOR DUT
    // ========================================================

    full_subtractor FS_DUT (
        .A(A),
        .B(B),
        .BIN(BIN),
        .DIFFERENCE(FS_DIFFERENCE),
        .BOUT(FS_BOUT)
    );


    // ========================================================
    // TEST
    // ========================================================

    initial begin

        // ----------------------------------------------------
        // HALF SUBTRACTOR
        // ----------------------------------------------------

        $display("");
        $display("================================================");
        $display("          HALF SUBTRACTOR TEST");
        $display("================================================");

        $display(
            "A B | DIFFERENCE BORROW"
        );

        $display(
            "-----------------------"
        );


        A = 0;
        B = 0;
        BIN = 0;
        #10;

        $display(
            "%b %b |     %b       %b",
            A,
            B,
            HS_DIFFERENCE,
            HS_BORROW
        );


        A = 0;
        B = 1;
        BIN = 0;
        #10;

        $display(
            "%b %b |     %b       %b",
            A,
            B,
            HS_DIFFERENCE,
            HS_BORROW
        );


        A = 1;
        B = 0;
        BIN = 0;
        #10;

        $display(
            "%b %b |     %b       %b",
            A,
            B,
            HS_DIFFERENCE,
            HS_BORROW
        );


        A = 1;
        B = 1;
        BIN = 0;
        #10;

        $display(
            "%b %b |     %b       %b",
            A,
            B,
            HS_DIFFERENCE,
            HS_BORROW
        );


        // ----------------------------------------------------
        // FULL SUBTRACTOR
        // ----------------------------------------------------

        $display("");
        $display("================================================");
        $display("          FULL SUBTRACTOR TEST");
        $display("================================================");

        $display(
            "A B BIN | DIFFERENCE BOUT"
        );

        $display(
            "------------------------"
        );


        // 000
        A = 0;
        B = 0;
        BIN = 0;
        #10;

        $display(
            "%b %b  %b  |     %b        %b",
            A,
            B,
            BIN,
            FS_DIFFERENCE,
            FS_BOUT
        );


        // 001
        A = 0;
        B = 0;
        BIN = 1;
        #10;

        $display(
            "%b %b  %b  |     %b        %b",
            A,
            B,
            BIN,
            FS_DIFFERENCE,
            FS_BOUT
        );


        // 010
        A = 0;
        B = 1;
        BIN = 0;
        #10;

        $display(
            "%b %b  %b  |     %b        %b",
            A,
            B,
            BIN,
            FS_DIFFERENCE,
            FS_BOUT
        );


        // 011
        A = 0;
        B = 1;
        BIN = 1;
        #10;

        $display(
            "%b %b  %b  |     %b        %b",
            A,
            B,
            BIN,
            FS_DIFFERENCE,
            FS_BOUT
        );


        // 100
        A = 1;
        B = 0;
        BIN = 0;
        #10;

        $display(
            "%b %b  %b  |     %b        %b",
            A,
            B,
            BIN,
            FS_DIFFERENCE,
            FS_BOUT
        );


        // 101
        A = 1;
        B = 0;
        BIN = 1;
        #10;

        $display(
            "%b %b  %b  |     %b        %b",
            A,
            B,
            BIN,
            FS_DIFFERENCE,
            FS_BOUT
        );


        // 110
        A = 1;
        B = 1;
        BIN = 0;
        #10;

        $display(
            "%b %b  %b  |     %b        %b",
            A,
            B,
            BIN,
            FS_DIFFERENCE,
            FS_BOUT
        );


        // 111
        A = 1;
        B = 1;
        BIN = 1;
        #10;

        $display(
            "%b %b  %b  |     %b        %b",
            A,
            B,
            BIN,
            FS_DIFFERENCE,
            FS_BOUT
        );


        $display("");
        $display("================================================");
        $display("        SUBTRACTOR TEST COMPLETED");
        $display("================================================");

        $finish;

    end

endmodule
