-------------------------------------------------------------------------------
--
-- Title       : RNG
-- Design      : RNG_LFSR
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : RNG.vhd
-- Generated   : Sun May  3 17:50:42 2020
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
--{entity {RNG} architecture {RNG_beh}}

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pseudorng is
Port ( clock : in STD_LOGIC;
       reset : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (7 downto 0);
       check: out STD_LOGIC);

       constant seed: STD_LOGIC_VECTOR(7 downto 0) := "00000001";
end pseudorng;

architecture Behavioral of pseudorng is

signal temp: STD_LOGIC;
signal Qt: STD_LOGIC_VECTOR(7 downto 0);

begin

PROCESS(clock)
BEGIN

IF rising_edge(clock) THEN
IF (reset='1') THEN Qt <= "00000000";
ELSE Qt <= seed; 
END IF;
temp <= Qt(4) XOR Qt(3) XOR Qt(2) XOR Qt(0);
--Qt <= temp & Qt(7 downto 1);

END IF;
END PROCESS;

check <= temp;
Q <= Qt;

end Behavioral;
