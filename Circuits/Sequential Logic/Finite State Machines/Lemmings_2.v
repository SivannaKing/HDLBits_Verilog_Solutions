module top_module (
    input  clk,
    input  areset,      // Freshly brainwashed Lemmings walk left.
    input  bump_left,
    input  bump_right,
    input  ground,
    output walk_left,
    output walk_right,
    output aaah
);
    parameter left = 1'b0, right = 1'b01,left1=2'b10,right1=2'b11;//left1表示从左边跌倒后保持原来的状态；right1表示从右边跌倒后保持原来的状态
    reg [1:0] state, next_state;
    //组合逻辑
    always @(*) begin
        case (state)
            left: begin
                if (ground == 1'b0) next_state = left1;
                else if (bump_left) next_state = right;
                else next_state = left;
            end
            right: begin
                if (ground == 1'b0) next_state = right1;
                else if (bump_right) next_state = left;
                else next_state = right;
            end
            left1: begin
                if (ground == 1'b0) next_state = left1;
                else next_state = left;
            end
            right1: begin
                if (ground == 1'b0) next_state = right1;
                else next_state = right;
            end
        endcase
    end
    //时序逻辑
    always @(posedge clk, posedge areset) begin
        if (areset) state <= left;
        else state <= next_state;
    end
    //输出逻辑
    assign walk_right = (state == right);
    assign walk_left = (state == left);
    assign aaah = ((state == left1) || (state == right1));

endmodule
