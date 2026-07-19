module testbench;
reg clk;
reg reset;
wire [3:0]q;

program_counter uut(
    .clk(clk),
    .reset(reset),
    .q(q)
);
    always #5 clk =~clk;
    initial begin
        $monitor("time=%0t,clk=%1b,reset=%1b,q=%4b",$time,clk,reset,q);

        clk =0;

        reset=0;
        #10;

        reset=1;
        #10;

        reset=0;
        #10;

        reset=0;
        #10;

        reset=0;
        #10;

        reset=0;
        #10;

        reset=0;
        #10;

        $finish;
    end
    endmodule