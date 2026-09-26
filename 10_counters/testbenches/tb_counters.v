// ============================================================
// TESTBENCH: 4-BIT SYNCHRONOUS UP/DOWN COUNTER
// ============================================================

`timescale 1ns/1ps

module tb_counters;

    reg clk;
    reg reset;
    reg enable;
    reg up_down;

    wire [3:0] count;


    // ========================================================
    // DUT
    // ========================================================

    counter_4bit DUT (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .up_down(up_down),
        .count(count)
    );


    // ========================================================
    // CLOCK
    // ========================================================

    initial begin

        clk = 1'b0;

        forever #5 clk = ~clk;

    end


    // ========================================================
    // TEST
    // ========================================================

    initial begin

        $display("");
        $display("================================================");
        $display("          4-BIT UP/DOWN COUNTER TEST");
        $display("================================================");

        $display(
            "Time | Reset | Enable | Direction | Count"
        );

        $display(
            "------------------------------------------"
        );


        // ----------------------------------------------------
        // RESET
        // ----------------------------------------------------

        reset = 1;
        enable = 0;
        up_down = 1;

        #2;

        $display(
            "%4t |   %b   |   %b    |     UP    | %b",
            $time,
            reset,
            enable,
            count
        );

        #8;

        reset = 0;


        // ----------------------------------------------------
        // COUNT UP
        // ----------------------------------------------------

        enable = 1;
        up_down = 1;

        repeat (6) begin

            @(posedge clk);
            #1;

            $display(
                "%4t |   %b   |   %b    |     UP    | %b",
                $time,
                reset,
                enable,
                count
            );

        end


        // ----------------------------------------------------
        // HOLD
        // ----------------------------------------------------

        enable = 0;

        @(posedge clk);
        #1;

        $display(
            "%4t |   %b   |   %b    |    HOLD   | %b",
            $time,
            reset,
            enable,
            count
        );


        // ----------------------------------------------------
        // COUNT DOWN
        // ----------------------------------------------------

        enable = 1;
        up_down = 0;

        repeat (5) begin

            @(posedge clk);
            #1;

            $display(
                "%4t |   %b   |   %b    |    DOWN   | %b",
                $time,
                reset,
                enable,
                count
            );

        end


        // ----------------------------------------------------
        // RESET AGAIN
        // ----------------------------------------------------

        reset = 1;
        enable = 0;

        #2;

        $display(
            "%4t |   %b   |   %b    |   RESET   | %b",
            $time,
            reset,
            enable,
            count
        );


        $display("");
        $display("================================================");
        $display("          COUNTER TEST COMPLETED");
        $display("================================================");

        $finish;

    end

endmodule
