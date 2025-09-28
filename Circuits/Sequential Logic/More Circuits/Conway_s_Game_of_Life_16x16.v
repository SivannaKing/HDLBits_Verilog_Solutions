module top_module (
    input          clk,
    input          load,
    input  [255:0] data,
    output [255:0] q
);

    // TODO IMP Conway Game
    reg [15:0] q_2d  [15:0];  //2-d q
    reg [15:0] q_next[15:0];  //2-d q_next
    reg [ 3:0] sum;
    integer i, j;
    always @(*) begin
        for (i = 0; i < 16; i++) begin
            for (j = 0; j < 16; j++) begin
                if (i == 0 && j == 0)  //左上角
                    sum=q_2d[15][1]+q_2d[15][0]+q_2d[15][15]+q_2d[0][1]+q_2d[0][15]+q_2d[1][0]+q_2d[1][1]+q_2d[1][15];
                else if (i == 0 && j == 15)  //右上角
                    sum=q_2d[0][0]+q_2d[0][14]+q_2d[15][0]+q_2d[15][14]+q_2d[15][15]+q_2d[1][0]+q_2d[1][14]+q_2d[1][15];
                else if (i == 15 && j == 0)  //左下角
                    sum=q_2d[15][1]+q_2d[15][15]+q_2d[14][0]+q_2d[14][15]+q_2d[14][1]+q_2d[0][0]+q_2d[0][1]+q_2d[0][15];
                else if (i == 15 && j == 15)  //右下角
                    sum=q_2d[15][0]+q_2d[15][14]+q_2d[14][15]+q_2d[14][0]+q_2d[14][14]+q_2d[0][0]+q_2d[0][15]+q_2d[0][14];
                else if (i == 0)  //上边界
                    sum=q_2d[0][j-1]+q_2d[0][j+1]+q_2d[1][j-1]+q_2d[1][j]+q_2d[1][j+1]+q_2d[15][j-1]+q_2d[15][j]+q_2d[15][j+1];
                else if (i == 15)  //下边界
                    sum=q_2d[15][j-1]+q_2d[15][j+1]+q_2d[0][j-1]+q_2d[0][j]+q_2d[0][j+1]+q_2d[14][j-1]+q_2d[14][j]+q_2d[14][j+1];
                else if (j == 0)  //左边界
                    sum=q_2d[i][1]+q_2d[i][15]+q_2d[i-1][0]+q_2d[i-1][15]+q_2d[i-1][1]+q_2d[i+1][0]+q_2d[i+1][1]+q_2d[i+1][15];
                else if (j == 15)  //右边界
                    sum=q_2d[i][0]+q_2d[i][14]+q_2d[i-1][0]+q_2d[i-1][14]+q_2d[i-1][15]+q_2d[i+1][0]+q_2d[i+1][14]+q_2d[i+1][15];
                else  //中间元素
                    sum=q_2d[i-1][j]+q_2d[i-1][j-1]+q_2d[i-1][j+1]+q_2d[i][j-1]+q_2d[i][j+1]+q_2d[i+1][j]+q_2d[i+1][j-1]+q_2d[i+1][j+1];

                case (sum)
                    2: q_next[i][j] = q_2d[i][j];
                    3: q_next[i][j] = 1'b1;
                    default: q_next[i][j] = 0;
                endcase

                //q_2d = q_next;

            end
        end
    end


    always @(posedge clk) begin
        if (load) begin
            for (i = 0; i < 16; i++) begin
                for (j = 0; j < 16; j++) begin
                    q_2d[i][j] <= data[i*16+j];
                end
            end
        end else q_2d <= q_next;
    end


    genvar m, n;
    generate
        for (m = 0; m < 16; m = m + 1) begin : line_reverse
            for (n = 0; n < 16; n = n + 1) begin : list_reverse
                assign q[m*16+n] = q_2d[m][n];
            end
        end

    endgenerate


endmodule
