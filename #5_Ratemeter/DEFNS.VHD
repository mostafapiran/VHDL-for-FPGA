LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

PACKAGE defns IS
 TYPE char_array IS ARRAY (1 TO 8) OF CHARACTER;
 SUBTYPE lcd_seg IS std_logic_vector (6 DOWNTO 0);
 SUBTYPE lcd_int IS integer RANGE 0 TO 13;
 FUNCTION int_to_seg(number : IN lcd_int) RETURN lcd_seg;  
 FUNCTION seg_to_char(segs: IN lcd_seg) RETURN character;
 FUNCTION dp_to_char(dp: IN std_logic) RETURN character;
 FUNCTION dpcol_to_char(dp, col : IN std_logic) return character;
 FUNCTION special_to_char(arrow, colon, minus : IN std_logic) RETURN character;
 FUNCTION k_to_char (k: IN std_logic) RETURN character;
END defns;

PACKAGE BODY defns IS
 FUNCTION int_to_seg(number : IN lcd_int) RETURN lcd_seg IS
 BEGIN
  CASE number IS
   WHEN 0 => RETURN "1111110";
   WHEN 1 => RETURN "0110000";
   WHEN 2 => RETURN "1101101";
   WHEN 3 => RETURN "1111001";
   WHEN 4 => RETURN "0110011";
   WHEN 5 => RETURN "1011011";
   WHEN 6 => RETURN "1011111";
   WHEN 7 => RETURN "1110000";
   WHEN 8 => RETURN "1111111";
   WHEN 9 => RETURN "1111011"; 
   WHEN 10 => RETURN "1000111";
   WHEN 11 => RETURN "0001110";
   WHEN 12 => RETURN "1110110";
   WHEN 13 => RETURN "0000000";
  END CASE;
 END int_to_seg;
                
 FUNCTION seg_to_char(segs: IN lcd_seg) RETURN character IS              
 BEGIN
  CASE segs IS
   WHEN "1111110" => RETURN '0';
   WHEN "0110000" => RETURN '1';
   WHEN "1101101" => RETURN '2';
   WHEN "1111001" => RETURN '3';
   WHEN "0110011" => RETURN '4';
   WHEN "1011011" => RETURN '5';
   WHEN "1011111" => RETURN '6';
   WHEN "1110000" => RETURN '7';
   WHEN "1111111" => RETURN '8';
   WHEN "1111011" => RETURN '9'; 
   WHEN "1000111" => RETURN 'F';
   WHEN "0001110" => RETURN 'L';
   WHEN "0111110" => RETURN 'U';
   WHEN "1110111" => RETURN 'R';
   WHEN "1001111" => RETURN 'E';  
   WHEN "1110110" => RETURN 'H'; 
   WHEN "0000000" => RETURN ' '; 
   WHEN OTHERS => RETURN '?'; 
  END CASE;
 END seg_to_char;
 
 FUNCTION dp_to_char(dp: IN std_logic) RETURN character IS
 BEGIN
  CASE dp IS
   WHEN '1' => RETURN '.';
   WHEN '0' => RETURN ' ';
   WHEN OTHERS => RETURN '?';
  END CASE;
 END dp_to_char;
 
 FUNCTION dpcol_to_char(dp, col : IN std_logic) RETURN character IS
 VARIABLE dpcol : std_logic_vector (0 TO 1);
 BEGIN
  dpcol(0) := dp;
  dpcol(1) := col;
  CASE (dpcol) IS
   WHEN "10" => RETURN '.';
   WHEN "00" => RETURN ' ';
   WHEN "11" => RETURN '!';
   WHEN "01" => RETURN ':';
   WHEN OTHERS => RETURN '?';
  END CASE;
 END dpcol_to_char;
 
 FUNCTION special_to_char(arrow, colon, minus : IN std_logic) RETURN character IS
  VARIABLE special : std_logic_vector (0 TO 2);
  BEGIN
   special(0) := arrow;
   special(1) := colon;
   special(2) := minus;
   CASE (special) IS
   WHEN "000" => RETURN ' ';
   WHEN "001" => RETURN '-';
   WHEN "010" => RETURN ':';
   WHEN "011" => RETURN '*';
   WHEN "100" => RETURN '^';
   WHEN "101" => RETURN '=';
   WHEN "110" => RETURN 'T';
   WHEN "111" => RETURN '#';
   WHEN OTHERS => RETURN '?';
  END CASE;
 END special_to_char; 
 
 FUNCTION k_to_char (k: IN std_logic) RETURN character IS
 BEGIN
  CASE k IS
   WHEN '1' => RETURN '1';
   WHEN '0' => RETURN ' ';
   WHEN OTHERS => RETURN '?';
  END CASE;
 END k_to_char;

END defns;