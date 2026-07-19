module testbench;
reg [3:0]d;
reg load;
wire [3:0] q;
reg clk;

register4bit uut(
    .clk(clk),
    .d(d),
    .load(load),
    .q(q)
);
 always #5 clk = ~clk;
 initial begin
    $monitor("Time=%0t,D=%04b,clk=%0b,load=%0b,Q=%04b",$time,d,clk,load,q);
    clk=0;

    d = 4'b1111;load=1;
    #10;

    d = 4'b0000;load=1;
    #10;

    d = 4'b1010;load=0;
    #10;

    $finish;
 end
endmodule