module top_module (
    input  a,
    input  b,
    input  c,
    input  d,
    output out
);

    assign out = (~c&~b) | (~d&~a) | (b&c&d) | (a&c&d);
    assign out = a | (~b & c);
    assign out = (c ^ d) ^ (a ^ b);

endmodule
