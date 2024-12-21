
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 02:46:58 PM
-- Design Name: 
-- Module Name: Register - Behavioral
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

entity Reg_D_FF is
    Port ( D : in STD_LOGIC_vector(3 downto 0);
           clk : in STD_LOGIC;
           Reset:in std_logic;
           EN:in std_logic;
           Q : out STD_LOGIC_vector(3 downto 0);
          Qbar : out STD_LOGIC_vector(3 downto 0)
          );
            
end Reg_D_FF;

architecture Behavioral of Reg_D_FF is
component D_FF is
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC
           );
end component;
signal D0,D1,D2,D3,Q0,Q1,Q2,Q3: STD_LOGIC;

begin
FF0:D_FF
port map(
D=>D0,
Clk=>Clk,
Res=>Reset,
Q=>Q0,
Qbar=>Qbar(0)
);

FF1:D_FF
port map(
D=>D1,
Clk=>Clk,
Res=>Reset,
Q=>Q1,
Qbar=>Qbar(0)
);

FF2:D_FF
port map(
D=>D2,
Clk=>Clk,
Res=>Reset,
Q=>Q2,
Qbar=>Qbar(0)
);

FF3:D_FF
port map(
D=>D3,
Clk=>Clk,
Res=>Reset,
Q=>Q3,
Qbar=>Qbar(3)
);

Q(0)<=Q0;
Q(1)<=Q1;
Q(2)<=Q2;
Q(3)<=Q3;

D0<=(D(0) AND EN) Or (not EN AND Q0);
D1<=(D(1) AND EN) Or (not EN AND Q1);
D2<=(D(2) AND EN) Or (not EN AND Q2);
D3<=(D(3) AND EN) Or (not EN AND Q3);





end Behavioral;







