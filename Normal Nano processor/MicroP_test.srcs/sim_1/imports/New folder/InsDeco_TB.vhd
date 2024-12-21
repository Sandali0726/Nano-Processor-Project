----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 05:21:17 PM
-- Design Name: 
-- Module Name: InsDeco_TB - Behavioral
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

entity InsDeco_TB is
--  Port ( );
end InsDeco_TB;

architecture Behavioral of InsDeco_TB is
COMPONENT Inst_Decoder 
 Port (   I : in STD_LOGIC_VECTOR (11 downto 0);--instruction
        RE : out STD_LOGIC_VECTOR (2 downto 0);--register enable
        LS : out STD_LOGIC;  --load select
        D : out STD_LOGIC_VECTOR (3 downto 0);--immediate value
        RS_1 : out STD_LOGIC_VECTOR (2 downto 0);--register select 1
        RS_2 : out STD_LOGIC_VECTOR (2 downto 0);--register select 2
        AOS,AOSE : out STD_LOGIC;--add or substerct change
        Ch_FJ : in STD_LOGIC_VECTOR (3 downto 0);--register check for jump
        JF : out STD_LOGIC;--jump flag
        Ad_TJ : out STD_LOGIC_VECTOR (2 downto 0));--address to jump
 END COMPONENT;         

SIGNAL I:STD_LOGIC_VECTOR (11 downto 0);
SIGNAL D,Ch_FJ:STD_LOGIC_VECTOR (3 downto 0);
SIGNAL RE,RS_1,RS_2,Ad_TJ:STD_LOGIC_VECTOR (2 downto 0);
SIGNAL LS,AOS,JF,AOSE:STD_LOGIC;


begin

UUT:Inst_Decoder
PORT MAP
(
I=>I,
RE=>RE,
LS=>LS,
D=>D,
RS_1=>RS_1,
RS_2=>RS_2,
AOS=>AOS,
AOSE=>AOSE,
Ch_FJ=>Ch_FJ,
JF=>JF,
Ad_TJ=>Ad_TJ

);

PROCESS BEGIN
I<="001100000000";
Ch_FJ<="0000";
WAIT FOR 100 ns;
I<="011010000000";
WAIT FOR 100 ns;

I<="101110000000";
WAIT FOR 100 ns;

I<="000001101010";
WAIT FOR 100 ns;

I<="110001110000";
WAIT FOR 100 ns;





END PROCESS;


end Behavioral;
