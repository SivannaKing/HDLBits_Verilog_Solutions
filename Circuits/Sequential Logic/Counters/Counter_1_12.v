module top_module (
    input        clk,
    input        reset,
    input        enable,
    output [3:0] Q,
    output       c_enable,
    output       c_load,
    output [3:0] c_d
);  //

    // TODO IMP counter 12 instance
    wire load;
    assign c_load = load;
    assign c_enable = enable;
    assign c_d = 1;
    always @(*) begin
        if (Q == 12 & enable) begin
            load = 1;
        end else begin
            load = reset;
        end
    end
    count4 the_counter (
        clk,
        enable,
        load,
        c_d,
        Q
    );

endmodule
