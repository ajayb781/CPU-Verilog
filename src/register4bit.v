module register4bit(
    input [3:0] d,
    input clk,
    input load,
    output reg [3:0] q,
    input reset
);
    always@(posedge clk) begin
        if(reset==1) begin
            q <=4'b0000;
        end
        else if(load==1) begin 
            q<=d;
        end
    end
endmodule