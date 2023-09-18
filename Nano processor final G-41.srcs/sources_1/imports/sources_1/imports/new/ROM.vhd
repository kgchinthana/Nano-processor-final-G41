----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 01:26:48 PM
-- Design Name: 
-- Module Name: ROM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port ( Mem_Select : in STD_LOGIC_VECTOR (2 downto 0);
           instruction : out STD_LOGIC_VECTOR (11 downto 0));
end ROM;

architecture Behavioral of ROM is

type rom_type is array(0 to 7) of STD_LOGIC_VECTOR(11 downto 0);

    signal Program_ROM : rom_type := (
        "100010000010", --MOVI R1, 2 
        "100100000011", --MOVI R2, 3 
        "101110000001", --MOVI R7, 1 
         "001110010000", --ADD R7, R1 ; R7 = R7 + R1
         "001110100000", --ADD R7, R2 ; R7 = R7 + R2
         "000000000000", 
         "110000000110",--JZR R0, 6 ; If R0 = 0 jump to line 6(for infinite loop)
         "000000000000"
);
begin

instruction <= Program_ROM(to_integer(unsigned(Mem_Select)));
end Behavioral;
