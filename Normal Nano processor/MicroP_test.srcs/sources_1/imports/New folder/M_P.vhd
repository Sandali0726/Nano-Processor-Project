----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 08:54:15 PM
-- Design Name: 
-- Module Name: M_P - Behavioral
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

entity M_P is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Op_Led : out STD_LOGIC_VECTOR (3 downto 0);
           Over_Flow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           anode:out STD_LOGIC_VECTOR (3 downto 0);
           Sev_7Seg :out STD_LOGIC_VECTOR (6 downto 0));
end M_P;



architecture Behavioral of M_P is

component REGISTER_BANK 
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
end component;

COMPONENT AddSub
Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
          -- C_in : in STD_LOGIC;
           AOS,AOS_EN : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_Out : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Over_flow : out STD_LOGIC);
END COMPONENT;

COMPONENT MUX_2_WAY_4_BIT
 Port ( X : in STD_LOGIC_VECTOR (3 downto 0);
          Y : in STD_LOGIC_VECTOR (3 downto 0);
          Z : out STD_LOGIC_VECTOR (3 downto 0);
          S : in STD_LOGIC);

END COMPONENT;


COMPONENT Mux_8_way_4
 Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
          B : in STD_LOGIC_VECTOR (3 downto 0);
          C : in STD_LOGIC_VECTOR (3 downto 0);
          D : in STD_LOGIC_VECTOR (3 downto 0);
          E : in STD_LOGIC_VECTOR (3 downto 0);
          F : in STD_LOGIC_VECTOR (3 downto 0);
          G : in STD_LOGIC_VECTOR (3 downto 0);
          H : in STD_LOGIC_VECTOR (3 downto 0);
          S : in STD_LOGIC_VECTOR (2 downto 0);
          Y : out STD_LOGIC_VECTOR (3 downto 0));

END COMPONENT;

COMPONENT ROM
 Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
          I : out STD_LOGIC_VECTOR (11 downto 0));

END COMPONENT;

COMPONENT Adder_3_bit is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0));
end COMPONENT;

COMPONENT MUX_2_WAY_3_Bit is
    Port ( X : in STD_LOGIC_VECTOR (2 downto 0);
           Y : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (2 downto 0));
end COMPONENT;

COMPONENT PC is
    Port ( X : in STD_LOGIC_VECTOR (2 downto 0);
           R : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end COMPONENT;

COMPONENT Seven_Seg is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
          -- Clk : in STD_LOGIC;          
           S_LED : out STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           anode:out STD_LOGIC_VECTOR (3 downto 0)
          );
end COMPONENT;

COMPONENT Inst_Decoder is
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
end COMPONENT;

COMPONENT Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end COMPONENT;

SIGNAL I,ROM_OUT: STD_LOGIC_VECTOR (11 downto 0);
SIGNAL RE,RegSel_1,RegSel_2,RS_2,Address_To_Jump,PC_OUT,A,Adder_3_OUT,address,A_Jump,A_out,Z_out:STD_LOGIC_VECTOR (2 downto 0);
SIGNAL LS,Add_Or_Sub,Jump_Flag,Reset,R,RegSel,Clk_out,Load_Select,Jump_F,AOS_EN:STD_LOGIC;
SIGNAL ID_OUT,Ch_FJ,X,S_LED,way8_4bit_Mux1_out,way8_4bit_Mux2_out,bit_4_out,Data_in,Data_out,Adder_OUT:STD_LOGIC_VECTOR (3 downto 0);
Signal Mux_out,R0_OUT,R1_OUT,R2_OUT,R3_OUT,R4_OUT,R5_OUT,R6_OUT,R7_OUT : STD_LOGIC_VECTOR (3 downto 0);
Signal Reg_enable,register_select : STD_LOGIC_VECTOR (2 downto 0);
--SIGNAL S_7Seg,Sev_7Seg:STD_LOGIC_VECTOR (6 downto 0);

