# RISC-V Microprocessor (RV32I) Design

A 32-bit RISC-V microprocessor featuring support for **R**, **I**, **S**, and **J** instruction types. This project showcases the design and implementation of a pipelined processor with robust hazard detection and forwarding logic, suitable for academic and research exploration.

## Project Idea

This project was created to deepen understanding of processor architecture and pipeline management. It implements a five-stage pipeline (Fetch, Decode, Execute, Memory, WriteBack) entirely in Verilog, focusing on correct handling of data hazards using a custom forwarding unit. The microprocessor can serve as a foundation for learning about instruction set architecture and practical techniques for increasing pipeline efficiency.

## Features

- **Instruction Support:**  
  - Full RV32I subset: R, I, S, J formats[file:1]
- **Pipeline Architecture:**  
  - Five stages with separate, modular code blocks
- **Hazard Unit:**  
  - RAW data hazard handling with forwarding logic
- **Simulation:**  
  - Code verified via waveform analysis using `.vcd` files in Vivado[file:1]

## Getting Started

1. Clone the repository:
    ```
    git clone https://github.com/yourusername/riscv-microprocessor.git
    cd riscv-microprocessor
    ```
2. Simulate using Vivado or compatible Verilog tools.

## Repository Structure




Reference: Digital Design and Computer Architecture RISC-V Edition Sarah L. Harris David Harris
