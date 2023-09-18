----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/27/2022 09:51:07 PM
-- Design Name: 
-- Module Name: Program_Counter_0_TB - Behavioral
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

entity Program_Counter_0_TB is
--  Port ( );
end Program_Counter_0_TB;

architecture Behavioral of Program_Counter_0_TB is

component Program_Counter
    Port ( Pro_Counter_Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Pro_Counter_Address_In : in STD_LOGIC_VECTOR (2 downto 0);
           Pro_Counter_Address_Out : out STD_LOGIC_VECTOR (2 downto 0) := "000");
end component;

signal reset : std_logic;
signal clk : std_logic := '0';
signal address_in : std_logic_vector(2 downto 0);
signal address_out : std_logic_vector(2 downto 0);

begin

UUT : Program_Counter
    port map (
        Pro_Counter_Reset => reset,
        Clk => clk,
        Pro_Counter_Address_In => address_in,
        Pro_Counter_Address_Out => address_out
    );
    
process
begin
    wait for 5ns ;
    clk <= NOT clk;
end process;

process
begin

    reset <= '1';
    wait for 50ns;
    
    reset <= '0';
    address_in <= "000";
    wait for 100ns;
       
    address_in <= "001";
    wait for 100ns;
       
    address_in <= "010";
    wait for 100ns;

    address_in <= "011";
    wait for 100ns;  

    address_in <= "100";
    wait for 100ns;

    address_in <= "101";
    wait for 100ns;

    address_in <= "110";
    wait for 100ns;

    address_in <= "111";
    wait for 100ns;  
    
    reset <= '1';
    wait;
            
end process;
end Behavioral;