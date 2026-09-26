// ============================================================
// VERILOG VLSI DIGITAL DESIGN
// STEP 14: FINITE STATE MACHINE
// TRAFFIC LIGHT CONTROLLER
// ============================================================

module traffic_light_fsm (
    input wire clk,
    input wire reset,

    output reg RED,
    output reg YELLOW,
    output reg GREEN
);

    // ========================================================
    // STATE DEFINITIONS
    // ========================================================

    localparam RED_STATE    = 2'b00;
    localparam GREEN_STATE  = 2'b01;
    localparam YELLOW_STATE = 2'b10;

    reg [1:0] current_state;
    reg [1:0] next_state;


    // ========================================================
    // STATE REGISTER
    // ========================================================

    always @(posedge clk or posedge reset) begin

        if (reset)
            current_state <= RED_STATE;

        else
            current_state <= next_state;

    end


    // ========================================================
    // NEXT STATE LOGIC
    // ========================================================

    always @(*) begin

        case (current_state)

            RED_STATE:
                next_state = GREEN_STATE;

            GREEN_STATE:
                next_state = YELLOW_STATE;

            YELLOW_STATE:
                next_state = RED_STATE;

            default:
                next_state = RED_STATE;

        endcase

    end


    // ========================================================
    // OUTPUT LOGIC
    // ========================================================

    always @(*) begin

        // Default outputs
        RED = 1'b0;
        YELLOW = 1'b0;
        GREEN = 1'b0;

        case (current_state)

            RED_STATE:
                RED = 1'b1;

            GREEN_STATE:
                GREEN = 1'b1;

            YELLOW_STATE:
                YELLOW = 1'b1;

            default: begin
                RED = 1'b1;
                YELLOW = 1'b0;
                GREEN = 1'b0;
            end

        endcase

    end

endmodule