begin
Instruction_Decoder:Inst_Decoder
port map(
    I=>ROM_OUT,
    RE=>Reg_enable,
    LS=>Load_Select,
    AOSE=>AOS_EN,
    D=>ID_OUT,
    RS_1=>RegSel_1,
    RS_2=>RegSel_2,
    AOS=>Add_Or_Sub,
    Ch_FJ=>way8_4bit_Mux1_out,
    JF=>Jump_Flag,
    Ad_TJ=>Address_To_Jump
);
Reg_bank: REGISTER_BANK 
port map(
           D =>Data_out,
           CLK => Clk_out,
           Reset=>Res,
           M =>Reg_enable,
           R0=> R0_OUT,
           R1 =>R1_OUT,
           R2 =>R2_OUT,
           R3 =>R3_OUT,
           R4 =>R4_OUT,
           R5 =>R5_OUT,
           R6 =>R6_OUT,
           R7 =>R7_OUT);

Program_Counter: PC
PORT MAP(
   X=>Z_out,
   R=>Res,
   Clk=>Clk_out,
   Y=>PC_OUT 
);  

BIT_3_Adder:Adder_3_bit
PORT MAP
(
    A=>PC_OUT,
    S=>Adder_3_OUT
    
);   
Seven_Segment:Seven_Seg
port map(
A =>R7_OUT,

anode=>anode, 
S_LED => S_LED,           
S_7Seg => Sev_7Seg
 );   
   
-- Sev_7Seg<=S_7Seg;
 Mux8_way_4bit_1 : Mux_8_way_4
  port map(
             A => R0_OUT,
             B =>R1_OUT,
             C =>R2_OUT,
             D =>R3_OUT,
             E =>R4_OUT,
             F =>R5_OUT,
             G =>R6_OUT,
             H =>R7_OUT,
             S =>RegSel_1,
             Y =>way8_4bit_Mux1_out
  );
  Mux8_way_4bit_2 : Mux_8_way_4
   port map(
              A => R0_OUT,
              B =>R1_OUT,
              C =>R2_OUT,
              D =>R3_OUT,
              E =>R4_OUT,
              F =>R5_OUT,
              G =>R6_OUT,
              H =>R7_OUT,
              S =>RegSel_2,
              Y =>way8_4bit_Mux2_out
   );  
   
ROM_1:ROM
  PORT MAP(
    address=>PC_OUT,
    I=>ROM_OUT
  );    
  
 Slow_Clock: Slow_Clk
 port map (
      Clk_in=>Clk,
      Clk_out=>Clk_out        
 );    
 
 MUX_2_4 : MUX_2_WAY_4_BIT
 port map(
    X => Adder_OUT,
    Y => ID_OUT,
    S => Load_Select,
    Z => Data_out);
    
adder_subs :AddSub
      port map(
                 A0 =>way8_4bit_Mux2_out(0),
                 A1 =>way8_4bit_Mux2_out(1),
                 A2 =>way8_4bit_Mux2_out(2),
                 A3 =>way8_4bit_Mux2_out(3),
                 B0 =>way8_4bit_Mux1_out(0),
                 B1 =>way8_4bit_Mux1_out(1),
                 B2 =>way8_4bit_Mux1_out(2),
                 B3 =>way8_4bit_Mux1_out(3),
                -- C_in=> '0',
                 AOS_EN=>AOS_EN,
                 AOS =>Add_Or_Sub,
                 S0 =>Adder_OUT(0),
                 S1 =>Adder_OUT(1),
                 S2 =>Adder_OUT(2),
                 S3 =>Adder_OUT(3),
                 --C_Out => out STD_LOGIC;
                 Zero =>Zero,
                 Over_flow => Over_Flow
      );
      
MUX_2_3_Bit : MUX_2_WAY_3_Bit
          port map(  
                 
                 X => Adder_3_OUT,
                 Y=>Address_To_Jump,
                 S => Jump_Flag,
                 Z =>  Z_out);    
                 
 Op_Led<=  S_LED;                
end Behavioral;
