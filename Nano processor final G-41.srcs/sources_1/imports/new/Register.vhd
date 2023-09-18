----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/30/2022 01:05:14 AM
-- Design Name: 
-- Module Name: Register - Behavioral
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

entity RegX is
    Port (  Data : in STD_LOGIC_VECTOR (3 downto 0);
            Enable : in STD_LOGIC;
            Clk : in STD_LOGIC;
            Reset: in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR (3 downto 0));
end RegX;

architecture Behavioral of RegX is

begin
process(Clk)
    begin
        if Reset = '1' then
            Q <= "0000";
        elsif(rising_edge(Clk) and Enable = '1') then
            --if(Enable = '1') then
                Q <= Data;
            --end if;
        end if;
    end process;
end Behavioral;
