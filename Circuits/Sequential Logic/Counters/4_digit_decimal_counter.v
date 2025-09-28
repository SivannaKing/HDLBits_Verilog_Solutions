module top_module (
    input         clk,
    input         reset,  // Synchronous active-high reset
    output [ 3:1] ena,
    output [15:0] q
);

    decade_en_counter u_decade_en_counter0 (
        clk,
        1,
        reset,
        q[3:0]
    );
    decade_en_counter u_decade_en_counter1 (
        clk,
        ena[1],
        reset,
        q[7:4]
    );
    decade_en_counter u_decade_en_counter2 (
        clk,
        ena[2],
        reset,
        q[11:8]
    );
    decade_en_counter u_decade_en_counter3 (
        clk,
        ena[3],
        reset,
        q[15:12]
    );
    assign ena[1] = (q[3:0] == 9);
    assign ena[2] = ena[1] && (q[7:4] == 9);
    assign ena[3] = ena[2] && (q[11:8] == 9);

endmodule

module decade_en_counter (
    input        clk,
    input        slowena,
    input        reset,
    output [3:0] q
);

    always @(posedge clk) begin
        if (reset) begin
            q <= 0;
        end else begin
            if (slowena) begin
                if (q == 9) begin
                    q <= 0;
                end else begin
                    q <= q + 1;
                end
            end
        end
    end

endmodule

