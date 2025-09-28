module top_module (
    input  clk,
    input  in,
    input  reset,
    output out
);  //

    parameter A = 2'b00;
    parameter B = 2'b01;
    parameter C = 2'b10;
    parameter D = 2'b11;
    reg [1:0] cs, ns;
    // State transition logic
    always @(*) begin
        case (cs)
            A: ns = in ? B : A;
            B: ns = in ? B : C;
            C: ns = in ? D : A;
            D: ns = in ? B : C;
            default: ns = A;
        endcase
    end

    // State flip-flops with asynchronous reset
    always @(posedge clk) begin
        if (reset) begin
            cs <= A;
        end else begin
            cs <= ns;
        end
    end

    // Output logic
    assign out = (cs == D);

endmodule
