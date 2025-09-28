module top_module (
    input        clk,
    input        reset,
    input  [3:1] s,
    output       fr3,
    output       fr2,
    output       fr1,
    output       dfr
);

    // TODO IMP casez FSM
    wire [1:0] state;
    wire [1:0] next_state;
    wire [1:0] p_state;
    parameter A = 0, B = 1, C = 2, D = 3;
    always @(*) begin
        casez (s)
            3'bzz0: next_state = A;
            3'bz01: next_state = B;
            3'b011: next_state = C;
            3'b111: next_state = D;
        endcase
    end

    always @(posedge clk) begin
        if (reset) begin
            p_state = state;
            state = A;
            dfr = 1;
        end else begin
            p_state = state;
            state   = next_state;
            if (p_state == state) dfr = dfr;
            else dfr = (p_state > state || state == A) ? 1 : 0;
        end
    end
    assign fr3 = (state == A) ? 1 : 0;
    assign fr2 = (state == A || state == B) ? 1 : 0;
    assign fr1 = (state == A || state == B || state == C) ? 1 : 0;

endmodule
