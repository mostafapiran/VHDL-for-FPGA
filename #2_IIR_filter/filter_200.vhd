-- -------------------------------------------------------------
--
-- Module: filter_200
-- Generated by MATLAB(R) 9.3 and Filter Design HDL Coder 3.1.2.
-- Generated on: 2020-07-20 01:18:03
-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- HDL Code Generation Options:
--
-- TargetLanguage: VHDL
-- TargetDirectory: C:\Users\mostafa\Desktop\filter_IIR_matlab\200
-- Name: filter_200
-- TestBenchStimulus: step ramp chirp 

-- -------------------------------------------------------------
-- HDL Implementation    : Fully parallel
-- Folding Factor        : 1
-- -------------------------------------------------------------
-- Filter Settings:
--
-- Discrete-Time IIR Filter (real)
-- -------------------------------
-- Filter Structure    : Direct-Form I, Second-Order Sections
-- Number of Sections  : 1
-- Stable              : Yes
-- Linear Phase        : No
-- -------------------------------------------------------------



LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

ENTITY filter_200 IS
   PORT( clk                             :   IN    std_logic; 
         clk_enable                      :   IN    std_logic; 
         reset                           :   IN    std_logic; 
         filter_in                       :   IN    real; -- double
         filter_out                      :   OUT   real  -- double
         );

END filter_200;


----------------------------------------------------------------
--Module Architecture: filter_200
----------------------------------------------------------------
ARCHITECTURE rtl OF filter_200 IS
  -- Local Functions
  -- Type Definitions
  TYPE numdelay_pipeline_type IS ARRAY (NATURAL range <>) OF real; -- double
  TYPE dendelay_pipeline_type IS ARRAY (NATURAL range <>) OF real; -- double
  -- Constants
  CONSTANT scaleconst1                    : real := 9.6127263045376621E-01; -- double
  CONSTANT coeff_b1_section1              : real := 1.0000000000000000E+00; -- double
  CONSTANT coeff_b2_section1              : real := 1.6180339887498945E+00; -- double
  CONSTANT coeff_b3_section1              : real := 1.0000000000000000E+00; -- double
  CONSTANT coeff_a2_section1              : real := 1.5553717885292109E+00; -- double
  CONSTANT coeff_a3_section1              : real := 9.2254526090753219E-01; -- double
  -- Signals
  SIGNAL input_register                   : real := 0.0; -- double
  SIGNAL scale1                           : real := 0.0; -- double
  -- Section 1 Signals 
  SIGNAL numtypeconvert1                  : real := 0.0; -- double
  SIGNAL a1sum1                           : real := 0.0; -- double
  SIGNAL numdelay_section1                : numdelay_pipeline_type(0 TO 1) := (0.0, 0.0); -- double
  SIGNAL dendelay_section1                : dendelay_pipeline_type(0 TO 1) := (0.0, 0.0); -- double
  SIGNAL a2mul1                           : real := 0.0; -- double
  SIGNAL a3mul1                           : real := 0.0; -- double
  SIGNAL b1mul1                           : real := 0.0; -- double
  SIGNAL b2mul1                           : real := 0.0; -- double
  SIGNAL b3mul1                           : real := 0.0; -- double
  SIGNAL b1sum1                           : real := 0.0; -- double
  SIGNAL b2sum1                           : real := 0.0; -- double
  SIGNAL b1multypeconvert1                : real := 0.0; -- double
  SIGNAL a2sum1                           : real := 0.0; -- double
  SIGNAL output_typeconvert               : real := 0.0; -- double
  SIGNAL output_register                  : real := 0.0; -- double


BEGIN

  -- Block Statements
  input_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      input_register <= 0.0000000000000000E+00;
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        input_register <= filter_in;
      END IF;
    END IF; 
  END PROCESS input_reg_process;

  scale1 <= input_register * scaleconst1;

  -- ------------------ Section 1 ------------------

  numtypeconvert1 <= scale1;


  numdelay_process_section1 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      numdelay_section1(0) <= 0.0000000000000000E+00;
      numdelay_section1(1) <= 0.0000000000000000E+00;
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        numdelay_section1(1) <= numdelay_section1(0);
        numdelay_section1(0) <= numtypeconvert1;
      END IF;
    END IF;
  END PROCESS numdelay_process_section1;

  dendelay_process_section1 : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dendelay_section1(0) <= 0.0000000000000000E+00;
      dendelay_section1(1) <= 0.0000000000000000E+00;
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        dendelay_section1(1) <= dendelay_section1(0);
        dendelay_section1(0) <= a1sum1;
      END IF;
    END IF;
  END PROCESS dendelay_process_section1;

  a2mul1 <= dendelay_section1(0) * coeff_a2_section1;

  a3mul1 <= dendelay_section1(1) * coeff_a3_section1;

  b1mul1 <= numtypeconvert1;


  b2mul1 <= numdelay_section1(0) * coeff_b2_section1;

  b3mul1 <= numdelay_section1(1);


  b1multypeconvert1 <= b1mul1;


  b1sum1 <= b1multypeconvert1 + b2mul1;

  b2sum1 <= b1sum1 + b3mul1;

  a2sum1 <= b2sum1 - a2mul1;

  a1sum1 <= a2sum1 - a3mul1;

  output_typeconvert <= a1sum1;


  Output_Register_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      output_register <= 0.0000000000000000E+00;
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        output_register <= output_typeconvert;
      END IF;
    END IF; 
  END PROCESS Output_Register_process;

  -- Assignment Statements
  filter_out <= output_register;
END rtl;
