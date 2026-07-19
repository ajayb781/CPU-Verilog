module rom(
  input [3:0]addr,
  output reg [15:0] inst 
);
always@(*) begin
    case(addr) 
    4'b0000 : inst = 16'b0100_01_00_00_00_0011; //xxxx_xx_xx_xx_xxxxxx
    4'b0001 : inst = 16'b0100_10_00_10_00_0101; //opcode_output_input1_input2_xx_number
    4'b0010 : inst = 16'b0011_11_01_10_00_0000; // add R3 R1 R2
    4'b0011 : inst = 16'b0001_00_01_10_00_0000; // or operation of R1 and R2 , set in R0 
    4'b0100 : inst = 16'b0101_00_10_01_00_0000; // subtract R2-R1
    4'b0101 : inst = 16'b1111_00_00_00_00_0000;  // Halt
    default : inst = 16'b0000_00_00_00_00_0000;
    endcase
end
endmodule