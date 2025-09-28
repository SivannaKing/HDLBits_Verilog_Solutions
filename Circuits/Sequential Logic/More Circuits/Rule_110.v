module top_module (
    input          clk,
    input          load,
    input  [511:0] data,
    output [511:0] q
);

    // TODO IMP ruleXXX
    wire [511:0] l, r;
    assign l = q << 1;
    assign r = q >> 1;
    always @(posedge clk) begin
        if (load) q <= data;
        else begin
            q <= (q ^ l) | ((~r) & q);
        end
    end

endmodule
