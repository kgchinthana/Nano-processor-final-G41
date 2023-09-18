----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/27/2022 09:05:33 PM
-- Design Name: 
-- Module Name: TB_ROM - Behavioral
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

entity TB_ROM is
--  Port ( );
end TB_ROM;

architecture Behavioral of TB_ROM is

component ROM
    Port ( Mem_Select : in STD_LOGIC_VECTOR (2 downto 0);
       instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;

signal Mem_Select : STD_LOGIC_VECTOR (2 downto 0);
signal instruction : STD_LOGIC_VECTOR (11 downto 0);

begin
UUT: ROM
    PORT MAP(
    Mem_Select => Mem_Select,
    instruction => instruction);

process
begin
    Mem_Select <= "000";
    wait for 125ns;
    
    Mem_Select <= "001";
    wait for 125ns;
    
    Mem_Select <= "010";
    wait for 125ns;
    
    Mem_Select <= "011";
    wait for 125ns;
    
    Mem_Select <= "100";
    wait for 125ns;
    
    Mem_Select <= "101";
    wait for 125ns;
    
    Mem_Select <= "110";
    wait for 125ns;
    
    Mem_Select <= "111";
    wait;
    
end process;
end Behavioral;

