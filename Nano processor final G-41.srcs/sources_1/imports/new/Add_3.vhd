----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 11:20:45 PM
-- Design Name: 
-- Module Name: Add_3 - Behavioral
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

entity Add_3 is
    Port ( Add3_A : in STD_LOGIC_VECTOR (2 downto 0);
           Add3_B : in STD_LOGIC_VECTOR (2 downto 0);
           Add3_C_in : in STD_LOGIC;
           Add3_S : out STD_LOGIC_VECTOR (2 downto 0);
           Add3_C_out : out STD_LOGIC);
end Add_3;

architecture Behavioral of Add_3 is
component FA 
     port ( 
         A: in std_logic; 
         B: in std_logic; 
         C_in: in std_logic; 
         S: out std_logic; 
         C_out: out std_logic); 
end component;
signal FA0_C,FA1_C,FA2_C: STD_LOGIC;
signal B0,B1,B2: STD_LOGIC_VECTOR (2 downto 0);
begin 
 FA_0 : FA 
    port map ( 
        A => Add3_A(0), 
        B => Add3_B(0), 
        C_in => '0',
        S => Add3_S(0),
        C_Out => FA0_C);
 FA_1 : FA 
    port map ( 
         A => Add3_A(1), 
         B => Add3_B(1), 
         C_in => FA0_C, 
         S => Add3_S(1), 
         C_Out => FA1_C); 
 FA_2 : FA 
    port map ( 
         A => Add3_A(2), 
         B => Add3_B(2), 
         C_in => FA1_C, 
         S => Add3_S(2), 
         C_Out => Add3_C_Out); 
end Behavioral;
