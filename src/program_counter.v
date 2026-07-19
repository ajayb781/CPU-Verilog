module program_counter(
    input clk,
    input reset,
    input load,
    output [3:0] q
);
    wire [3:0] s;
    register4bit regi(
        .d(s),
        .q(q),
        .clk(clk),
        .load(load),
        .reset(reset)
    );

    ripple_adder add(
        .a(q),
        .b(4'b0001),
        .s(s),
        .cin(1'b0)
    );
endmodule