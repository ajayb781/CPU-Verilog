module testbench;
  reg [3:0] a;
  reg [3:0] b;
  reg [1:0] op;
  wire cout;
  wire [3:0] result;
  
  alu uut(
    .a(a),
    .b(b),
    .op(op),
    .result(result),
    .cout(cout)
  );
    initial begin
    $monitor("Time=%0t,A=%04b,B=%04b,SEL=%02b,Cout=%0b,Result=%04b",$time,a,b,op,cout,result);
    
      a=4'b1010;b=4'b1100;op=2'b00;
      #10;
      
      a=4'b1010;b=4'b1100;op=2'b01;
      #10;
      
      a=4'b1010;b=4'b1100;op=2'b10;
      #10;
      
      a=4'b1010;b=4'b1100;op=2'b11;
      #10;
      
$finish;
    end
endmodule
      