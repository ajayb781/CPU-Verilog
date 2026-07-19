module regfile(
    input clk,
    input write_enable,
    input reset,

    // Assume example Add R3,R1,R2;
    input [1:0] write_addr, // Selects R3
    input [3:0] write_data, // The final answer (comes back from ALU)
    input [1:0] read_addr1, // Selects R1
    input [1:0] read_addr2, // Selects R2

    output [3:0]read_data1, // Output of R1 (sends to ALU)
    output [3:0]read_data2 // Output of R2(sends to ALU)
);

wire [3:0] q0;
wire [3:0] q1;
wire [3:0] q2;
wire [3:0] q3;

 register4bit R0(
    .d(write_data),
    .clk(clk),
    .load(load0),
    .q(q0),
    .reset(reset)

 );
 register4bit R1(
    .d(write_data),
    .clk(clk),
    .load(load1),
    .q(q1),
    .reset(reset)

 );
 register4bit R2(
    .d(write_data),
    .clk(clk),
    .load(load2),
    .q(q2),
    .reset(reset)

 );
 register4bit R3(
    .d(write_data),
    .clk(clk),
    .load(load3),
    .q(q3),
    .reset(reset)
 );

    wire load0;
    wire load1;
    wire load2;
    wire load3;

    // Decoder Logic
    assign load0 = write_enable && (write_addr == 2'b00);
    assign load1 = write_enable && (write_addr == 2'b01);
    assign load2 = write_enable && (write_addr == 2'b10);
    assign load3 = write_enable && (write_addr == 2'b11);

    // MUX LOGIC 
    mux4to1 m1(
        .a(q0),
        .b(q1),
        .c(q2),
        .d(q3),
        .op(read_addr1),
        .o(read_data1)
    );

    mux4to1 m2(
        .a(q0),
        .b(q1),
        .c(q2),
        .d(q3),
        .op(read_addr2),
        .o(read_data2)
    );

endmodule


 