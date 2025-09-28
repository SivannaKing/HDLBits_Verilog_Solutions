module top_module (
    input  clk,
    input  x,
    output z
);
    reg [2:0] Q;
    initial begin
        Q = 3'b0;
    end

    assign z = ~|Q;

    always @(posedge clk) begin
        Q <= {~Q[2] | x, ~Q[1] & x, Q[0] ^ x};
    end

endmodule
