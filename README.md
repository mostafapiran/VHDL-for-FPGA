# VHDL for FPGA
 My projects in VHDL language for FPGA in Modelsim software


# Project - [#1_RNG_LFSR](https://github.com/mostafapiran/VHDL-for-FPGA/tree/main/%231_RNG_LFSR)
---

# VHDL Pseudorandom Number Generator using LFSR

This VHDL code represents a simple pseudorandom number generator (PRNG) designed with a Linear Feedback Shift Register (LFSR). The LFSR PRNG generates a sequence of pseudo-random bits based on the initial seed value and a feedback polynomial.

## Description

- **File**: `RNG.vhd`
- **Author**: mostafa piran
- **Generated**: Sun May 3 17:50:42 2020
- **Version**: 1.0 (You can update the version number as needed)

### Purpose

This VHDL project implements a basic pseudorandom number generator for generating random sequences of 8-bit numbers. It utilizes an 8-bit LFSR with a specific feedback polynomial to produce a pseudo-random output sequence.

### Functionality

- The LFSR PRNG has two main inputs: `clock` and `reset`.
- The `Q` output provides the 8-bit pseudo-random number.
- The `check` output is a single bit that indicates the current state of the LFSR.

### Operation

The LFSR operates on each rising edge of the clock signal. If the reset signal is asserted, the LFSR state is cleared to zero. Otherwise, the LFSR is clocked based on the feedback polynomial. The resulting pseudo-random value is available at the `Q` output.

### Initial Seed

The initial seed for the LFSR is set to `00000001`. You can modify this value to change the starting point of the pseudo-random sequence.

## Usage

1. Ensure you have a VHDL simulation environment or FPGA synthesis tool (e.g., Xilinx Vivado) set up for the project.

2. Open the `RNG.vhd` file in your VHDL development environment.

3. Customize the code as needed, such as the feedback polynomial and initial seed.

4. Simulate the design and verify the pseudo-random output using your VHDL simulator.

5. If you intend to implement the PRNG on an FPGA, follow the synthesis and implementation steps for your target FPGA board.

## License

This code is provided as-is, and you are free to use, modify, and distribute it as per your requirements. No specific license is provided, but it is encouraged to give credit to the original author if you find this code useful.

## Acknowledgment

Special thanks to the VHDL community and the developers of VHDL tools that make such projects possible.

---
