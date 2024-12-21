----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 03:55:48 PM
-- Design Name: 
-- Module Name: PC_SIM - Behavioral
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

entity PC_SIM is
--  Port ( );
end PC_SIM;

architecture Behavioral of PC_SIM is
component  PC port(
     X : in STD_LOGIC_VECTOR (2 downto 0);
     R : in STD_LOGIC;
     Clk : in STD_LOGIC;
     Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;
signal X,Y : STD_LOGIC_VECTOR (2 downto 0);
signal R,Clk : STD_LOGIC; 
begin
UUT : PC port map(
        X => X,
        R => R,
        Clk => Clk,
        Y => Y);
Clock : process
            begin 
              clk <= '1';
              wait for 5ns;
              clk <= '0';
              wait for 5ns;
           end process;
        process 
begin 
    R <= '1';
    X <= "110";
    wait for 100ns;
   R <= '0';
   X <= "101";
   wait for 500ns;
    R <= '0';
    X <= "111";
    wait for 500ns;
    end process;
                  


end Behavioral;
