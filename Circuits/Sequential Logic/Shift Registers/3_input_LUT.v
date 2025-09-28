module top_module (
    input  clk,
    input  enable,
    input  S,
    input  A,
    B,
    C,
    output Z
);

    reg [7:0] Q;
    // TODO IMP signal used as index
    assign Z = Q[{A, B, C}];

    always @(posedge clk) begin
        if (enable) begin
            Q <= {Q[6:0], S};
        end
    end

endmodule
