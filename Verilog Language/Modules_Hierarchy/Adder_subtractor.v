module top_module (
    input  [31:0] a,
    input  [31:0] b,
    input         sub,
    output [31:0] sum
);

    wire [31:0] comp_b;
    assign comp_b = {32{sub}} ^ b;  // TODO IMP same bit wise

    wire c1, c2;
    add16 u_add16_00 (
        a[15:0],
        comp_b[15:0],
        sub,
        sum[15:0],
        c1
    );
    add16 u_add16_01 (
        a[31:16],
        comp_b[31:16],
        c1,
        sum[31:16],
        c2
    );
endmodule
