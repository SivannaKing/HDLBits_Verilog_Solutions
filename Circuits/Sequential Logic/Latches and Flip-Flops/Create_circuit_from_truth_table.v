module top_module (
    input  clk,
    input  j,
    input  k,
    output Q
);

    always @(posedge clk) begin
        if (j ^ k) begin
            Q <= j;
        end else begin
            Q <= j ? ~Q : Q;
        end
    end
    
endmodule
