-------------------------------------------------------------------------------
--
-- Title       : adder4
-- Design      : adder4
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : e:\#University\M.S\2nd Terms\VHDL\work2\work2\adder4\compile\adder4.vhd
-- Generated   : Sat May  2 17:23:20 2020
-- From        : e:\#University\M.S\2nd Terms\VHDL\work2\work2\adder4\src\adder4.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


-- other libraries declarations
library FD;

entity adder4 is
  port(
       cin : in STD_LOGIC;
       a : in STD_LOGIC_VECTOR(3 downto 0);
       b : in STD_LOGIC_VECTOR(3 downto 0);
       cout : out STD_LOGIC;
       s : out STD_LOGIC_VECTOR(3 downto 0)
  );
end adder4;

architecture adder4behav of adder4 is

---- Component declarations -----

component fulladder
  port (
       a : in STD_LOGIC;
       b : in STD_LOGIC;
       ci : in STD_LOGIC;
       co : out STD_LOGIC;
       s : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal NET62 : STD_LOGIC;
signal NET71 : STD_LOGIC;
signal NET80 : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : fulladder
  port map(
       a => a(0),
       b => b(0),
       ci => cin,
       co => NET62,
       s => s(0)
  );

U2 : fulladder
  port map(
       a => a(1),
       b => b(1),
       ci => NET62,
       co => NET71,
       s => s(1)
  );

U3 : fulladder
  port map(
       a => a(2),
       b => b(2),
       ci => NET71,
       co => NET80,
       s => s(2)
  );

U4 : fulladder
  port map(
       a => a(3),
       b => b(3),
       ci => NET80,
       co => cout,
       s => s(3)
  );


end adder4behav;
