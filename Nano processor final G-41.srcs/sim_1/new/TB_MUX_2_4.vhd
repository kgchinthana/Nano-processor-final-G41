----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/26/2022 10:03:30 AM
-- Design Name: 
-- Module Name: TB_MUX_2_4 - Behavioral
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

entity TB_MUX_2_4 is
--  Port ( );
end TB_MUX_2_4;

architecture Behavioral of TB_MUX_2_4 is
component mux_2_4
Port ( mux_2_4_A : in STD_LOGIC_VECTOR (3 downto 0);
       mux_2_4_B : in STD_LOGIC_VECTOR (3 downto 0);
       mux_2_4_C0 : in STD_LOGIC;
       mux_2_4_Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A,B : STD_LOGIC_VECTOR (3 downto 0);
signal C0: STD_LOGIC;
signal Q : STD_LOGIC_VECTOR (3 downto 0);

begin
UUT : mux_2_4
    port map(
    mux_2_4_A =>A,
    mux_2_4_B=> B,
    mux_2_4_C0 =>C0,
    mux_2_4_Q => Q);

process
begin 
A <= "0000";
B <= "1111";
C0 <= '0';
wait for 20ns;
C0 <= '1';
wait;
end process;
end Behavioral;