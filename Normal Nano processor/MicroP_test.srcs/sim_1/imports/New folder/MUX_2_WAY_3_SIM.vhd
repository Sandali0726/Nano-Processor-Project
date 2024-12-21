----------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 01:59:29 PM
-- Design Name: 
-- Module Name: MUX_2_WAY_3_SIM - Behavioral
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
----------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_2_WAY_3_SIM is
--  Port ( );
end MUX_2_WAY_3_SIM;

architecture Behavioral of MUX_2_WAY_3_SIM is
component MUX_2_WAY_3_Bit
port( 
          X : in STD_LOGIC_VECTOR (2 downto 0);
          Y : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (2 downto 0)
); 
end component; 
signal X :  STD_LOGIC_VECTOR (2 downto 0);
signal Y :  STD_LOGIC_VECTOR (2 downto 0);
signal S :  STD_LOGIC;
signal Z :  STD_LOGIC_VECTOR (2 downto 0);
begin 
UUT: MUX_2_WAY_3_Bit
port map( 
    X => X, 
    Z => Z, 
    S => S, 
    Y => Y 
); 
process 

begin
X <= "000";
Y <= "111";
S <= '1';
wait for 100ns;
X <= "010";
Y <= "110";
S<='0';
wait for 100ns;
X <= "010";
Y <= "111";
S <= '0';
wait for 100ns;
X <= "010";
Y <= "100";
S <= '0';
wait for 100ns;
X <= "000";
Y <= "111";
S <= '1';
wait for 100ns;
X <= "110";
Y <= "000";
S <= '1';
    
wait;
  end process;
end Behavioral;
