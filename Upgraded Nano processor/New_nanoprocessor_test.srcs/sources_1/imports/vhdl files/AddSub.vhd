----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2024 01:45:49 PM
-- Design Name: 
-- Module Name: AddSub - Behavioral
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

entity AddSub is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           --C_in : in STD_LOGIC;
           AOS: in STD_LOGIC;
           AOS_EN : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_Out : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Over_flow : out STD_LOGIC);
end AddSub;

architecture Behavioral of AddSub is
component FA
 port (
 A: in std_logic;
 B: in std_logic;
 C_in: in std_logic;
 S: out std_logic;
 C_out: out std_logic);
 end component; 
 
 SIGNAL  FA0_C,  FA1_C, FA2_C, FA3_S ,C : std_logic;
 SIGNAL B_1,B_2,B_0,B_3:STD_LOGIC;
 SIGNAL S_1,S_2,S_0,S_3:STD_LOGIC;

begin
--AS<=AOS;
B_0<=B0 XOR AOS;
B_1<=B1 XOR AOS;
B_2<=B2 XOR AOS;
B_3<=B3 XOR AOS;

S0<=S_0;
S1<=S_1;
S2<=S_2;
S3<=S_3;



FA_0 : FA
 port map (
 A => A0,
 B => B_0,
 C_in => AOS, -- Set to ground
 S => S_0,
 C_Out => FA0_C);
 
FA_1 : FA
  port map (
  A => A1,
  B => B_1,
  C_in => FA0_C,
  S => S_1,
  C_Out => FA1_C);
  
  FA_2 : FA
   port map (
   A => A2,
   B => B_2,
   C_in => FA1_C,
   S => S_2,
   C_Out => FA2_C);
   
   FA_3 : FA
    port map (
    A => A3,
    B => B_3,
    C_in => FA2_C,
    S => S_3,
    C_Out => C);
C_out<=C;    
Over_flow<=((FA2_C XOR C) AND AOS_EN);
Zero<=(Not( C OR S_0 OR S_1 OR S_2 OR S_3) AND AOS_EN);

end Behavioral;
