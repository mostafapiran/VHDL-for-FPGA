-------------------------------------------------------------------------------
--
-- Title       : fpga3_1
-- Design      : reatmetr
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : fpga3_1.vhd
-- Generated   : Tue Aug  4 14:45:04 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {fpga3_1} architecture {fpga3_1}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE WORK.defns.ALL;

entity fpga3_1 is
	 port(
		 fo : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 f_ready : in STD_LOGIC;
		 freq : in INTEGER;
		 temp_lcd1,temp_lcd2,temp_lcd3: OUT lcd_seg
	     );
end fpga3_1;

--}} End of automatically maintained section

architecture fpga3_1 of fpga3_1 is
begin 
	
generate_7seg_output: PROCESS(freq,f_ready)
  VARIABLE temp_val1, temp_val2, temp_val3 : integer;
  BEGIN
  
  -- NB THIS PROCESS IGNORS OVERFLOW & UNDERFLOW IN VALUE OF freq
  IF f_ready'event AND f_ready'last_value = '0'THEN
  temp_val3 := freq REM 10;
  temp_lcd3 <= int_to_seg(temp_val3);
  temp_val2 := (freq/10) REM 10;
  temp_lcd2 <= int_to_seg(temp_val2);
  temp_val1 := (freq/100) REM 10;
  temp_lcd1 <= int_to_seg(temp_val1);
  END IF;
  
 END PROCESS generate_7seg_output;	


end fpga3_1;
