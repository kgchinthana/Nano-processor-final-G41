----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/22/2022 02:03:25 AM
-- Design Name: 
-- Module Name: Add_Sub - Behavioral
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

entity Add_Sub is
    Port ( add_sub_A : in STD_LOGIC_VECTOR (3 downto 0);
           add_sub_B : in STD_LOGIC_VECTOR (3 downto 0);
           add_sub_out : out STD_LOGIC_VECTOR (3 downto 0);
           add_sub_sel : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end Add_Sub;

architecture Behavioral of Add_Sub is

component mux_2_4_add_sub
    Port( Mux_A : in STD_LOGIC_VECTOR (3 downto 0);
          Mux_B : in STD_LOGIC_VECTOR (3 downto 0);
          NegMux : in STD_LOGIC;
          Mux_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component RCA_4_add_sub
    Port (  Ax : in STD_LOGIC_VECTOR(3 downto 0);
            Bx : in STD_LOGIC_VECTOR(3 downto 0);
            C_in : in STD_LOGIC;
            result : out STD_LOGIC_VECTOR(3 downto 0);
            C_out : out STD_LOGIC;
            C_out_FA3: out STD_LOGIC);
end component;

signal  not_add_sub_B, Mux_out,Result: STD_LOGIC_VECTOR (3 downto 0);
signal C_out,Neg,AS,C_out_FA3:std_logic;

begin
mux_2_4_add_sub_0:mux_2_4_add_sub
    PORT MAP(Mux_A => add_sub_B,
             Mux_B => not_add_sub_B,
             NegMux => Neg,
             Mux_out => Mux_out);

RCA_0:RCA_4_add_sub
    PORT MAP(Ax => add_sub_A,
             Bx => Mux_out,
             C_in =>AS,
             result => result,
             C_out => C_out,
             C_out_FA3 => C_out_FA3
             ); 


process(add_sub_sel)
    begin
    if (add_sub_sel='0') then
        AS<='0';
        Neg<='0'; --not sure
     else 
        AS<='1';
        Neg<='1'; --not sure
     end if;
end process;
   
not_add_sub_B <= NOT(add_sub_B);
add_sub_out <= result;
Zero <= NOT(result(0) OR result(1) OR result(2) OR result(3));
--Overflow <= C_out_FA3 XOR C_out;
Overflow <= C_out;
end Behavioral;
