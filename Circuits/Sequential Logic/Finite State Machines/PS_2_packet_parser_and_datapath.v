module top_module (
    input         clk,
    input  [ 7:0] in,
    input         reset,      // Synchronous reset
    output [23:0] out_bytes,
    output        done
);  //

    // FSM from fsm_ps2
    //TODO IMP one hot FSM
    parameter IDLE = 0, A = 1, B = 2, DONE = 3;
    reg [3:0] cs, ns;
    reg [7:0] in0, in1, in2;

    assign ns[IDLE] = (cs[IDLE] & ~in[3]) | (cs[DONE] & ~in[3]);
    assign ns[A] = (cs[IDLE] & in[3]) | (cs[DONE] & in[3]);
    assign ns[B] = cs[A];
    assign ns[DONE] = cs[B];

    always @(posedge clk) begin
        if (reset) cs <= 4'h1;  // one hot reset
        else cs <= ns;
    end

    assign done = cs[DONE];  // ERROR in HDLBits timing diagrams ??

    // New: Datapath to store incoming bytes.
    always @(posedge clk) begin
        in0 <= in;
        in1 <= in0;
        in2 <= in1;
    end
    assign out_bytes = done ? {in2, in1, in0} : 0;

endmodule
