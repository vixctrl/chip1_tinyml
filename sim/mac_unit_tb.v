`timescale 1ns/1ps
module mac_unit_tb;
    reg clk, reset;
    reg [7:0] a, b;
    reg [15:0] acc_in;
    wire [15:0] acc_out;

    mac_unit uut (
        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .acc_in(acc_in),
        .acc_out(acc_out)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("mac_unit.vcd");
        $dumpvars(0, mac_unit_tb);

        clk = 0; reset = 1; a = 0; b = 0; acc_in = 0;
        #10 reset = 0; a = 8'd3; b = 8'd4; acc_in = 0;
        #10 a = 8'd2; b = 8'd5; acc_in = acc_out;
        #10 $finish;
    end
endmodule
