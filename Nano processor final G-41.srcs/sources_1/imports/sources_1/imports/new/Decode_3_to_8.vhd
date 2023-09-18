----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2022 05:50:00 PM
-- Design Name: 
-- Module Name: Decode_3_to_8 - Behavioral
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

entity Decode_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Decode_3_to_8;

architecture Behavioral of Decode_3_to_8 is

component Decoder_2_to_4
PORT (I : in STD_LOGIC_VECTOR (1 downto 0);
          EN : in STD_LOGIC;
          Y : out STD_LOGIC_VECTOR (3 downto 0)
);
end component;

signal I0,I1 : STD_LOGIC_VECTOR( 1 downto 0);
signal Y0, Y1: STD_LOGIC_VECTOR(3 downto 0);
signal EN0,EN1,I2: STD_LOGIC;

begin
Decoder_2_to_4_0 : Decoder_2_to_4
PORT MAP(
I => I0,
EN =>EN0,
Y=>Y0);

Decoder_2_to_4_1 : Decoder_2_to_4
PORT MAP(
I =>I1,
EN =>EN1,
Y =>Y1);

EN0 <= NOT(I(2)) AND EN;
EN1 <= I(2) AND EN;
I0 <= I( 1 downto 0);
I1 <= I(1 downto 0);
I2 <= I(2);

Y(3 downto 0) <= Y0;
Y(7 downto 4) <= Y1;


end Behavioral;
