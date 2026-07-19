module testbench;
reg clk;
reg reset;

cpu uut(
    .clk(clk),
    .reset(reset)
);
    always #10 clk = ~clk;
    initial begin


        $dumpfile("cpu.vcd");
        $dumpvars(0, testbench);

       $monitor( "T=%0t PC=%d R0=%d R1=%d R2=%d R3=%d", $time, uut.pc, uut.rf1.q0, uut.rf1.q1, uut.rf1.q2, uut.rf1.q3 );
        clk=0;

        reset=1;
        #25;

        reset=0;
        #90;

        reset=0;
        #90;

        reset=0;
        #90;

        reset=0;
        #90;

        $finish;

    
    end

endmodule