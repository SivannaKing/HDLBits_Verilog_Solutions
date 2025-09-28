/*
Implicit nets
Implicit nets are often a source of hard-to-detect bugs. In Verilog, net-type signals can be implicitly created by an assign statement or by attaching something undeclared to a module port. Implicit nets are always one-bit wires and causes bugs if you had intended to use a vector. Disabling creation of implicit nets can be done using the `default_nettype none directive.

wire [2:0] a, c;    // Two vectors
assign a = 3'b101;  // a = 101
assign b = a;       // b =   1  implicitly-created wire
assign c = b;       // c = 001  <-- bug
my_module i1 (d,e); // d and e are implicitly one-bit wide if not declared.
                    // This could be a bug if the port was intended to be a vector.

Adding `default_nettype none would make the second line of code an error, which makes the bug more visible.
*/
`default_nettype none  // Disable implicit nets. Reduces some types of bugs.
module top_module (
    input  wire [15:0] in,
    output wire [ 7:0] out_hi,
    output wire [ 7:0] out_lo
);

    assign {out_hi, out_lo} = in;

endmodule
