----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 11:23:25 AM
-- Design Name: 
-- Module Name: comparator_TB - Behavioral
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

entity comparator_TB is
--  Port ( );
end comparator_TB;

architecture Behavioral of comparator_TB is
COMPONENT comparator
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           equal : out STD_LOGIC;
           max_A : out STD_LOGIC;
           max_B : out STD_LOGIC);
end COMPONENT;

signal A,B : std_logic_vector(3 downto 0);
signal equal,max_A,max_B :std_logic;

begin
UUT : comparator port map(
    A => A,
    B => B,
    equal => equal,
    max_A => max_A,
    max_B => max_B);

process
begin
    A <= "0110";
    B <= "0110";
    wait for 100ns;
    
    A <= "1010";
    B <= "0101";
    wait for 100ns;
    
    A <= "1100";
    B <= "0011";
    wait for 100ns;
        
    A <= "0101";
    B <= "1000";
    wait for 100ns;    
    
    A <= "0001";
    B <= "0011";
    wait for 100ns;
    
end process;    
end Behavioral;
