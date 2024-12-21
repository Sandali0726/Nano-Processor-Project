----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2024 07:13:29 AM
-- Design Name: 
-- Module Name: M_P_TB - Behavioral
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

entity M_P_TB is
--  Port ( );
end M_P_TB;

architecture Behavioral of M_P_TB is
COMPONENT MICRO_PROCESSOR
Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Op_Led : out STD_LOGIC_VECTOR (3 downto 0);
           equal : out STD_LOGIC;
           max_A : out STD_LOGIC;
           max_B : out STD_LOGIC;
           Over_Flow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           anode:out STD_LOGIC_VECTOR (3 downto 0);
           Sev_7Seg :out STD_LOGIC_VECTOR (6 downto 0));
END COMPONENT;

SIGNAL Clk,Res,Over_Flow,Zero,equal,max_A,max_B:STD_LOGIC;
SIGNAL Op_Led: STD_LOGIC_VECTOR (3 downto 0);
signal Sev_7Seg : STD_LOGIC_VECTOR (6 downto 0);

begin
UUT:MICRO_PROCESSOR
port map(
Clk=>Clk,
Res=>Res,
equal=>equal,
max_A=>max_A,
max_B=>max_B,
Op_Led=>Op_Led,
Over_Flow=>Over_Flow,
Zero=>Zero,
Sev_7Seg=>Sev_7Seg
);

PROCESS BEGIN
Clk<='0';
WAIT FOR 10ns;
Clk<='1';
WAIT FOR 10ns;
END PROCESS;

PROCESS BEGIN
Res<='1';
WAIT FOR 100ns;
Res<='0';
WAIT FOR 100ns;
Res<='0';
WAIT FOR 100ns;
Res<='0';
WAIT FOR 100ns;
Res<='0';
WAIT FOR 100ns;
Res<='0';
WAIT FOR 100ns;
Res<='0';
WAIT FOR 100ns;
Res<='0';
WAIT FOR 100ns;

END PROCESS;

end Behavioral;
