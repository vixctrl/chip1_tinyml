module mac_unit (
    input clk,
    input reset,
    input [7:0] a,
    input [7:0] b,
    input [15:0] c,
    output reg [15:0] y
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            y <= 0;
        else
            y <= (a * b) + c;
    end
endmodule
