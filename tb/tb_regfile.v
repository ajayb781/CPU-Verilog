module testbench;
reg clk;
reg write_enable;
reg [1:0] read_addr1;
reg [1:0] read_addr2;
wire [3:0] read_data1;
wire [3:0] read_data2;
reg [1:0] write_addr;
reg [3:0] write_data;

regfile uut(
    .clk(clk),
    .write_enable(write_enable),
    .read_addr1(read_addr1),
    .read_addr2(read_addr2),
    .read_data1(read_data1),
    .read_data2(read_data2),
    .write_addr(write_addr),
    .write_data(write_data)
);

    always #5 clk = ~clk;
initial begin
    $monitor(
"Time=%0t | clk=%b | WE=%b | WAddr=%b | WData=%b | RAddr1=%b | RAddr2=%b | RData1=%b | RData2=%b",
$time,
clk,
write_enable,
write_addr,
write_data,
read_addr1,
read_addr2,
read_data1,
read_data2
);
    clk=0;

    write_enable=1;write_addr=2'b01;write_data=4'b1011;
    #10;

    write_enable=1;write_addr=2'b11;
    #10;

    write_enable=1;write_addr=2'b10;
    #10;

    write_enable=1;write_addr=2'b01;
    #10;

    $finish;
end
endmodule