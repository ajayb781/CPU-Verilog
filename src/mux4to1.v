module mux4to1(
  input [3:0] a,
  input [3:0] b,
  input [3:0] c,
  input [3:0] d,
  input [1:0]op,
  output reg [3:0] o
);
  
  always@(*) begin 
    case(op)
      2'b00 : o=a;
      2'b01 : o=b;
      2'b10 : o=c;
      2'b11 : o=d;
      default : o=a;
    endcase
  end
endmodule