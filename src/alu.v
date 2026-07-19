module alu(
  input [3:0] a,
  input [3:0] b,
  input [1:0] op,
  input sub,
  output cout,
  output [3:0] result
);
  wire [3:0] and_results;
  wire [3:0] or_results;
  wire [3:0] xor_results;
  wire [3:0] b_modified;
  
  assign and_results = a&b;
  assign or_results = a|b;
  assign xor_results = a^b;
  assign b_modified = b ^ {4{sub}};
  
  wire [3:0] s;
    
  ripple_adder adder(
    .a(a),
    .b(b_modified),
    .cin(sub),
    .cout(cout),
    .s(s)
  );
  
  
  mux4to1 MA(
    .a(and_results),
    .b(or_results),
    .c(xor_results),
    .d(s),
    .op(op),
    .o(result)
  );
  
    
endmodule