----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2024 06:24:58 PM
-- Design Name: 
-- Module Name: TB_RCA_4 - Behavioral
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

entity AddSub_TB is
--  Port ( );
end AddSub_TB;

architecture Behavioral of AddSub_TB is
COMPONENT AddSub
PORT( A0,A1,A2,A3,B0,B1,B2,B3,AOS,AOS_EN : IN STD_LOGIC;
      S0,S1,S2,S3,Over_flow,C_Out,Zero : OUT STD_LOGIC);
END COMPONENT;

SIGNAL A0,A1,A2,A3,B0,B1,B2,B3,AOS,C_Out,AOS_EN : STD_LOGIC;
SIGNAL Over_flow,S0,S1,S2,S3,Zero : STD_LOGIC;

begin
UUT : AddSub PORT MAP(
   A0=>A0,
   A1 => A1,
   A2 => A2,
   A3 => A3,
   AOS=>AOS,
   AOS_EN=>AOS_EN,
   B0=>B0,
   B1 => B1,
   B2 => B2,
   B3 => B3,
  -- C_in =>C_in,
   S0=>S0,
   S1 => S1,
   S2 => S2,
   S3 => S3,
   C_Out=>C_Out,
   Zero=>Zero,
   Over_flow => Over_flow);
PROCESS
      BEGIN
      AOS_EN<='1';
      AOS<='0';
        A0 <= '0';
        A1 <= '0';
        A2 <= '0';
        A3 <= '0';
        B0 <= '0';
        B1 <='0';
        B2<='0';
        B3<='0';
       -- C_in <= '0';
        
        WAIT FOR 100 ns;
        AOS<='1';
        A0<='0';
        A1<='0';
        A2<='0';
        A3<='0';
        B0 <='0';
        B1 <='1';
        B2 <='0';
        B3 <='1';
        
        WAIT FOR 100 ns;
           AOS<='1';
           A0<='1';
           A1<='1';
           A2<='1';
           A3<='1';
           B0 <='0';
           B1 <='1';
           B2 <='1';
           B3 <='0';
        
        WAIT FOR 100 ns;
        AOS<='0';
               A0<='1';
               A1<='0';
               A2<='1';
               A3<='0';
               B0 <='1';
               B1 <='1';
               B2 <='0';
               B3 <='1';
        
        WAIT FOR 100 ns;
        AOS<='0';
               A0<='1';
               A1<='1';
               A2<='1';
               A3<='1';
               B0 <='1';
               B1 <='1';
               B2 <='1';
               B3 <='1';
        
        WAIT FOR 100ns;
        AOS<='0';
        
               A0<='1';
               A1<='1';
               A2<='1';
               A3<='1';
               B0 <='1';
               B1 <='1';
               B2 <='1';
               B3 <='0';
        
        WAIT FOR 100 ns;
        AOS<='0';
               A0<='0';
               A1<='0';
               A2<='1';
               A3<='1';
               B0 <='1';
               B1 <='0';
               B2 <='1';
               B3 <='1';
        WAIT FOR 100 ns;
        AOS<='0';
                 A0<='1';
                 A1<='1';
                 A2<='0';
                 A3<='1';
                 B0 <='1';
                 B1 <='0';
                 B2 <='1';
                 B3 <='1';
         WAIT FOR 100 ns;
         AOS<='0'; 
               A0<='1';
               A1<='1';
               A2<='1';
               A3<='1';
               B0 <='1';
               B1 <='1';
               B2 <='1';
               B3 <='1';
                                           
        WAIT;
        END PROCESS;

end Behavioral;
