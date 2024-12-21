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

## Assembly Program
### Example Instructions
| Line | Assembly Code          | Description                                   |
|------|------------------------|-----------------------------------------------|
| 1    | `MOV 1 TO REG 7`       | Move immediate value 1 to register 7.         |
| 2    | `MOV 2 TO REG 1`       | Move immediate value 2 to register 1.         |
| 3    | `ADD REG 7 AND REG 1`  | Add values in register 7 and register 1.      |
| 4    | `NEGATE REG 7`         | Compute 2's complement of value in register 7.|
| 5    | `JUMP TO LINE 4`       | Conditional jump based on register value.     |

---

## Team Contributions
- **220278E - Jayathunga W.M.J.S.**: Add/Subtract Unit, PC Design.
- **220267U - Jayasooriya J.A.N.S.**: Multiplexers, Register Bank.
- **220282K - Jayawardhana W.S.S.**: Instruction Decoder, ROM.
- **220585R - Sathsara H.M.W.C.**: FPGA Simulation, Resource Optimization.

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

## Contact
For any queries, please contact the team members via institutional email.

