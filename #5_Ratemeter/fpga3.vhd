-------------------------------------------------------------------------------
--
-- Title       : fpga3
-- Design      : raetmeter
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : fpga3.vhd
-- Generated   : Mon Jul 20 05:51:02 2020
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
--{entity {fpga3} architecture {fpga3}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE WORK.defns.ALL;

entity fpga3 is
 PORT(fo, reset, ppm, f_ready : IN  std_logic;
      freq: IN integer;
      dig1, dig2, dig3: OUT lcd_seg;
      k, p1, p2, p3, c1: OUT std_logic;
      arrow, colon, minus, bp : OUT std_logic
	  );
end fpga3;



architecture fpga3 of fpga3 is

signal temp_lcd1, temp_lcd2, temp_lcd3 : lcd_seg;

COMPONENT fpga3_1
	 port(
		 fo : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 f_ready : in STD_LOGIC;
		 freq : in INTEGER;
		 temp_lcd1,temp_lcd2,temp_lcd3: OUT lcd_seg
	     );

END COMPONENT;

COMPONENT fpga3_2
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

END COMPONENT;


begin 
  
	u1: fpga3_1 PORT MAP (fo,reset,f_ready,freq,temp_lcd1,temp_lcd2,temp_lcd3);
	u2: fpga3_2 PORT MAP (fo,ppm,temp_lcd1,temp_lcd2,temp_lcd3,dig1,dig2,dig3,k,p1,p2,p3,c1,arrow,colon,minus,bp);

end fpga3;
