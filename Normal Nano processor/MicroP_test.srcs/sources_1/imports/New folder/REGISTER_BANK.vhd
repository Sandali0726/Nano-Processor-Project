----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 01:48:18 PM
-- Design Name: 
-- Module Name: REGISTER_BANK - Behavioral
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

entity REGISTER_BANK is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           CLK : in STD_LOGIC;
           Reset:in std_logic;
           M : in STD_LOGIC_VECTOR (2 downto 0);
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0));
end REGISTER_BANK;

architecture Behavioral of REGISTER_BANK is
component Reg_D_FF is
    Port ( D : in STD_LOGIC_vector(3 downto 0);
           clk : in STD_LOGIC;
           EN:in std_logic;
           Reset:in std_logic;
           Q : out STD_LOGIC_vector(3 downto 0);
           Qbar : out STD_LOGIC_vector(3 downto 0));
           
end component;
component Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;
--COMPONENT Slow_Clk is
--    Port ( Clk_in : in STD_LOGIC;
--           Clk_out : out STD_LOGIC);
--end COMPONENT;
--signal Y:std_logic_vector(2 downto 0);
signal F:std_logic_vector(3 downto 0);
SIGNAL EN0,EN1,EN2,EN3,EN4,EN5,EN6,EN7,SLOWCLK: STD_LOGIC;
begin
--F(0)<=D(0)AND D(0) ;
--F(1)<=D(1)AND D(1)  ;
--F(2)<=D(2)AND D(2)  ;
--F(3)<=D(3)AND D(3)  ;


F<=D;

REG0: Reg_D_FF
port map(
D=>"0000",
EN=>EN0,
Clk=>CLK,
Reset=>Reset,
Q=>R0
);

REG1: Reg_D_FF
port map(
D=>F,
EN=>EN1,
Clk=>CLK,
Reset=>Reset,
Q=>R1
);

REG2: Reg_D_FF
port map(
D=>F,
EN=>EN2,
Clk=>CLK,
Reset=>Reset,
Q=>R2
);

REG3: Reg_D_FF
port map(
D=>F,
EN=>EN3,
Clk=>CLK,
Reset=>Reset,
Q=>R3
);

REG4: Reg_D_FF
port map(
D=>F,
EN=>EN4,
Clk=>CLK,
Reset=>Reset,
Q=>R4
);

REG5: Reg_D_FF
port map(
D=>F,
EN=>EN5,
Clk=>CLK,
Reset=>Reset,
Q=>R5
);

REG6: Reg_D_FF
port map(
D=>F,
EN=>EN6,
Clk=>CLK,
Reset=>Reset,
Q=>R6
);

REG7: Reg_D_FF
port map(
D=>F,
EN=>EN7,
Clk=>CLK,
Reset=>Reset,
Q=>R7
);
DECODER:Decoder_3_to_8
PORT MAP(
I=>M,
EN=>'1',
Y(0)=>EN0,
Y(1)=>EN1,
Y(2)=>EN2,
Y(3)=>EN3,
Y(4)=>EN4,
Y(5)=>EN5,
Y(6)=>EN6,
Y(7)=>EN7)
;
--CLOCK:Slow_Clk
--port map(
--Clk_in=>clk,
--Clk_out=>slowclk);
end Behavioral;
