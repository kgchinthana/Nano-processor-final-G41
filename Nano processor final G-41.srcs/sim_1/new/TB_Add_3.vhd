----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 11:44:04 PM
-- Design Name: 
-- Module Name: TB_Add_3 - Behavioral
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

entity TB_Add_3 is
--  Port ( );
end TB_Add_3;

architecture Behavioral of TB_Add_3 is
component Add_3
    Port ( Add3_A : in STD_LOGIC_VECTOR (2 downto 0);
           Add3_B : in STD_LOGIC_VECTOR (2 downto 0);
           Add3_C_in : in STD_LOGIC;
           Add3_S : out STD_LOGIC_VECTOR (2 downto 0);
           Add3_C_out : out STD_LOGIC);
end component;
signal B1: STD_LOGIC_VECTOR (2 downto 0);
signal S1 : STD_LOGIC_VECTOR (2 downto 0);
signal C_out :STD_LOGIC;
begin
    UUT: Add_3
        PORT MAP(
            Add3_A => "001",
            Add3_B => B1,
            Add3_C_in => '0',
            Add3_S => S1,
            Add3_C_out => C_out);
          process
            begin
                B1 <= "011";
                wait for 200ns;
                 
                B1 <= "010";
                wait for 200ns;
                
                B1 <= "111";
                wait;
                
          end process;

end Behavioral;