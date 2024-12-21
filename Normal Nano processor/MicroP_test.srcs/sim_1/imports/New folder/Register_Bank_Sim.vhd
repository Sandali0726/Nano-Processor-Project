----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 04:40:00 PM
-- Design Name: 
-- Module Name: Register_Bank_Sim - Behavioral
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

entity Register_Bank_Sim is
--  Port ( );
end Register_Bank_Sim;

architecture Behavioral of Register_Bank_Sim is
component REGISTER_BANK 
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           CLK : in STD_LOGIC;
           Reset:in std_logic;
           M : in STD_LOGIC_VECTOR (2 downto 0);
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;
SIGNAL D: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL M: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL CLK:STD_LOGIC:='1';
SIGNAL RESET:STD_LOGIC;
SIGNAL R0,R1,R2,R3,R4,R5,R6,R7 : STD_LOGIC_VECTOR (3 downto 0);
begin
UUT:REGISTER_BANK
port map(
D=>D,
CLK=>CLK,
RESET=>RESET,
M=>M,
R0=>R0,
R1=>R1,
R2=>R2,
r3=>r3,
R4=>R4,
R5=>R5,
R6=>R6,
R7=>R7);
PROCESS BEGIN
wait for 5ns;
clk<=not clk;
END PROCESS;

process begin

RESET<='1';
D<="0001";
Reset<='0';
M<="000";

wait for 100ns;
RESET<='0';
D<="0001";
Reset<='0';
M<="000";

wait for 100ns;
D<="0011";
Reset<='0';
m<="001";

wait for 100ns;
D<="0111";
Reset<='0';
m<="010";

wait for 100ns;
D<="1111";
Reset<='0';
m<="011";

wait for 100ns;
D<="1101";
Reset<='0';
M<="100";

wait for 100ns;
D<="0111";
Reset<='0';
M<="101";

wait for 100ns;
D<="0101";
Reset<='1';
M<="110";

wait for 100ns;
D<="1001";
Reset<='0';
M<="111";
end process;

end Behavioral;

