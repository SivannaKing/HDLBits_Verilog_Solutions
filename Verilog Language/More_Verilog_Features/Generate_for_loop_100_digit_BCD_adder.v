// TODO IMP Bcdadd100
module top_module (
    input  [399:0] a,
    b,
    input          cin,
    output         cout,
    output [399:0] sum
);

    wire [399:0] cout_next;

    bcd_fadd bcd_fadd_inst (
        .a   (a[3:0]),
        .b   (b[3:0]),
        .cin (cin),
        .cout(cout_next[0]),
        .sum (sum[3:0])
    );

    assign cout = cout_next[400-4];
    generate
        genvar i;
        for (i = 4; i < 400; i = i + 4) begin : Bcdadd100
            bcd_fadd bcd_fadd_inst (
                .a   (a[i+3:i]),
                .b   (b[i+3:i]),
                .cin (cout_next[i-4]),
                .cout(cout_next[i]),
                .sum (sum[i+3:i])
            );
        end
    endgenerate
endmodule
