----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2024 03:03:28 PM
-- Design Name: 
-- Module Name: MUX_2_WAY_3_Bit - Behavioral
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

entity MUX_2_WAY_3_Bit is
    Port ( X : in STD_LOGIC_VECTOR (2 downto 0);
           Y : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (2 downto 0));
end MUX_2_WAY_3_Bit;

architecture Behavioral of MUX_2_WAY_3_Bit is
component MUX_2_1
   port (   
       A : in STD_LOGIC_VECTOR (1 downto 0);
       B : out STD_LOGIC;
       C : in STD_LOGIC);  
   end component; 

 
begin
 MUX_2_1_0 :  MUX_2_1
          port map (   
          A(0)=>X(0), 
          A(1)=>Y(0),
          B=>Z(0),
          C => S); 
 MUX_2_1_1 :  MUX_2_1
            port map (   
            A(0)=>X(1), 
            A(1)=>Y(1),
            B=>Z(1),
            C => S); 
 MUX_2_1_2 :  MUX_2_1
              port map (   
              A(0)=>X(2), 
              A(1)=>Y(2),
              B=>Z(2),
              C => S);

  
            
         


end Behavioral;
