module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );

    assign out[0] = in[4*sel];
    assign out[1] = in[4*sel+1];
    assign out[2] = in[4*sel+2];
    assign out[3] = in[4*sel+3];
    // TODO IMP [+:] [-:]
    // Alternatively, "indexed vector part select" works better
    // but has an unfamiliar syntax:
	// assign out = in[sel*4 +: 4];		
    // Select starting at index "sel*4", 
    // then select a total width of 4 bits with increasing (+:) index number.
	// assign out = in[sel*4+3 -: 4];	
    // Select starting at index "sel*4+3",
    // then select a total width of 4 bits with decreasing (-:) index number.
	// Note: The width (4 in this case) must be constant.

endmodule