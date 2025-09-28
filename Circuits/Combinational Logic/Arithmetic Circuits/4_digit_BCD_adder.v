module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

    wire [15:0] cout_next;  // TODO IMP 16bits cout_next

    bcd_fadd bcd_fadd_inst (
        .a   (a[3:0]),
        .b   (b[3:0]),
        .cin (cin),
        .cout(cout_next[0]),
        .sum (sum[3:0])
    );

    assign cout = cout_next[16-4];
    generate
        genvar i;
        for (i = 4; i < 16; i = i + 4) begin : Bcdadd4
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