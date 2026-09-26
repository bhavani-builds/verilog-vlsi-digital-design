// ============================================================
// TESTBENCH: SR, D, JK AND T FLIP-FLOPS
// ============================================================

`timescale 1ns/1ps

module tb_flip_flops;

    reg clk;
    reg reset;

    // SR
    reg S;
    reg R;
    wire SR_Q;

    // D
    reg D;
    wire D_Q;

    // JK
    reg J;
    reg K;
    wire JK_Q;

    // T
    reg T;
    wire T_Q;


    // ========================================================
    // DUT INSTANTIATIONS
    // ========================================================

    sr_flip_flop SR_DUT (
        .clk(clk),
        .reset(reset),
        .S(S),
        .R(R),
        .Q(SR_Q)
    );


    d_flip_flop D_DUT (
        .clk(clk),
        .reset(reset),
        .D(D),
        .Q(D_Q)
    );


    jk_flip_flop JK_DUT (
        .clk(clk),
        .reset(reset),
        .J(J),
        .K(K),
        .Q(JK_Q)
    );


    t_flip_flop T_DUT (
        .clk(clk),
        .reset(reset),
        .T(T),
        .Q(T_Q)
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

        // Initial values
        reset = 1'b1;

        S = 0;
        R = 0;

        D = 0;

        J = 0;
        K = 0;

        T = 0;

        #12;

        // Release reset
        reset = 1'b0;


        // ====================================================
        // SR FLIP-FLOP
        // ====================================================

        $display("");
        $display("================================================");
        $display("              SR FLIP-FLOP TEST");
        $display("================================================");

        S = 1;
        R = 0;

        @(posedge clk);
        #1;

        $display(
            "S=%b R=%b Q=%b -> SET",
            S,
            R,
            SR_Q
        );


        S = 0;
        R = 1;

        @(posedge clk);
        #1;

        $display(
            "S=%b R=%b Q=%b -> RESET",
            S,
            R,
            SR_Q
        );


        S = 0;
        R = 0;

        @(posedge clk);
        #1;

        $display(
            "S=%b R=%b Q=%b -> HOLD",
            S,
            R,
            SR_Q
        );


        // ====================================================
        // D FLIP-FLOP
        // ====================================================

        $display("");
        $display("================================================");
        $display("              D FLIP-FLOP TEST");
        $display("================================================");


        D = 1;

        @(posedge clk);
        #1;

        $display(
            "D=%b Q=%b",
            D,
            D_Q
        );


        D = 0;

        @(posedge clk);
        #1;

        $display(
            "D=%b Q=%b",
            D,
            D_Q
        );


        D = 1;

        @(posedge clk);
        #1;

        $display(
            "D=%b Q=%b",
            D,
            D_Q
        );


        // ====================================================
        // JK FLIP-FLOP
        // ====================================================

        $display("");
        $display("================================================");
        $display("              JK FLIP-FLOP TEST");
        $display("================================================");


        // SET
        J = 1;
        K = 0;

        @(posedge clk);
        #1;

        $display(
            "J=%b K=%b Q=%b -> SET",
            J,
            K,
            JK_Q
        );


        // RESET
        J = 0;
        K = 1;

        @(posedge clk);
        #1;

        $display(
            "J=%b K=%b Q=%b -> RESET",
            J,
            K,
            JK_Q
        );


        // TOGGLE
        J = 1;
        K = 1;

        @(posedge clk);
        #1;

        $display(
            "J=%b K=%b Q=%b -> TOGGLE",
            J,
            K,
            JK_Q
        );


        @(posedge clk);
        #1;

        $display(
            "J=%b K=%b Q=%b -> TOGGLE",
            J,
            K,
            JK_Q
        );


        // ====================================================
        // T FLIP-FLOP
        // ====================================================

        $display("");
        $display("================================================");
        $display("              T FLIP-FLOP TEST");
        $display("================================================");


        T = 1;

        @(posedge clk);
        #1;

        $display(
            "T=%b Q=%b -> TOGGLE",
            T,
            T_Q
        );


        @(posedge clk);
        #1;

        $display(
            "T=%b Q=%b -> TOGGLE",
            T,
            T_Q
        );


        T = 0;

        @(posedge clk);
        #1;

        $display(
            "T=%b Q=%b -> HOLD",
            T,
            T_Q
        );


        $display("");
        $display("================================================");
        $display("          FLIP-FLOP TEST COMPLETED");
        $display("================================================");

        $finish;

    end

endmodule
