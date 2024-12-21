----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 11:04:26 AM
-- Design Name: 
-- Module Name: comparator - Behavioral
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

entity comparator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           equal : out STD_LOGIC;
           max_A : out STD_LOGIC;
           max_B : out STD_LOGIC);
end comparator;

architecture Behavioral of comparator is
signal X0,X1,X2,X3 : std_logic;
begin
X0<=NOT(A(0) XOR B(0));
X1<=NOT(A(1) XOR B(1));
X2<=NOT(A(2) XOR B(2));
X3<=NOT(A(3) XOR B(3));

Equal<= X0 AND X1 AND X2 AND X3;
Max_A<= (A(3) AND NOT B(3)) OR (X3 AND A(2) AND NOT B(2)) OR (X3 AND X2 AND A(1) AND NOT B(1)) OR (X3 AND X2 AND X1 AND A(0) AND NOT B(0));
Max_B<= (NOT A(3) AND B(3)) OR (X3 AND NOT A(2) AND B(2)) OR (X3 AND X2 AND NOT A(1) AND B(1)) OR (X3 AND X2 AND X1 AND NOT A(0) AND B(0));


end Behavioral;
