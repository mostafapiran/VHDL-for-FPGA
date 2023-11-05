-------------------------------------------------------------------------------
--
-- Title       : fpga2
-- Design      : raetmeter
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : fpga2.vhd
-- Generated   : Mon Jul 20 05:03:20 2020
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
--{entity {fpga2} architecture {fpga2}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity fpga2 is
 PORT(fo, reset, ppm, c_ready: IN  std_logic;
      count: IN  integer;
      f_ready: OUT std_logic;
      freq: OUT integer
	  );
end fpga2;


architecture fpga2 of fpga2 is 


begin 
	
	 int_action: PROCESS(c_ready)			 
 BEGIN
IF c_ready'last_value = '0' AND c_ready'event THEN
    IF count /= 0 THEN
		IF ppm= '0' THEN
      freq <= 1000000/count; -- CALCULATE fu IN HZ
     ELSE
      freq <= 600000/count;  -- CALCULATE fu IN PPM
     END IF;
   END IF;
   f_ready <= '1';
   
END IF;
IF c_ready'last_value = '1' AND c_ready'event THEN
	f_ready <= '0';
	end if;
	
 END PROCESS int_action;
	

end fpga2;
