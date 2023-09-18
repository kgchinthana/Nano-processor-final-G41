----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 03:45:53 PM
-- Design Name: 
-- Module Name: mux_8_4 - Behavioral
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

entity mux_8_4_x is
Port ( mux_8_4_R0 : in STD_LOGIC_VECTOR (3 downto 0);
       mux_8_4_R1 : in STD_LOGIC_VECTOR (3 downto 0);
       mux_8_4_R2 : in STD_LOGIC_VECTOR (3 downto 0);
       mux_8_4_R3 : in STD_LOGIC_VECTOR (3 downto 0);
       mux_8_4_R4 : in STD_LOGIC_VECTOR (3 downto 0);
       mux_8_4_R5 : in STD_LOGIC_VECTOR (3 downto 0);
       mux_8_4_R6 : in STD_LOGIC_VECTOR (3 downto 0);
       mux_8_4_R7 : in STD_LOGIC_VECTOR (3 downto 0);
       mux_8_4_S : in STD_LOGIC_VECTOR (2 downto 0);
       --mux_8_4_EN : in STD_LOGIC;
       mux_8_4_Q : out STD_LOGIC_VECTOR (3 downto 0));
end mux_8_4_x;

architecture Behavioral of mux_8_4_x is

component Mux_x
    port(D : in STD_LOGIC_VECTOR (7 downto 0);
         S : in STD_LOGIC_VECTOR (2 downto 0);
         EN : in STD_LOGIC;
         Y : out STD_LOGIC);
end component;

begin
    mux_8_4_0:Mux_x
    port map(
    D(0) => mux_8_4_R0(0),
    D(1) => mux_8_4_R1(0),
    D(2) => mux_8_4_R2(0),
    D(3) => mux_8_4_R3(0),
    D(4) => mux_8_4_R4(0),
    D(5) => mux_8_4_R5(0),
    D(6) => mux_8_4_R6(0),
    D(7) => mux_8_4_R7(0),
    
    S =>mux_8_4_S,
    EN => '1',
    Y => mux_8_4_Q(0));
    
    mux_8_4_1:Mux_x
    port map(
    D(0) => mux_8_4_R0(1),
    D(1) => mux_8_4_R1(1),
    D(2) => mux_8_4_R2(1),
    D(3) => mux_8_4_R3(1),
    D(4) => mux_8_4_R4(1),
    D(5) => mux_8_4_R5(1),
    D(6) => mux_8_4_R6(1),
    D(7) => mux_8_4_R7(1),
 
    S =>mux_8_4_S,
    EN => '1',
    Y =>mux_8_4_Q(1));
    
    mux_8_4_2:Mux_x
    port map(
    D(0) => mux_8_4_R0(2),
    D(1) => mux_8_4_R1(2),
    D(2) => mux_8_4_R2(2),
    D(3) => mux_8_4_R3(2),
    D(4) => mux_8_4_R4(2),
    D(5) => mux_8_4_R5(2),
    D(6) => mux_8_4_R6(2),
    D(7) => mux_8_4_R7(2),
    
    S =>mux_8_4_S,
    EN => '1',
    Y => mux_8_4_Q(2));
    
    mux_8_4_3:Mux_x
    port map(
    D(0) => mux_8_4_R0(3),
    D(1) => mux_8_4_R1(3),
    D(2) => mux_8_4_R2(3),
    D(3) => mux_8_4_R3(3),
    D(4) => mux_8_4_R4(3),
    D(5) => mux_8_4_R5(3),
    D(6) => mux_8_4_R6(3),
    D(7) => mux_8_4_R7(3),
    
    S =>mux_8_4_S,
    EN =>'1',
    Y => mux_8_4_Q(3));

end Behavioral;
