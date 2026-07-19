module full_adder(
  input a,
  input b,
  input cin,
  output s,
  output cout
);
  wire sum1;
  wire carry1;
  wire carry2;
  
  half_adder HA1(
    .a(a),
    .b(b),
    .s(sum1),
    .cout(carry1)
  );
  
  half_adder HA2(
    .a(sum1),
    .b(cin),
    .s(s),
    .cout(carry2)
  );
  
  assign cout = carry1 | carry2;
  
endmodule