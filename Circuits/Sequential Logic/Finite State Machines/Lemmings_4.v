module top_module (
    input  clk,
    input  areset,      // Freshly brainwashed Lemmings walk left.
    input  bump_left,
    input  bump_right,
    input  ground,
    input  dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging
);

    // TODO IMP FSM ex
    reg [2:0] state, next_state;
    parameter left = 0, right = 1, left1 = 2, right1 = 3, dig1 = 4, dig2 = 5, splat = 6, dead = 7;
    reg [4:0] t;
    //left1表示从左边跌倒后保持住原来的方向，right1表示从右边跌倒后保持住原来的方向
    //dig1表示向左边挖掘，dig2表示从右边挖掘,splat表示飞溅，dead表示死亡
    //t表示计数
    //计数器

    initial t <= 5'b1;  //使用initial语句初始化
    always @(posedge clk, posedge areset) begin
        if (areset) t <= 5'b1;
        else if ((next_state == left1) | (next_state == right1)) t <= t + 1'b1;
        else t <= 5'b1;
    end

    //组合逻辑
    always @(*) begin
        case (state)
            left: begin
                if (ground == 1'b0) next_state = left1;
                else if (dig) next_state = dig1;
                else if (bump_left) next_state = right;
                else next_state = left;
            end
            right: begin
                if (ground == 1'b0) next_state = right1;
                else if (dig) next_state = dig2;
                else if (bump_right) next_state = left;
                else next_state = right;
            end
            left1: begin
                if ((ground == 1'b0) & (t <= 5'd20)) next_state = left1;
                else if ((ground == 1'b0) & (t > 5'd20)) next_state = splat;
                else next_state = left;
            end
            right1: begin
                if ((ground == 1'b0) & (t <= 5'd20)) next_state = right1;
                else if ((ground == 1'b0) & t > 5'd20) next_state = splat;
                else next_state = right;
            end
            dig1: begin
                if (ground == 1'b0) next_state = left1;
                else next_state = dig1;
            end
            dig2: begin
                if (ground == 1'b0) next_state = right1;
                else next_state = dig2;
            end
            splat: begin
                if (ground == 1'b1) next_state = dead;
                else next_state = splat;
            end
            dead: begin
                next_state = dead;
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
    assign aaah = ((state == left1) | (state == right1) | (state == splat));
    assign digging = (state == dig1) | (state == dig2);

endmodule
