module top_module (
    input         clk,
    input         reset,  // Active-high synchronous reset to 32'h1
    output [31:0] q
);

    wire [31:0] d;
    always @(*) begin
        d = {q[0], q[31:1]};
        d[0] = q[0] ^ q[1];
        d[1] = q[0] ^ q[2];
        d[21] = q[0] ^ q[22];
        d[31] = q[0] ^ 32'b0;
    end
    always @(posedge clk) begin
        if (reset) begin
            q <= 32'h1;
        end else begin
            q <= d;
        end
    end
endmodule
