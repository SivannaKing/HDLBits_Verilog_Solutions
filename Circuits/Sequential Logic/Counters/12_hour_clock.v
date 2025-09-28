module top_module (
    input        clk,
    input        reset,
    input        ena,
    output       pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss
);

    wire [2:0] en;
    counter #(
        .MAX  (8'h59),
        .START(8'h00),
        .INIT (8'h00)
    ) u_counterSS (
        clk,
        reset,
        en[0],
        ss
    );

    counter #(
        .MAX  (8'h59),
        .START(8'h00),
        .INIT (8'h00)
    ) u_counterMM (
        clk,
        reset,
        en[1],
        mm
    );

    counter #(
        .MAX  (8'h12),
        .START(8'h01),
        .INIT (8'h12)
    ) u_counterHH (
        clk,
        reset,
        en[2],
        hh
    );

    assign en[0] = ena;
    assign en[1] = en[0] && (ss == 8'h59);
    assign en[2] = en[1] && (mm == 8'h59);
    always @(posedge clk) begin
        if (reset) begin
            pm <= 0;
        end else begin
            if (hh == 8'h11 && mm == 8'h59 && ss == 8'h59) begin
                pm <= ~pm;
            end
        end
    end

endmodule

module counter #(
    parameter MAX   = 8'h60,
    parameter START = 8'h0,
    parameter INIT  = 8'h0
) (
    input            clk,
    input            reset,
    input            ena,
    output reg [7:0] q
);

    always @(posedge clk) begin
        if (reset) begin
            q <= INIT;
        end else begin
            if (ena) begin
                if (q == MAX) begin  
                    // TODO IMP no paramter calculate in if condition
                    q <= START;
                end else if (q[3:0] == 9) begin
                    q[7:4] <= q[7:4] + 1;
                    q[3:0] <= 4'h0;
                end else begin
                    q[3:0] <= q[3:0] + 1;
                end
            end
        end
    end

endmodule
