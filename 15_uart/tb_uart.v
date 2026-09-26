`timescale 1ns/1ps

// ============================================================
// UART TRANSMITTER TESTBENCH
// ============================================================

module tb_uart;

    reg clk;
    reg reset;

    reg start;
    reg [7:0] data_in;

    wire tx;
    wire busy;
    wire done;

    // --------------------------------------------------------
    // Instantiate UART
    //
    // Small values are used for simulation.
    //
    // CLK_FREQ  = 100
    // BAUD_RATE = 10
    //
    // Therefore:
    //
    // CLKS_PER_BIT = 100 / 10 = 10 clock cycles
    // --------------------------------------------------------

    uart_tx #(
        .CLK_FREQ(100),
        .BAUD_RATE(10)
    ) DUT (

        .clk(clk),
        .reset(reset),

        .start(start),
        .data_in(data_in),

        .tx(tx),
        .busy(busy),
        .done(done)

    );

    // --------------------------------------------------------
    // Clock generation
    // --------------------------------------------------------

    initial begin

        clk = 1'b0;

        forever #5 clk = ~clk;

    end

    // --------------------------------------------------------
    // Test sequence
    // --------------------------------------------------------

    initial begin

        $display("==============================================");
        $display("          UART TRANSMITTER TESTBENCH");
        $display("==============================================");

        $display("Time\tTX\tBUSY\tDONE");

        $monitor(
            "%0t\t%b\t%b\t%b",
            $time,
            tx,
            busy,
            done
        );

        // Initial values
        reset = 1'b1;
        start = 1'b0;
        data_in = 8'b00000000;

        #20;

        // Release reset
        reset = 1'b0;

        #20;

        // ----------------------------------------------------
        // Transmit character 0xA5
        // Binary = 10100101
        // UART sends LSB first
        // ----------------------------------------------------

        data_in = 8'b10100101;

        start = 1'b1;

        #10;

        start = 1'b0;

        // Wait until transmission finishes
        wait(done);

        #20;

        // ----------------------------------------------------
        // Transmit second byte
        // ----------------------------------------------------

        data_in = 8'b11001100;

        start = 1'b1;

        #10;

        start = 1'b0;

        wait(done);

        #20;

        $display("==============================================");
        $display("UART TRANSMISSION COMPLETE");
        $display("==============================================");

        $finish;

    end

endmodule
