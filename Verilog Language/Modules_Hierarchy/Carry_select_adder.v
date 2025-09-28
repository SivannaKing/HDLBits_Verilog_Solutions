module top_module (
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
    );

    wire c0, c1, c2;
    wire [15:0] sum1, sum2;
    add16 u_add16_00 (
        a[15:0],
        b[15:0],
        1'b0,
        sum[15:0],
        c0
    );
    add16 u_add16_01 (
        a[31:16],
        b[31:16],
        1'b0,
        sum1,
        c1
    );
    add16 u_add16_02 (
        a[31:16],
        b[31:16],
        1'b1,
        sum2,
        c2
    );

    assign sum[31: 16] = c0 ? sum2 : sum1;
    
endmodule
