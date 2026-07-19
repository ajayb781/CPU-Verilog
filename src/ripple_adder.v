module ripple_adder(
        input [3:0] a,
        input [3:0] b,
  		input cin,
        output [3:0] s,
  		output cout
      );
  wire c0;
  wire c1;
  wire c2;
        
   full_adder HA1(
    .a(a[0]),
    .b(b[0]),
    .s(s[0]),
     .cin(cin),
     .cout(c0)
     
  );
    
    full_adder HA2(
     .a(a[1]),
     .b(b[1]),
     .s(s[1]),
      .cin(c0),
      .cout(c1)
      
  );
      
     full_adder HA3(
      .a(a[2]),
      .b(b[2]),
      .s(s[2]),
       .cin(c1),
       .cout(c2)
  );
      
     full_adder HA4(
      .a(a[3]),
      .b(b[3]),
      .s(s[3]),
       .cin(c2),
       .cout(cout)
  );
    endmodule