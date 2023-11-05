-------------------------------------------------------------------------------
--
-- Title       : fpga1_2
-- Design      : reatmetr
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : fpga1_2.vhd
-- Generated   : Tue Aug  4 14:32:55 2020
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
--{entity {fpga1_2} architecture {fpga1_2}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity fpga1_2 is
	 port(
		 fo : in STD_LOGIC;
		 INCR : in STD_LOGIC;
		 RST : in STD_LOGIC;
		 count : out INTEGER
	     );
end fpga1_2;

--}} End of automatically maintained section

architecture fpga1_2 of fpga1_2 is 

begin
	
count_action: PROCESS(fo,RST,INCR)
VARIABLE count_r: integer :=0 ;
BEGIN
	
 IF RST= '1' THEN	  
   count_r := 0;
  ELSE  
   IF fo'last_value = '0' AND fo'event and INCR = '1' THEN
    count_r := count_r + 1;
   END IF;
   
   --IF INCR'last_value = '0' AND INCR'event THEN
   -- IF count_r /= 0 THEN
	 -- count <= count_r;
	--END IF;
	--count_r := 0;
   --END IF;
   
  END IF;
	count <= count_r;
	
END PROCESS count_action;
end fpga1_2;
