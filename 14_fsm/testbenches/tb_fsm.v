// ============================================================
// TESTBENCH: TRAFFIC LIGHT FSM
// ============================================================

`timescale 1ns/1ps

module tb_fsm;

    reg clk;
    reg reset;

    wire RED;
    wire YELLOW;
    wire GREEN;


    // ========================================================
    // DUT
    // ========================================================

    traffic_light_fsm DUT (
        .clk(clk),
        .reset(reset),

        .RED(RED),
        .YELLOW(YELLOW),
        .GREEN(GREEN)
    );


    // ========================================================
    // CLOCK
    // ========================================================

    initial begin

        clk = 1'b0;

        forever #5 clk = ~clk;

    end


    // ========================================================
    // MONITOR
    // ========================================================

    always @(posedge clk) begin

        #1;

        $display(
            "Time=%0t | RED=%b | YELLOW=%b | GREEN=%b",
            $time,
            RED,
            YELLOW,
            GREEN
        );

    end


    // ========================================================
    // TEST
    // ========================================================

    initial begin

        $display("");
        $display("================================================");
        $display("          TRAFFIC LIGHT FSM TEST");
        $display("================================================");


        // Reset
        reset = 1'b1;

        #12;

        // Release reset
        reset = 1'b0;


        // Run through several states
        repeat (9) begin

            @(posedge clk);

        end


        $display("");
        $display("================================================");
        $display("             FSM TEST COMPLETED");
        $display("================================================");

        $finish;

    end

endmodule
