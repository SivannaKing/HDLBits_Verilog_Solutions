module top_module (
    input  clk,
    input  resetn,  // synchronous reset
    input  in,
    output out
);

    reg  [3:0] q;
    wire [3:0] d;
    always @(*) begin
        d = {q[2:0], in};
    end

    always @(posedge clk) begin
        if (!resetn) begin
            q <= 0;
        end else begin
            q <= d;
        end
    end
    assign out = q[3];

endmodule
