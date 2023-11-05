-------------------------------------------------------------------------------
--
-- Title       : TotalFilter
-- Design      : felterIIR
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : E:\#University\M.S\2nd Terms\VHDL\work7_fir\work11\felterIIR\compile\TotalFilter.vhd
-- Generated   : Mon Jul 20 01:35:20 2020
-- From        : E:\#University\M.S\2nd Terms\VHDL\work7_fir\work11\felterIIR\src\TotalFilter.bde
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


entity TotalFilter is
  port(
       clk : in STD_LOGIC;
       clk_en : in STD_LOGIC;
       f_en : in real;
       reset : in STD_LOGIC;
       f_out : out real
  );
end TotalFilter;

architecture TotalFilter of TotalFilter is

---- Component declarations -----

component filter_100
  port (
       clk : in STD_LOGIC;
       clk_enable : in STD_LOGIC;
       filter_in : in REAL;
       reset : in STD_LOGIC;
       filter_out : out REAL
  );
end component;
component filter_150
  port (
       clk : in STD_LOGIC;
       clk_enable : in STD_LOGIC;
       filter_in : in REAL;
       reset : in STD_LOGIC;
       filter_out : out REAL
  );
end component;
component filter_200
  port (
       clk : in STD_LOGIC;
       clk_enable : in STD_LOGIC;
       filter_in : in REAL;
       reset : in STD_LOGIC;
       filter_out : out REAL
  );
end component;
component filter_250
  port (
       clk : in STD_LOGIC;
       clk_enable : in STD_LOGIC;
       filter_in : in REAL;
       reset : in STD_LOGIC;
       filter_out : out REAL
  );
end component;
component filter_50
  port (
       clk : in STD_LOGIC;
       clk_enable : in STD_LOGIC;
       filter_in : in REAL;
       reset : in STD_LOGIC;
       filter_out : out REAL
  );
end component;

---- Signal declarations used on the diagram ----

signal NET234 : REAL;
signal NET243 : REAL;
signal NET252 : REAL;
signal NET261 : REAL;

begin

----  Component instantiations  ----

U1 : filter_50
  port map(
       clk => clk,
       clk_enable => clk_en,
       filter_in => f_en,
       filter_out => NET234,
       reset => reset
  );

U2 : filter_100
  port map(
       clk => clk,
       clk_enable => clk_en,
       filter_in => NET234,
       filter_out => NET243,
       reset => reset
  );

U3 : filter_150
  port map(
       clk => clk,
       clk_enable => clk_en,
       filter_in => NET243,
       filter_out => NET252,
       reset => reset
  );

U4 : filter_200
  port map(
       clk => clk,
       clk_enable => clk_en,
       filter_in => NET252,
       filter_out => NET261,
       reset => reset
  );

U5 : filter_250
  port map(
       clk => clk,
       clk_enable => clk_en,
       filter_in => NET261,
       filter_out => f_out,
       reset => reset
  );


end TotalFilter;
