----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 12:25:43 PM
-- Design Name: 
-- Module Name: mux_2_1 - Behavioral
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

entity mux_2_1_add_sub is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           S : in STD_LOGIC;
           Y : out STD_LOGIC);
end mux_2_1_add_sub;

architecture Behavioral of mux_2_1_add_sub is

begin

Y <= (A0 AND NOT(S)) OR (A1 AND S);

end Behavioral;
