-------------------------------------------------------------------------------
--
-- Title       : fpga3_2
-- Design      : reatmetr
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : fpga3_2.vhd
-- Generated   : Tue Aug  4 15:10:07 2020
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
--{entity {fpga3_2} architecture {fpga3_2}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE WORK.defns.ALL;

entity fpga3_2 is
	 port(
	     fo : in STD_LOGIC;
	     ppm : in STD_LOGIC;
		 temp_lcd1,temp_lcd2,temp_lcd3: in lcd_seg;
		 dig1,dig2,dig3 : out lcd_seg;
		 k : out STD_LOGIC;
		 p1 : out STD_LOGIC;
		 p2 : out STD_LOGIC;
		 p3 : out STD_LOGIC;
		 c1 : out STD_LOGIC;
		 arrow : out STD_LOGIC;
		 colon : out STD_LOGIC;
		 minus : out STD_LOGIC;
		 bp : out STD_LOGIC
	     );
end fpga3_2;

--}} End of automatically maintained section

architecture fpga3_2 of fpga3_2 is

SIGNAL bp_state: std_logic := '0';

begin

generate_backplane: PROCESS(fo,bp_state)
  
  VARIABLE fo_count : integer := 0;
  BEGIN
   IF fo'event AND fo'last_value = '1' THEN
    fo_count := fo_count + 1;
   END IF;
   IF fo_count = 100 THEN
    bp_state <= NOT(bp_state);

    						-- TOGGLE bp SIGNAL TO GIVE FREQ OF 50 HZ (fo =10khz)
   fo_count := 0;
   END IF;
   bp <= bp_state;
  END PROCESS generate_backplane;
  
generate_7seg_output: PROCESS(bp_state)
 BEGIN
  FOR seg IN 0 TO 6 LOOP
   dig3(seg) <= temp_lcd3(seg) XOR bp_state;
  END LOOP;  
  FOR seg IN 0 TO 6 LOOP
   dig2(seg) <= temp_lcd2(seg) XOR bp_state;
  END LOOP; 
  FOR seg IN 0 TO 6 LOOP
   dig1(seg) <= temp_lcd1(seg) XOR bp_state;
  END LOOP;
  
END PROCESS generate_7seg_output;

 p1 <= bp_state;
 p3 <= bp_state;
 p2 <= NOT(bp_state) WHEN ppm='0' ELSE bp_state;
 k <= bp_state;
 c1 <= bp_state;
 arrow <= bp_state;
 colon <= bp_state;
 minus <= bp_state;

end fpga3_2;
