----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/26/2022 09:52:22 AM
-- Design Name: 
-- Module Name: TB_MUX_2_3 - Behavioral
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

entity TB_MUX_2_3 is
--  Port ( );
end TB_MUX_2_3;

architecture Behavioral of TB_MUX_2_3 is
component mux_2_3_x
Port ( mux_2_3_A : in STD_LOGIC_VECTOR (2 downto 0);
       mux_2_3_B : in STD_LOGIC_VECTOR (2 downto 0);
       mux_2_3_C0 : in STD_LOGIC;
       mux_2_3_Q : out STD_LOGIC_VECTOR (2 downto 0));

end component;

signal A,B : STD_LOGIC_VECTOR (2 downto 0);
signal C0 : STD_LOGIC;
signal Q0 : STD_LOGIC_VECTOR (2 downto 0);

begin
UUT: mux_2_3_x
PORT MAP(
mux_2_3_A => A,
mux_2_3_B => B,
mux_2_3_C0 => C0,
mux_2_3_Q => Q0);

process
    begin
    A <= "000";
    B <= "111";
    C0 <= '0';
    wait for 20ns;
    C0 <= '1';
    wait;
end process;
end Behavioral;
