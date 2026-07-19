# 4-Bit CPU in Verilog

This project is a simple 4-bit CPU built completely in Verilog HDL. I made it to understand how a processor works internally and to improve my RTL design and digital logic skills.

Instead of only learning Verilog syntax, I wanted to build something that combined multiple concepts like registers, ALU, control logic, and a program counter into a working processor.

## Features

* 4-bit CPU architecture
* Register File
* Arithmetic Logic Unit (ALU)
* Program Counter
* Control Unit
* Instruction ROM
* Ripple Carry Adder
* Testbench for simulation

## Supported Instructions

 Opcode  Instruction 
 ------  ----------- 
 `0000` - AND         
 `0001` - OR          
 `0010` - XOR         
 `0011` - ADD         
 `0100` - LOADI       
 `0101` - SUB         
 `1111` - HALT        



## How to Run

Compile the project using Icarus Verilog:

```bash
iverilog -o cpu.out src/*.v tb/tb_cpu.v
```

Run the simulation:

vvp cpu.out

If you want to view the waveform, open the generated `.vcd` file using GTKWave.

## Future Improvements

Some features I would like to add in the future are:


* An 8-bit version of the CPU
* A RISC-V implementation


