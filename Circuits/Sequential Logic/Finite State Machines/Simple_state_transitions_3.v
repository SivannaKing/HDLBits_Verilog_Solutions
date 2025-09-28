module top_module (
    input        in,
    input  [1:0] state,
    output [1:0] next_state,
    output       out
);  //

    parameter A = 0, B = 1, C = 2, D = 3;

    // State transition logic: next_state = f(state, in)
    //组合逻辑
    always @(*) begin
        case (state)
            A: next_state = in ? B : A;
            B: next_state = in ? B : C;
            C: next_state = in ? D : A;
            D: next_state = in ? B : C;
        endcase
    end
    // Output logic:  out = f(state) for a Moore state machine
    //输出逻辑
    always @(*) begin
        if (state == D) out = 1'b1;
        else out = 1'b0;
    end
endmodule
