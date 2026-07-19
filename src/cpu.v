module cpu(
    input clk,
    input reset
);

    wire [3:0] pc;
    wire [15:0] instructions;
    wire [3:0] read_data1;
    wire [3:0] read_data2;
    wire [3:0] alu_result;
    wire [1:0] alu_op;
    wire [3:0] write_data;
    wire reg_write;
    wire imm_sel;
    wire sub;
    wire halt;

    program_counter Pc1(
        .clk(clk),
        .reset(reset),
        .load(~halt),
        .q(pc)
    );

    rom rm1(
        .addr(pc),
        .inst(instructions)
    );

    control_unit cu1(
        .opcode(instructions[15:12]),
        .reg_enable(reg_write),
        .alu_op(alu_op),
        .imm_sel(imm_sel),
        .sub(sub),
        .halt(halt)
    );

    regfile rf1(
        .clk(clk),
        .write_enable(reg_write),
        .read_addr1(instructions[9:8]),
        .read_addr2(instructions[7:6]),
        .write_addr(instructions[11:10]),
        .read_data1(read_data1), // output 1
        .read_data2(read_data2), // output 2
        .write_data(write_data),
        .reset(reset)
    );

    alu a1(
        .a(read_data1),
        .b(read_data2),
        .op(alu_op),
        .result(alu_result),
        .sub(sub)
    );

    mux2to1 m1(
        .a(alu_result),
        .b(instructions[3:0]),
        .op(imm_sel),
        .o(write_data)
    );

endmodule

module mux2to1(
    input [3:0]a,
    input [3:0]b,
    input op,
    output reg [3:0] o
);

    always@(*) begin
        case(op)
        1'b0 : o=a;
        1'b1 : o=b;
        default : o=4'b0000;
        endcase
    end

endmodule


    