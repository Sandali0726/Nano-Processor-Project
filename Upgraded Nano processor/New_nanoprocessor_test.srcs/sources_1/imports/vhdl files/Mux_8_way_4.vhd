----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2024 02:46:44 PM
-- Design Name: 
-- Module Name: Mux_8_way_4 - Behavioral
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

entity Mux_8_way_4 is
    Port (A : in STD_LOGIC_VECTOR (3 downto 0);--register0 out
           B : in STD_LOGIC_VECTOR (3 downto 0);--register1 out
           C : in STD_LOGIC_VECTOR (3 downto 0);--register2 out
           D : in STD_LOGIC_VECTOR (3 downto 0);--register3 out
           E : in STD_LOGIC_VECTOR (3 downto 0);--register4 out
           F : in STD_LOGIC_VECTOR (3 downto 0);--register5 out
           G : in STD_LOGIC_VECTOR (3 downto 0);--register6 out
           H : in STD_LOGIC_VECTOR (3 downto 0);--register7 out
           S : in STD_LOGIC_VECTOR (2 downto 0);-- selector
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_8_way_4;

architecture Behavioral of Mux_8_way_4 is
component Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y1 : out STD_LOGIC);
end component;
begin
MUX8_0: Mux_8_to_1
PORT MAP(
EN=>'1',
S=>S,
D(0)=>A(0),
D(1)=>B(0),
D(2)=>C(0),
D(3)=>D(0),
D(4)=>E(0),
D(5)=>F(0),
D(6)=>G(0),
D(7)=>H(0),
Y1=>Y(0));

MUX8_1: Mux_8_to_1
PORT MAP(
EN=>'1',
S=>S,
D(0)=>A(1),
D(1)=>B(1),
D(2)=>C(1),
D(3)=>D(1),
D(4)=>E(1),
D(5)=>F(1),
D(6)=>G(1),
D(7)=>H(1),
Y1=>Y(1));

MUX8_2: Mux_8_to_1
PORT MAP(
EN=>'1',
S=>S,
D(0)=>A(2),
D(1)=>B(2),
D(2)=>C(2),
D(3)=>D(2),
D(4)=>E(2),
D(5)=>F(2),
D(6)=>G(2),
D(7)=>H(2),
Y1=>Y(2));

MUX8_3: Mux_8_to_1
PORT MAP(
EN=>'1',
S=>S,
D(0)=>A(3),
D(1)=>B(3),
D(2)=>C(3),
D(3)=>D(3),
D(4)=>E(3),
D(5)=>F(3),
D(6)=>G(3),
D(7)=>H(3),
Y1=>Y(3));

end Behavioral;
