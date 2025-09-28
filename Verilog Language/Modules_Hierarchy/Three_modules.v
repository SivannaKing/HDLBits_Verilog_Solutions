module top_module (
    input  clk,
    input  d,
    output q
);

    wire q1, q2;
    my_dff u_my_dff_00 (
        clk,
        d,
        q1
    );
    my_dff u_my_dff_01 (
        clk,
        q1,
        q2
    );
    my_dff u_my_dff_02 (
        clk,
        q2,
        q
    );
endmodule
