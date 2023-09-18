----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/30/2022 01:27:28 AM
-- Design Name: 
-- Module Name: TB_Register_Bank - Behavioral
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

entity TB_Register_Bank is
--  Port ( );
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is

component Register_Bank
    Port ( Data : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Enable : in STD_LOGIC_VECTOR (2 downto 0);
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Data,R0,R1,R2,R3,R4,R5,R6,R7: STD_LOGIC_VECTOR (3 downto 0);
signal Reset : STD_LOGIC := '0';
signal Clk : STD_LOGIC := '1';
signal Enable : STD_LOGIC_VECTOR (2 downto 0);

begin
UUT: Register_Bank
    PORT MAP(
        Data => Data,
        Enable => Enable,
        CLK => CLK,
        Reset => Reset,
        R0 => R0,
        R1 => R1,
        R2 => R2,
        R3 => R3,
        R4 => R4,
        R5 => R5,
        R6 => R6,
        R7 => R7);
        
 process
    begin
        Clk <= not Clk;
        wait for 50ns;
 end process;

process
    begin
        --200546G
        --0011 0000 1111 0110 0010
        --000 110 000 111 101 100 010
        Reset <= '1';
        wait for 100ns;
        
        Reset <= '0';
        Enable <= "010";
        Data <= "0010";
        wait for 100ns;

        Reset <= '0';
        
        Enable <= "100";
        Data <= "0110";
        wait for 100ns;

        Reset <= '0';
        
        Enable <= "101";
        Data <= "1111";
        wait for 100ns;
        
        Reset <= '0';
        
        Enable <= "111";
        Data <= "0000";
        wait for 100ns;

        Reset <= '0';
        
        Enable <= "110";
        Data <= "0011";
        wait for 100ns;
        
        Reset <= '0';
        
        Enable <= "001";
        Data <= "0110";
        wait for 100ns;
        
        Reset <= '0';
        
        Enable <= "011";
        Data <= "0111";
        wait for 100ns;

        Reset <= '1';
        wait for 100ns;
end process;                                        
end Behavioral;