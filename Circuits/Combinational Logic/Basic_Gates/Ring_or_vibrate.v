module top_module (
    input  ring,
    input  vibrate_mode,
    output ringer,        // Make sound
    output motor          // Vibrate
);

    assign motor  = vibrate_mode ? ring : 1'b0;
    assign ringer = ~vibrate_mode ? ring : 1'b0;
    
endmodule
