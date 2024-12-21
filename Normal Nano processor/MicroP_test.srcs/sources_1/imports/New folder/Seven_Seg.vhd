----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2024 05:05:44 PM
-- Design Name: 
-- Module Name: AU_7_seg - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Seven_Seg is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
          -- Clk : in STD_LOGIC;
           
           S_LED : out STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           anode:out STD_LOGIC_VECTOR (3 downto 0)
           );
end Seven_Seg;

architecture Behavioral of Seven_Seg is

component LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal S_0 : STD_LOGIC_VECTOR (3 downto 0);
 
begin
S_0<=A;       

LUT_16_7_0 : LUT_16_7
    port map(
        address => S_0,
        data => S_7Seg);
        
S_LED <= S_0;
anode<="1110";
end Behavioral;
