----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/04/2022 12:40:19 AM
-- Design Name: 
-- Module Name: Control_Unit_TB - Behavioral
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

entity Control_Unit_TB is
--  Port ( );
end Control_Unit_TB;

architecture Behavioral of Control_Unit_TB is
component Control_Unit
    Port ( Clk_in : in STD_LOGIC;
           Reset_in : in STD_LOGIC;
           Seven_seg_out : out STD_LOGIC_VECTOR (6 downto 0);
           Led_out : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow_out : out STD_LOGIC;
           Zero_out : out STD_LOGIC);
end component;

signal Clk_in: STD_LOGIC:='0';
signal Reset_in,Overflow_out,Zero_out : STD_LOGIC;
signal Seven_seg_out : STD_LOGIC_VECTOR (6 downto 0);
signal Led_out : STD_LOGIC_VECTOR (3 downto 0);

begin
UUT: Control_Unit
    Port map(Clk_in => Clk_in,
            Reset_in => Reset_in,
            Seven_seg_out => Seven_seg_out,
            Led_out => Led_out,
            Overflow_out => Overflow_out,
            Zero_out => Zero_out );

process
    begin
        wait for 5ns;
        Clk_in <=NOT(Clk_in);
end process;

process
begin
    Reset_in <='1';
    wait for 140ns;
    
    Reset_in <='0';
    wait;
end process;

end Behavioral;
