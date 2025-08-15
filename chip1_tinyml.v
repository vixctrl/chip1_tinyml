//=====================================================
// Project: TinyML Chip - Single File Integration
// Day 3: Integrated MAC Unit into top-level chip file
//=====================================================

module chip1_tinyml (
    input  wire         clk,
    input  wire         reset,
    input  wire [7:0]   a,
    input  wire [7:0]   b,
    input  wire [15:0]  c,
    output wire [15:0]  y
);

    // Internal signal
    wire [15:0] mac_result;

    // MAC unit instance
    mac_unit u_mac (
        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .c(c),
        .y(mac_result)
    );

    assign y = mac_result;

endmodule

//=====================================================
// Multiply-Accumulate Unit (MAC)
//=====================================================
module mac_unit (
    input  wire         clk,
    input  wire         reset,
    input  wire [7:0]   a,
    input  wire [7:0]   b,
    input  wire [15:0]  c,
    output reg  [15:0]  y
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            y <= 16'b0;
        else
            y <= (a * b) + c;
    end
endmodule
