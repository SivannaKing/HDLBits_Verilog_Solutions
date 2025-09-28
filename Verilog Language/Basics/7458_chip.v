module top_module (
    input  p1a,
    p1b,
    p1c,
    p1d,
    p1e,
    p1f,
    output p1y,
    input  p2a,
    p2b,
    p2c,
    p2d,
    output p2y
);

    wire g1, h1;
    wire e2, f2;
    assign g1  = &{p1a, p1b, p1c};
    assign h1  = &{p1d, p1e, p1f};
    assign p1y = g1 | h1;
    assign e2  = p2a & p2b;
    assign f2  = p2c & p2d;
    assign p2y = e2 | f2;

endmodule
