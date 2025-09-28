module top_module (
    input         clk,
    input         resetn,
    input  [ 1:0] byteena,
    input  [15:0] d,
    output [15:0] q
);

    // TODO IMP 使用非阻塞赋值默认reg类型
    // 模块描述时，input 端口只能为 net,
    // output 端口可以为 net/reg
    // inout 端口只能为 net;
    // 模块调用时，连接模块input端口的信号可以为 net/reg 型, 
    // 连接模块 output 端口的信号只能为 net
    // 连接模块 inout 端口的信号也只能为 net;
    // 任何在always块内被赋值的变量都必须是寄存器型（reg）。
    // 即<=或=左边的信号，必须是reg型，<=或=右边的信号可以是reg型也可以是wire型。
    always @(posedge clk) begin
        if (!resetn) begin
            q <= 0;
        end else begin
            if (byteena[0]) begin
                q[7:0] <= d[7:0];
            end
            if (byteena[1]) begin
                q[15:8] <= d[15:8];
            end
        end
    end

endmodule
