module top_module (
    input            clk,
    input      [7:0] in,
    input            reset,  // Synchronous reset
    output reg       done
);  //

    //TODO IMP one hot FSM
    parameter IDLE = 0, A = 1, B = 2, DONE = 3;
    reg [3:0] cs, ns;

    assign ns[IDLE] = (cs[IDLE] & ~in[3]) | (cs[DONE] & ~in[3]);
    assign ns[A] = (cs[IDLE] & in[3]) | (cs[DONE] & in[3]);
    assign ns[B] = cs[A];
    assign ns[DONE] = cs[B];

    always @(posedge clk) begin
        if (reset) cs <= 4'h1;  // one hot reset
        else cs <= ns;
    end

    assign done = cs[DONE];  // ERROR in HDLBits timing diagrams ??

endmodule
