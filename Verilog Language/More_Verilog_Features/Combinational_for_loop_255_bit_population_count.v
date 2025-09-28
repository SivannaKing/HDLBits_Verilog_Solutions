module top_module (
    input  [254:0] in,
    output [7:0] out
    );

    integer i;  // Moved outside always block for Verilog-2001 compliance
    always @( * ) begin
        out = 8'h0;
        for (i = 0; i < $bits(in); i + + ) begin
            out = out + in[i];  // TODO IMP different bit width plus
        end
    end

endmodule


/* TODO IMP integer vs reg
Use variables declared by integer as loop variables. However, it should be noted that the integer is 32 bits, so if the variable value range is small (the number of cycles is small), then using integer type variables as loop variables will lead to more circuit resources consumption.
*/
