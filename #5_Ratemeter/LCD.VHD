LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE WORK.defns.ALL;

ENTITY lcd IS
 PORT(dig1, dig2, dig3: IN lcd_seg;
      k, p1, p2,p3,c1: IN std_logic;
      arrow, colon, minus, bp :IN std_logic;
      display : OUT char_array);
 END lcd;
 
 ARCHITECTURE behav OF lcd IS
 BEGIN
  internal_action: PROCESS(dig1,dig2,dig3,k,p1,p2,p3,c1,arrow,colon,minus,bp)
  VARIABLE dig1_bp, dig2_bp, dig3_bp : lcd_seg;
  VARIABLE k_bp, p1_bp,p2_bp,p3_bp, c1_bp : std_logic;
  VARIABLE arrow_bp, colon_bp, minus_bp : std_logic;
  
  BEGIN
   FOR seg IN 0 TO 6 LOOP
    dig1_bp(seg) := dig1(seg) XOR bp;
    dig2_bp(seg) := dig2(seg) XOR bp;
    dig3_bp(seg) := dig3(seg) XOR bp; 
   END LOOP;
   
  k_bp := k XOR bp;
  p1_bp := p1 XOR bp;
  p2_bp := p2 XOR bp;
  p3_bp := p3 XOR bp;
  c1_bp := c1 XOR bp;
  arrow_bp := arrow XOR bp;
  minus_bp := minus XOR bp;
  colon_bp := colon XOR bp; 
   
  display(1) <= special_to_char(arrow_bp, colon_bp, minus_bp);
  display(2) <= k_to_char(k_bp);
  display(3) <= dp_to_char(p1_bp);
  display(4) <= seg_to_char(dig1_bp);
  display(5) <= dpcol_to_char(p2_bp, c1_bp);
  display(6) <= seg_to_char(dig2_bp);
  display(7) <= dp_to_char(p3_bp);
  display(8) <= seg_to_char(dig3_bp);   
  
 END PROCESS;
 
END behav;