`timescale 1ns/1ps

module chip1_tinyml_tb;
    reg clk;
    reg reset;
    reg [7:0] a, b;
    reg [15:0] c;
    wire [15:0] y;

    chip1_tinyml uut (
        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .c(c),
        .y(y)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("chip1_tinyml.vcd");
        $dumpvars(0, chip1_tinyml_tb);

        reset = 1; a = 0; b = 0; c = 0;
        #12 reset = 0;

        a = 8'd3; b = 8'd4; c = 16'd5;  // 3*4+5 = 17
        #10;
        a = 8'd10; b = 8'd10; c = 16'd50; // 100+50=150
        #10;
        a = 8'd2; b = 8'd5; c = 16'd7;   // 10+7=17
        #10;

        $finish;
    end
endmodule
