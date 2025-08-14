`timescale 1ns/1ps

module mac_unit_tb;
    reg clk;
    reg reset;
    reg [7:0] a;
    reg [7:0] b;
    reg [15:0] c;
    wire [15:0] y;

    mac_unit uut (
        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .c(c),
        .y(y)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        a = 0; b = 0; c = 0;
        #10 reset = 0;

        a = 8'd5; b = 8'd10; c = 16'd20;
        #10;
        a = 8'd2; b = 8'd3; c = 16'd5;
        #10;
        $finish;
    end

    initial begin
        $dumpfile("mac_unit.vcd");
        $dumpvars(0, mac_unit_tb);
    end
endmodule
