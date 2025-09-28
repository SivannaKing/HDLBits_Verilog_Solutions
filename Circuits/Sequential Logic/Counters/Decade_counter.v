module top_module (
    input        clk,
    input        reset,  // Synchronous active-high reset
    output [3:0] q
);

    always @(posedge clk) begin  // TODO IMP 'or' 'and' in always
        if (reset || q == 4'd9) begin  // TODO IMP '||' '&&' in if
            q <= 4'd0;
        end else begin
            q <= q + 4'd1;
        end
    end

endmodule
