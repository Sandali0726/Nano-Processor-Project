----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 03:28:46 PM
-- Design Name: 
-- Module Name: PC - Behavioral
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

entity PC is
    Port ( X : in STD_LOGIC_VECTOR (2 downto 0);
           R : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end PC;

architecture Behavioral of PC is
component D_FF 
   port (   
       D : in STD_LOGIC; 
       Res: in STD_LOGIC; 
       Clk : in STD_LOGIC; 
       Q : out STD_LOGIC; 
       Qbar : out STD_LOGIC);   
   end component; 
   

    
--   component Slow_Clk 
--   port (   
--       Clk_in : in STD_LOGIC; 
--       Clk_out: out STD_LOGIC);   
--   end component; 
    

  -- signal D0, D1, D2 : std_logic;  -- Internal signals 
 --  signal Q0, Q1, Q2 : std_logic; -- Internal signals 
    --  signal Clk_slow : std_logic; -- Internal clock
       

begin
--Slow_Clk0 : Slow_Clk 
--          port map (   
--          Clk_in => Clk, 
--          Clk_out => Clk_slow); 
           

     D_FF0 : D_FF 
          port map (   
          D => X(0), 
          Res=> R, 
          Clk => Clk,   
          Q => Y(0));  
   
     D_FF1 : D_FF 
        port map (   
        D => X(1), 
        Res=> R, 
        Clk => Clk,   
        Q => Y(1)); 
        
    D_FF2 : D_FF 
      port map (   
      D => X(2), 
      Res=> R, 
      Clk => Clk,   
      Q => Y(2)); 
                       
     
     


end Behavioral;
