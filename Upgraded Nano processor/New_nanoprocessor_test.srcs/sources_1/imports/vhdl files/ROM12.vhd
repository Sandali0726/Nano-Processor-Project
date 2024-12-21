----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 01:43:38 PM
-- Design Name: 
-- Module Name: ROM - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM12 is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           I : out STD_LOGIC_VECTOR (12 downto 0));
end ROM12;

architecture Behavioral of ROM12 is

type rom_type is array (0 to 7) of std_logic_vector(12 downto 0);
signal rom : rom_type := (
"0101110000001", --move 1 to reg7
"0100010000010",--move 2 to reg1
"0001110010000",--reg7<--reg7+reg1
"0011110000000",--negation of value in reg7

"0101110000001", --move 1 to reg7 
"1001110010000",--sub reg 7 value from reg 1 value
"1101110010000",--COMPARE REG 7 VALUE AND REG 1 VALUE
"0110000000100"--jump to 5th instruction
);

begin
I <= rom(to_integer(unsigned(address)));


end Behavioral;