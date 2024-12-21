----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2024 07:13:48 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y1 : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is
COMPONENT Decoder_3_to_8
port(
I: in STD_LOGIC_VECTOR;
EN: in STD_LOGIC;
Y: out STD_LOGIC_VECTOR);
end component;
SIGNAL I: STD_LOGIC_VECTOR(2 downto 0);
SIGNAL Y : STD_LOGIC_VECTOR(7 downto 0);

begin
DECORDER : Decoder_3_to_8
PORT MAP(
I=>I,
Y=>Y,
EN=>EN)
;
I <= S;
Y1 <= ((Y(0) AND  D(0)) OR (Y(1) AND D(1)) OR 
(Y(2) AND D(2)) OR (Y(3) AND D(3)) OR (Y(4) AND D(4) )OR (Y(5) AND D(5)) OR 
(Y(6) AND D(6)) OR (Y(7) AND D(7))) ;



end Behavioral;
