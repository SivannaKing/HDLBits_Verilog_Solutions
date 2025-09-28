module top_module (
    input  [3:0] SW,
    input  [3:0] KEY,
    output [3:0] LEDR
);


    MUXDFF u_MUXDFF_00 (
        KEY[0],
        KEY[1],
        KEY[2],
        SW[0],
        LEDR[1],
        LEDR[0]
    );
    MUXDFF u_MUXDFF_01 (
        KEY[0],
        KEY[1],
        KEY[2],
        SW[1],
        LEDR[2],
        LEDR[1]
    );
    MUXDFF u_MUXDFF_02 (
        KEY[0],
        KEY[1],
        KEY[2],
        SW[2],
        LEDR[3],
        LEDR[2]
    );
    MUXDFF u_MUXDFF_03 (
        KEY[0],
        KEY[1],
        KEY[2],
        SW[3],
        KEY[3],
        LEDR[3]
    );

endmodule

module MUXDFF (
    input  clk,
    input  E,
    input  L,
    input  R,
    input  Q_last,
    output Q
);

    always @(posedge clk) begin
        Q <= L ? R : (E ? Q_last : Q);
    end

endmodule
