-------------------------------------------------------------------------------
--
-- Title       : fpga1_1
-- Design      : reatmetr
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : fpga1_1.vhd
-- Generated   : Tue Aug  4 14:29:23 2020
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
--{entity {fpga1_1} architecture {fpga1_1}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity fpga1_1 is
	 port(
		 fo : in STD_LOGIC;
		 fu : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 INCR : out STD_LOGIC;
		 RST : out STD_LOGIC;
		 c_ready : out STD_LOGIC
	     );
end fpga1_1;

--}} End of automatically maintained section

architecture fpga1_1 of fpga1_1 is
begin  
	
	
count_action: PROCESS(fo, reset, fu)
--VARIABLE count_r: integer :=0 ;
VARIABLE x: STD_LOGIC :='0';
BEGIN
  IF reset= '1' THEN
   RST <= '1';	  
  -- count_r := 0;
   c_ready <= '0';
  ELSE
	RST <= '0';
	INCR <= '1';
   --IF fo'last_value = '0' AND fo'event THEN
    --count_r := count_r + 1;
  -- END IF;
   
  IF fu'last_value = '0' AND fu'event THEN
    --IF count_r /= 0 THEN
      --c_ready <= '1';
	  x:='1';
	  --INCR <= '1';
	--END IF;
	--count_r := 0;	
	 END IF;
	IF fo'last_value = '0' AND fo'event and x='1' THEN 
		c_ready <= '1';
		RST <= '1';
		INCR <= '0';
		x  :='0';
	else 
	    c_ready <= '0';
		RST <= '0';
		INCR <= '1';
	END IF;	
  
   
  END IF;
  --IF fu'last_value = '1' AND fu'event THEN
	--INCR <= '0';
  	--c_ready <= '0';
	  --end if ;

END PROCESS count_action;

end fpga1_1;
