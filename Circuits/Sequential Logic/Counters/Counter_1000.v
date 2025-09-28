module top_module (
    input        clk,
    input        reset,
    output       OneHertz,
    output [2:0] c_enable
);  //

    // TODO IMP counter 1Hz using same clk
    reg [3:0] Q0, Q1, Q2;
    bcdcount counter0 (
        clk,
        reset,
        c_enable[0],
        Q0
    );
    bcdcount counter1 (
        clk,
        reset,
        c_enable[1],
        Q1
    );
    bcdcount counter2 (
        clk,
        reset,
        c_enable[2],
        Q2
    );
    always @(*) begin
        c_enable[0] = 1;
        if (Q0 == 9) begin
            c_enable[1] = 1;
        end else begin
            c_enable[1] = 0;
        end
        if (Q0 == 9 && Q1 == 9) begin
            c_enable[2] = 1;
        end else begin
            c_enable[2] = 0;
        end
        OneHertz = Q0 == 9 && Q1 == 9 && Q2 == 9;
    end

endmodule
