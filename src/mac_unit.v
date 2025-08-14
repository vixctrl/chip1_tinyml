module mac_unit (
    input clk,
    input reset,
    input [7:0] a,
    input [7:0] b,
    input [15:0] acc_in,
    output reg [15:0] acc_out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            acc_out <= 0;
        else
            acc_out <= acc_in + (a * b);
    end
endmodule
