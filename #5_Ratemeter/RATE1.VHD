LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE WORK.defns.ALL;

ENTITY rate1 IS
 PORT(fu, fo, reset, ppm : IN  std_logic;
      display : OUT char_array);
 END rate1;
 
 ARCHITECTURE behav OF rate1 IS
 SIGNAL dig1_r, dig2_r, dig3_r : lcd_seg;
 SIGNAL k_r, p1_r, p2_r, p3_r, c1_r : std_logic;
 SIGNAL arrow_r, colon_r, minus_r, bp_r : std_logic;
 
COMPONENT fpga
	PORT (
	fu, fo, reset, ppm : IN std_logic;
	dig1, dig2, dig3 : OUT lcd_seg;
	k, p1, p2, p3, c1, arrow, colon, minus, bp : OUT std_logic);
	END COMPONENT;

COMPONENT lcd
	PORT (
	dig1, dig2, dig3 : IN lcd_seg;
	k, p1, p2, p3, c1, arrow, colon, minus, bp : IN std_logic;
	display : OUT char_array);
	END COMPONENT;
 
 BEGIN
 u1: fpga PORT MAP (fu, fo, reset, ppm, 
      dig1_r, dig2_r, dig3_r,
      k_r, p1_r, p2_r, p3_r, c1_r,
      arrow_r, colon_r, minus_r, bp_r);
 u2: lcd PORT MAP (dig1_r, dig2_r, dig3_r,
      k_r, p1_r, p2_r,p3_r,c1_r,
      arrow_r, colon_r, minus_r, bp_r,
      display);    
 END behav;  