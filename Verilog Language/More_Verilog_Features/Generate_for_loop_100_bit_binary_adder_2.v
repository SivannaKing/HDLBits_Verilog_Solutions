module top_module (
    input  [99:0] a,
    b,
    input         cin,
    output [99:0] cout,
    output [99:0] sum
);


    assign {cout[0], sum[0]} = a[0] + b[0] + cin;
    // TODO IMP generate loop
    generate
        genvar i;
        for (i = 1; i < $bits(a); i++) begin : Adder100i
            assign {cout[i], sum[i]} = a[i] + b[i] + cout[i-1];
        end
    endgenerate
endmodule
