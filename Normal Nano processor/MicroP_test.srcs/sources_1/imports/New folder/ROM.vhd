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

entity ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           I : out STD_LOGIC_VECTOR (11 downto 0));
end ROM;

architecture Behavioral of ROM is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
signal rom : rom_type := (

"101110000001", -- MOVE 1 TO REG 7
"100010000010",--MOVE 2 TO REG  1
"001110010000",--ADD REG 7 VALUE AND REG 1 VALUE
"011110000000",--NEGATION OF REG 7 

"101110000011", -- MOVE 3 TO REG 7
"010010000000",-- NEGATE REG 1 VALUE
"001110010000",--ADD REG 7 VALUE AND REG 1 VALUE
"110000000100"--JUMP TO LINE 4 IF REG 0 VALUE IS 0
 
);


begin
I <= rom(to_integer(unsigned(address)));


end Behavioral;