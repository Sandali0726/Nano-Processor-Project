----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 04:34:22 PM
-- Design Name: 
-- Module Name: Inst_Decoder - Behavioral
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

entity Inst_Decoder is
    Port (  I : in STD_LOGIC_VECTOR (11 downto 0);--instruction
         RE : out STD_LOGIC_VECTOR (2 downto 0);--register enable
         LS : out STD_LOGIC;  --load select
         D : out STD_LOGIC_VECTOR (3 downto 0);--immediate value
         RS_1 : out STD_LOGIC_VECTOR (2 downto 0);--register select 1
         RS_2 : out STD_LOGIC_VECTOR (2 downto 0);--register select 2
         AOS,AOSE : out STD_LOGIC;--add or substerct change
         Ch_FJ : in STD_LOGIC_VECTOR (3 downto 0);--register check for jump
         JF : out STD_LOGIC;--jump flag
         Ad_TJ : out STD_LOGIC_VECTOR (2 downto 0));--address to jump
end Inst_Decoder;

architecture Behavioral of Inst_Decoder is

SIGNAL J_F: STD_LOGIC;

begin

J_F<=NOT(Ch_FJ(0) OR Ch_FJ(1) OR Ch_FJ(2) OR Ch_FJ(3)) AND I(11) AND I(10);
JF<=J_F;
RS_1<=I(9 DOWNTO 7);
RS_2<=I(6 DOWNTO 4);
D<=I(3 DOWNTO 0);
RE<=I(9 DOWNTO 7);

Ad_TJ(2)<=J_F AND I(2);
Ad_TJ(1)<=J_F AND I(1);
Ad_TJ(0)<=J_F AND I(0);

LS<=I(11) AND NOT I(10);
AOS<=NOT I(11) AND I(10);
AOSE<=NOT I(11);


end Behavioral;
