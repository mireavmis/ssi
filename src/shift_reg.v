`timescale 1ns / 1ps

module shift_reg(
        input clk,
        input reset,
        input enter,
        input [3:0] switches,
        output reg [31:0] NUMB
    );
    
    initial begin
        NUMB <= 0;
    end

    always@(posedge clk) begin
        if (enter)      NUMB <= {NUMB[27:0], switches};
        else if (reset) NUMB <= 0;
        else            NUMB <= NUMB;
    end
endmodule
