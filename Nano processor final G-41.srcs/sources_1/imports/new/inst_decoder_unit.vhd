----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/01/2022 11:41:48 PM
-- Design Name: 
-- Module Name: inst_decoder_unit - Behavioral
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

entity inst_Decoder_unit is
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
end inst_Decoder_unit;

architecture Behavioral of inst_Decoder_unit is
signal pc : STD_LOGIC ;
begin
    register_en <= inst_bus(9 downto 7);
    register_sel_A <= inst_bus(9 downto 7);
    register_sel_B <= inst_bus(6 downto 4);
    immediate_value <= inst_bus(3 downto 0);
    Addr_jump <= inst_bus(2 downto 0);
    
     
    process(check_jump)
    begin
    if(check_jump = "0000") then
        pc <= '1' ;
    else
        pc <= '0' ;
    end if;
    end process;

     load_sel<=(NOT(inst_bus(11))) OR ((inst_bus(11)) AND (inst_bus(10)));
     jump_flag <= pc AND (inst_bus(11)) AND (inst_bus(10));
     add_sub_sel <= (NOT(inst_bus(11))) AND (inst_bus(10));
     

end Behavioral;
