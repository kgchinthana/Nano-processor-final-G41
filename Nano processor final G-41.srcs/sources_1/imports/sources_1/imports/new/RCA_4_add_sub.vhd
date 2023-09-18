----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2022 09:13:12 PM
-- Design Name: 
-- Module Name: RCA - Behavioral
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

entity RCA_4_add_sub is
Port (
Ax : in STD_LOGIC_VECTOR(3 downto 0);
Bx : in STD_LOGIC_VECTOR(3 downto 0);
C_in : in STD_LOGIC;
result : out STD_LOGIC_VECTOR(3 downto 0);
C_out : out STD_LOGIC;
C_out_FA3: out STD_LOGIC);

end RCA_4_add_sub;

architecture Behavioral of RCA_4_add_sub is

component FA
port (
    A: in std_logic;
    B: in std_logic;
    C_in: in std_logic;
    S: out std_logic;
    C_out: out std_logic);
end component;
SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C
: std_logic;
begin

FA_0 : FA
port map (
    A => Ax(0),
    B => Bx(0),
    C_in => C_in, -- Set to ground
    S => result(0),
    C_Out => FA0_C);
    
FA_1 : FA
port map (
    A => Ax(1),
    B => Bx(1),
    C_in => FA0_C,
    S => result(1),
    C_Out => FA1_C);
    
FA_2 : FA
port map (
    A => Ax(2),
    B => Bx(2),
    C_in => FA1_C,
    S => result(2),
    C_Out => FA2_C);
    
FA_3 : FA
port map (
    A => Ax(3),
    B => Bx(3),
    C_in => FA2_C,
    S => result(3),
    C_Out => C_out);
 
C_out_FA3 <= FA2_C; 
end Behavioral;