----------------------------------------------------------------------------------
-- Company: 
-- Engineer: P.D.N.T.Paramulla
-- 
-- Create Date: 07/22/2022 04:06:11 AM
-- Design Name: 4 bit add sub unit
-- Module Name: Add_Sub_TB - Behavioral
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

entity Add_Sub_TB is
--  Port ( );
end Add_Sub_TB;

architecture Behavioral of Add_Sub_TB is
component Add_Sub
    Port ( add_sub_A : in STD_LOGIC_VECTOR (3 downto 0);
           add_sub_B : in STD_LOGIC_VECTOR (3 downto 0);
           add_sub_out : out STD_LOGIC_VECTOR (3 downto 0);
           add_sub_sel : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
           
end component;
  signal add_sub_A, add_sub_B, add_sub_out : STD_LOGIC_VECTOR(3 downto 0);
  signal add_sub_sel,Overflow,Zero : STD_LOGIC;

begin
    UUT: add_sub
    Port map(add_sub_A => add_sub_A,
             add_sub_B => add_sub_B,
             add_sub_out =>add_sub_out,
             add_sub_sel => add_sub_sel,
             Overflow => Overflow,
             Zero=>Zero);
process
begin
    add_sub_sel <= '0';--for sub
    add_sub_A <= "0110";
    add_sub_B <= "0010";
    wait for 100ns;
    
    add_sub_sel <= '1'; --for add
    add_sub_A <= "1111";
    add_sub_B <= "0001";
    wait;
    
end process;  
end Behavioral;
