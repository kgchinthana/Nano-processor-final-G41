----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/18/2022 11:01:27 PM
-- Design Name: 
-- Module Name: Slow_clk_TB - Behavioral
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

entity Slow_clk_TB is
--  Port ( );
end Slow_clk_TB;

architecture Behavioral of Slow_clk_TB is
component Slow_clk
Port (Clk_in : in STD_LOGIC;
      Clk_out : out STD_LOGIC);
end component;

signal Clk_in : STD_LOGIC :='0';
signal Clk_out: STD_LOGIC;
begin
   UUT: Slow_Clk
   PORT MAP(
         Clk_in =>Clk_in,
         Clk_out =>Clk_out);
     
 process
 begin
     wait for 20ns;   
     Clk_in <= NOT(Clk_in);      
     end process;
     
end Behavioral;
