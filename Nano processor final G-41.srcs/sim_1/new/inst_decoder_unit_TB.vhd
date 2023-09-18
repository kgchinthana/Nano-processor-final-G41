----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/02/2022 12:39:10 AM
-- Design Name: 
-- Module Name: inst_decoder_unit_TB - Behavioral
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

entity inst_decoder_unit_TB is
--  Port ( );
end inst_decoder_unit_TB;
architecture Behavioral of inst_decoder_unit_TB is

component inst_decoder_unit
    Port ( inst_bus : in STD_LOGIC_VECTOR (11 downto 0);
           check_jump : in STD_LOGIC_VECTOR (3 downto 0);
           register_en : out STD_LOGIC_VECTOR (2 downto 0);
           register_sel_A : out STD_LOGIC_VECTOR (2 downto 0);
           register_sel_B : out STD_LOGIC_VECTOR (2 downto 0);
           immediate_value : out STD_LOGIC_VECTOR (3 downto 0);
           load_sel : out STD_LOGIC;
           jump_flag : out STD_LOGIC;
           add_sub_sel : out STD_LOGIC;
           Addr_jump : out STD_LOGIC_VECTOR (2 downto 0)
           );
end component;

signal inst_bus : STD_LOGIC_VECTOR (11 downto 0);
signal register_en,register_sel_A,register_sel_B,Addr_jump  :STD_LOGIC_VECTOR (2 downto 0);
signal immediate_value,check_jump  : STD_LOGIC_VECTOR (3 downto 0);
signal load_sel,jump_flag,add_sub_sel : STD_LOGIC;

begin
UUT:inst_decoder_unit
    PORT MAP(
          inst_bus => inst_bus,
          check_jump => check_jump,
          register_en => register_en,
          register_sel_A => register_sel_A,
          register_sel_B => register_sel_B,
          immediate_value => immediate_value,
          load_sel => load_sel,
          jump_flag => jump_flag,
          add_sub_sel => add_sub_sel,
          Addr_jump => Addr_jump
          );
process
begin
    inst_bus <= "100110000101";
    wait for 200ns;
    
    inst_bus <= "000110010000";
     wait for 200ns;
     
     inst_bus <= "011010000000";
      wait for 200ns;
      
      inst_bus <= "111110000010";
      wait;
end process;

end Behavioral;
