// ============================================================
// TESTBENCH: SHIFT REGISTERS
// SISO, SIPO, PISO AND PIPO
// ============================================================

`timescale 1ns/1ps

module tb_shift_registers;

    reg clk;
    reg reset;

    reg serial_in;
    reg load;

    reg [3:0] parallel_in;


    wire siso_out;
    wire [3:0] sipo_out;

    wire piso_out;
    wire [3:0] pipo_out;


    // ========================================================
    // DUT INSTANTIATIONS
    // ========================================================

    siso_register SISO_DUT (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .serial_out(siso_out)
    );


    sipo_register SIPO_DUT (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .parallel_out(sipo_out)
    );


    piso_register PISO_DUT (
        .clk(clk),
        .reset(reset),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(piso_out)
    );


    pipo_register PIPO_DUT (
        .clk(clk),
        .reset(reset),
        .load(load),
        .parallel_in(parallel_in),
        .parallel_out(pipo_out)
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
        $display("            SHIFT REGISTER TEST");
        $display("================================================");


        // ----------------------------------------------------
        // RESET
        // ----------------------------------------------------

        reset = 1'b1;
        serial_in = 1'b0;
        load = 1'b0;
        parallel_in = 4'b0000;

        #2;

        $display(
            "RESET: SISO=%b SIPO=%b PISO=%b PIPO=%b",
            siso_out,
            sipo_out,
            piso_out,
            pipo_out
        );

        #8;

        reset = 1'b0;


        // ----------------------------------------------------
        // SISO + SIPO
        // ----------------------------------------------------

        $display("");
        $display("-----------------------------------------------");
        $display("SISO / SIPO SERIAL INPUT TEST");
        $display("-----------------------------------------------");

        serial_in = 1'b1;

        @(posedge clk);
        #1;

        $display(
            "Serial=%b | SISO=%b | SIPO=%b",
            serial_in,
            siso_out,
            sipo_out
        );


        serial_in = 1'b0;

        @(posedge clk);
        #1;

        $display(
            "Serial=%b | SISO=%b | SIPO=%b",
            serial_in,
            siso_out,
            sipo_out
        );


        serial_in = 1'b1;

        @(posedge clk);
        #1;

        $display(
            "Serial=%b | SISO=%b | SIPO=%b",
            serial_in,
            siso_out,
            sipo_out
        );


        serial_in = 1'b1;

        @(posedge clk);
        #1;

        $display(
            "Serial=%b | SISO=%b | SIPO=%b",
            serial_in,
            siso_out,
            sipo_out
        );


        // ----------------------------------------------------
        // PISO + PIPO
        // ----------------------------------------------------

        $display("");
        $display("-----------------------------------------------");
        $display("PISO / PIPO PARALLEL LOAD TEST");
        $display("-----------------------------------------------");

        parallel_in = 4'b1011;
        load = 1'b1;

        @(posedge clk);
        #1;

        $display(
            "Load=%b Input=%b | PISO=%b PIPO=%b",
            load,
            parallel_in,
            piso_out,
            pipo_out
        );


        // Disable load
        load = 1'b0;


        // Shift 1
        @(posedge clk);
        #1;

        $display(
            "Load=%b | PISO=%b PIPO=%b",
            load,
            piso_out,
            pipo_out
        );


        // Shift 2
        @(posedge clk);
        #1;

        $display(
            "Load=%b | PISO=%b PIPO=%b",
            load,
            piso_out,
            pipo_out
        );


        // Shift 3
        @(posedge clk);
        #1;

        $display(
            "Load=%b | PISO=%b PIPO=%b",
            load,
            piso_out,
            pipo_out
        );


        // Shift 4
        @(posedge clk);
        #1;

        $display(
            "Load=%b | PISO=%b PIPO=%b",
            load,
            piso_out,
            pipo_out
        );


        $display("");
        $display("================================================");
        $display("       SHIFT REGISTER TEST COMPLETED");
        $display("================================================");

        $finish;

    end

endmodule
