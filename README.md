# NanoProcessor Design Project

## Overview
This project involves the design and implementation of a 4-bit NanoProcessor capable of executing four primary instructions. The processor is developed as part of a lab competition and aims to demonstrate a functional design, resource optimization, and real-world applicability through FPGA simulation and testing.

---

## Project Features
### Key Functionalities
- **Supported Instructions**:
  - `MOVI R, d`: Move an immediate value `d` to register `R`.
  - `ADD Ra, Rb`: Add values in registers `Ra` and `Rb`, storing the result in `Ra`.
  - `NEG R`: Compute the 2's complement of the value in register `R`.
  - `JZR R, d`: Jump to a specified instruction if the value in register `R` is 0.

### Design Approach
1. **Subcomponents**:
   - 4-bit Add/Subtract Unit
   - 3-bit Program Counter (PC)
   - Multiplexers (2-way and 8-way)
   - Register Bank
   - Program ROM
   - Instruction Decoder
   - Clock Module
2. **Testing**:
   - Each component is verified using simulation.
   - Integration tests are performed on the BASYS 3 FPGA board to confirm full functionality.
3. **Resource Optimization**:
   - Efficient logic sharing through multiplexers.
   - Optimized design of the 4-bit Add/Subtract unit using ripple carry architecture for minimal resource overhead.

---

## Components
### Basic Design
1. **4-bit Add/Subtract Unit**:
   - Performs addition and subtraction using a ripple carry adder.
   - Implements subtraction via 2's complement.
2. **3-bit Adder**:
   - Increments the Program Counter.
3. **Multiplexers**:
   - 2-way and 8-way multiplexers are used for signal selection and routing.
4. **Register Bank**:
   - Includes 8 registers (with specific constraints on overwriting).
5. **Program ROM**:
   - Stores instructions for the NanoProcessor.
6. **Instruction Decoder**:
   - Decodes instructions and generates control signals.
7. **Seven-Segment Display**:
   - Displays values from registers.

### Improved Design
- Enhanced components with additional features like comparators and improved instruction decoding.

---

## Resource Utilization
### Strategies for Optimization
- Using multiplexers over buffers where possible.
- Simplicity of ripple carry adders for 4-bit operations.
- Efficient memory usage for ROM and register bank.

### FPGA Resource Usage
- Detailed diagrams and metrics provided in the documentation.

---

## Team Contributions
- **Jayathunga W.M.J.S.**
- **Jayasooriya J.A.N.S.**
- **Jayawardhana W.S.S.**
- **Sathsara H.M.W.C.**

---

## How to Run the Project
### Requirements
- **Hardware**: BASYS 3 FPGA Board.
- **Software**: Xilinx Vivado (or equivalent FPGA design tool).

### Steps
1. Open the Vivado project file.
2. Load the VHDL files for each component.
3. Simulate individual components to verify correctness.
4. Integrate all components into the top-level design.
5. Deploy and test the design on the BASYS 3 board.

---

## References
- IEEE Standard VHDL Language Reference.
- FPGA Resource Utilization Guidelines.

---


