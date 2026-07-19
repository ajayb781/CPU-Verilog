module control_unit(
    input [3:0] opcode,
    output reg [1:0] alu_op,
    output reg reg_enable,
    output reg imm_sel,
    output reg sub,
    output reg halt
);

    
    always@(*) begin
        case(opcode)
            4'b0000 : begin
            alu_op = 2'b00; 
            reg_enable=1'b1; // and
            imm_sel=1'b0;
            sub=1'b0;
            halt=1'b0;
            end
            4'b0001 : begin
            alu_op = 2'b01;
            reg_enable=1'b1; // or
            imm_sel=1'b0;
            sub=1'b0;
            halt=1'b0; 
            end
            4'b0010 : begin
            alu_op = 2'b10; 
            reg_enable=1'b1; // xor
            imm_sel=1'b0;
            sub=1'b0;
            halt=1'b0;
            end
            4'b0011 : begin 
            alu_op = 2'b11;
            reg_enable=1'b1; // add
            imm_sel=1'b0;
            sub=1'b0;
            halt=1'b0;
            end
            4'b0100 : begin
            alu_op = 2'b00; //it wont matter
            reg_enable=1'b1;
            imm_sel=1'b1; //for loadi
            sub=1'b0;
            halt=1'b0;
            end
            4'b0101 : begin
            alu_op = 2'b11;
            reg_enable=1'b1; 
            imm_sel=1'b0;
            sub=1'b1; // for subtraction
            halt=1'b0;
            end
            4'b1111 : begin 
            alu_op = 2'b00; // halt
            reg_enable=1'b0;
            imm_sel=1'b0; 
            sub=1'b0;
            halt=1'b1;
            end
            default : begin 
            alu_op = 2'b00;
            reg_enable=1'b0;
            imm_sel=1'b0;
            sub=1'b0;
            halt=1'b0;
            end

    endcase
    end
endmodule