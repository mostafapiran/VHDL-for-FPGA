
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE WORK.defns.ALL;

ENTITY fpga IS
 PORT(fu, fo, reset, ppm : IN  std_logic;
      dig1, dig2, dig3: OUT lcd_seg;
      k, p1, p2, p3, c1: OUT std_logic;
      arrow, colon, minus, bp : OUT std_logic
	  );
END fpga; 


 
ARCHITECTURE behav OF fpga IS 

signal c_ready,f_ready : std_logic :='0';
signal count,freq: integer:=0;
 
  COMPONENT fpga1
 PORT(fu, fo, reset: IN  std_logic;
      c_ready: OUT std_logic;
 	  count:OUT integer
      );
 END COMPONENT;	 
 
   COMPONENT fpga2
 PORT(fo, reset, ppm, c_ready: IN  std_logic;
      count: IN  integer;
      f_ready: OUT std_logic;
      freq: OUT integer
	  );
  END COMPONENT;
  
    COMPONENT fpga3
 PORT(fo, reset, ppm, f_ready : IN  std_logic;
      freq: IN integer;
      dig1, dig2, dig3: OUT lcd_seg;
      k, p1, p2, p3, c1: OUT std_logic;
      arrow, colon, minus, bp : OUT std_logic
	  );
   END COMPONENT;
 
 

 BEGIN
	u1: fpga1 PORT MAP (fu, fo, reset,c_ready,count);
  	u2: fpga2 PORT MAP (fo, reset, ppm, c_ready,count,f_ready,freq);
	u3: fpga3 PORT MAP (fo, reset, ppm, f_ready,freq,dig1, dig2, dig3,k, p1, p2, p3, c1,arrow, colon, minus, bp);
 
END behav;   