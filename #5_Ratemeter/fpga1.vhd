-------------------------------------------------------------------------------
--
-- Title       : fpga1
-- Design      : raetmeter
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : fpga1.vhd
-- Generated   : Mon Jul 20 04:33:54 2020
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
--{entity {fpga1} architecture {fpga1}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity fpga1 is
 PORT(fu, fo, reset: IN  std_logic;
      c_ready: OUT std_logic;
 	  count:OUT integer
      );
end fpga1;


architecture fpga1 of fpga1 is

signal INCR,RST : std_logic :='0';


COMPONENT fpga1_1
		 port(
		 fo : in STD_LOGIC;
		 fu : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 INCR : out STD_LOGIC;
		 RST : out STD_LOGIC;
		 c_ready : out STD_LOGIC
	     );

 END COMPONENT;	
 
 COMPONENT fpga1_2 
	 	 port(
		 fo : in STD_LOGIC;
		 INCR : in STD_LOGIC;
		 RST : in STD_LOGIC;
		 count : out INTEGER
	     );

 END COMPONENT;	
 

begin 
	u1: fpga1_1 PORT MAP (fo, fu, reset,INCR,RST,c_ready); 
	u2: fpga1_2 PORT MAP (fo, INCR, RST,count);

end fpga1;
