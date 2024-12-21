----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2024 08:51:28 PM
-- Design Name: 
-- Module Name: MUX8_WAY_4-SIM - Behavioral
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

entity MUX8_WAY_4_SIM is
--  Port ( );
end MUX8_WAY_4_SIM;

architecture Behavioral of MUX8_WAY_4_SIM is
COMPONENT Mux_8_way_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC_VECTOR (3 downto 0);
           D : in STD_LOGIC_VECTOR (3 downto 0);
           E : in STD_LOGIC_VECTOR (3 downto 0);
           F : in STD_LOGIC_VECTOR (3 downto 0);
           G : in STD_LOGIC_VECTOR (3 downto 0);
           H : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;
SIGNAL A,B,C,D,E,F,G,H,Y : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL S: STD_LOGIC_VECTOR(2 downto 0);
begin
UUT:Mux_8_way_4
port map(
A=>A,
B=>B,
C=>C,
D=>D,
E=>E,
F=>F,
G=>G,
H=>H,
S=>S,
Y=>Y
);
process begin
A<="1100";
B<="1010";
C<="0000";
D<="0001";
E<="0010";
F<="0100";
G<="1000";
H<="1111";
S<="000";
WAIT FOR 100NS;

A<="1100";
B<="1010";
C<="0000";
D<="0001";
E<="0010";
F<="0100";
G<="1000";
H<="1111";
S<="001";
WAIT FOR 100NS;

A<="1100";
B<="1010";
C<="0000";
D<="0001";
E<="0010";
F<="0100";
G<="1000";
H<="1111";
S<="010";
WAIT FOR 100NS;

A<="1100";
B<="1010";
C<="0000";
D<="0001";
E<="0010";
F<="0100";
G<="1000";
H<="1111";
S<="011";
WAIT FOR 100NS;

A<="1100";
B<="1010";
C<="0000";
D<="0001";
E<="0010";
F<="0100";
G<="1000";
H<="1111";
S<="100";
WAIT FOR 100NS;

A<="1100";
B<="1010";
C<="0000";
D<="0001";
E<="0010";
F<="0100";
G<="1000";
H<="1111";
S<="101";
WAIT FOR 100NS;

A<="1100";
B<="1010";
C<="0000";
D<="0001";
E<="0010";
F<="0100";
G<="1000";
H<="1111";
S<="110";
WAIT FOR 100NS;

A<="1100";
B<="1010";
C<="0000";
D<="0001";
E<="0010";
F<="0100";
G<="1000";
H<="1111";
S<="111";
WAIT FOR 100NS;
WAIT;
end process;


end Behavioral;
