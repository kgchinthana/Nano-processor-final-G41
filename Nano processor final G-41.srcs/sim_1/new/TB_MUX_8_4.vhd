----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/26/2022 08:44:18 AM
-- Design Name: 
-- Module Name: TB_MUX_8_4 - Behavioral
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

entity TB_MUX_8_4 is
--  Port ( );
end TB_MUX_8_4;

architecture Behavioral of TB_MUX_8_4 is
component mux_8_4
port(R0 : in STD_LOGIC_VECTOR (3 downto 0);
     R1 : in STD_LOGIC_VECTOR (3 downto 0);
     R2 : in STD_LOGIC_VECTOR (3 downto 0);
     R3 : in STD_LOGIC_VECTOR (3 downto 0);
     R4 : in STD_LOGIC_VECTOR (3 downto 0);
     R5 : in STD_LOGIC_VECTOR (3 downto 0);
     R6 : in STD_LOGIC_VECTOR (3 downto 0);
     R7 : in STD_LOGIC_VECTOR (3 downto 0);
     S : in STD_LOGIC_VECTOR (2 downto 0);
     EN : in STD_LOGIC;
     Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal R0,R1,R2,R3,R4,R5,R6,R7 : STD_LOGIC_VECTOR (3 downto 0);
signal  S :  STD_LOGIC_VECTOR (2 downto 0);
signal  EN : STD_LOGIC;
signal  Q :  STD_LOGIC_VECTOR (3 downto 0);

begin
UUT: mux_8_4
PORT MAP(
R0 => R0,
R1 => R1,
R2 => R2,
R3 => R3,
R4 => R4,
R5 => R5,
R6 => R6,
R7 => R7,
S => S,
EN => EN,
Q => Q);

process
    begin
    EN <= '1';
    R0 <="0000";
    R1 <="0001";
    R2 <="0010";
    R3 <="0011";
    R4 <="0100";
    R5 <="0101";
    R6 <="0110";
    R7 <="0111";
    S <= "000";
    wait for 20ns;
    S <= "001";
    wait for 20ns;
    S <= "010";
    wait for 20ns;
    S <= "011";
    wait for 20ns;
    S <= "100";
    wait for 20ns;
    S <= "101";
    wait for 20ns;
    S <= "110";
    wait for 20ns;
    S <= "111";
    wait;
end process;
end Behavioral;
