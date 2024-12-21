----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2024 02:39:08 PM
-- Design Name: 
-- Module Name: MUX_2_1 - Behavioral
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

entity MUX_2_1 is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : out STD_LOGIC;
           C : in STD_LOGIC);
end MUX_2_1;

architecture Behavioral of MUX_2_1 is

begin
B <= ((NOT C) AND A(0)) OR (C AND A(1));

end Behavioral;
