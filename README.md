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

# Project - [#2_IIR_felter](https://github.com/mostafapiran/VHDL-for-FPGA/tree/main/%232_IIR_felter)
---
# filter_50_100_150_200_250 MHz VHDL Implementation

This repository contains VHDL code generated using MATLAB and Filter Design HDL Coder 3.1.2 for a digital filter module named "filter_50." The filter is designed for FPGA or ASIC hardware acceleration, and the code is intended for use in digital signal processing applications. Below is a detailed description of the key information presented in this README.

## Overview
The `filter_50` module is generated for implementing a discrete-time Infinite Impulse Response (IIR) filter. It utilizes a Direct-Form I structure with second-order sections. The filter is designed to operate in a fully parallel fashion with a folding factor of 1, which means that no input or output data folding is applied.

## Generated Information
- **Generated by:** MATLAB(R) 9.3 and Filter Design HDL Coder 3.1.2.
- **Generated on:** 2020-06-22 19:57:23
- **Target Language:** VHDL
- **Test Bench Stimulus:** The filter can be tested with various input stimuli, including step, ramp, and chirp signals.

## Filter Configuration
- **Filter Structure:** Direct-Form I, Second-Order Sections
- **Number of Sections:** 1
- **Stable:** Yes
- **Linear Phase:** No

## Module Interface
The `filter_50` VHDL module has the following ports:
- `clk`: Clock input
- `clk_enable`: Clock enable input
- `reset`: Reset input
- `filter_in`: Input data of type real (double)
- `filter_out`: Output data of type real (double)

## Architecture Details
The filter is implemented in the `rtl` architecture of the `filter_50` module. It consists of various components and signals, including delay elements, multipliers, and summing blocks. These components are connected to implement the filter's transfer function, as specified by the filter coefficients.

## Filter Coefficients
The filter coefficients are specified as constants within the VHDL code. These coefficients define the filter's behavior and are used in the signal processing calculations.

## How to Use
To use this VHDL implementation of the `filter_50` module, you should integrate it into your FPGA or ASIC design. Connect the input and output ports to your system, ensure proper clock and reset handling, and provide appropriate input stimuli for testing.

Please refer to the relevant FPGA or ASIC development tools and documentation for instructions on how to incorporate this VHDL module into your project.

For testing, you can provide various test stimuli such as step, ramp, or chirp signals to evaluate the filter's performance.

## Important Note
This VHDL code is generated and may require additional customization or integration to meet the specific requirements of your project. It is essential to thoroughly understand the generated code and the filter's behavior to ensure successful integration and operation in your application.

---
