`timescale 1ns / 1ps
module tb();

reg clk100mhz, enter, reset;

reg [3:0] switches;
wire [7:0] anodes;
wire [7:0] cathodes;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars;

end
initial begin
    clk100mhz = 0;
    enter = 0; reset = 0;
    switches = 0;
    #10;
    switches = 3;
    enter = 1;
    #400;
    enter = 0;
    #400;
    switches = 4;
    enter = 1;
    #500;
    enter = 0;

    #10000 $finish;
end

always #10 clk100mhz = ~clk100mhz;

top UUT(
    .switches  (switches ),
    .anodes    (anodes   ),
    .cathodes  (cathodes ),

    .clk100mhz (clk100mhz),
    .enter     (enter    ),
    .reset     (reset    )
);

endmodule
