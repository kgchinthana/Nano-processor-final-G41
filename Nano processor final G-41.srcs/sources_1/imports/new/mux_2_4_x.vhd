----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 12:41:19 PM
-- Design Name: 
-- Module Name: mux_2_4 - Behavioral
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

entity mux_2_4 is
    Port ( mux_2_4_A : in STD_LOGIC_VECTOR (3 downto 0);
           mux_2_4_B : in STD_LOGIC_VECTOR (3 downto 0);
           mux_2_4_C0 : in STD_LOGIC;
           mux_2_4_Q : out STD_LOGIC_VECTOR (3 downto 0));
end mux_2_4;

architecture Behavioral of mux_2_4 is

component mux_2_1_x
port(A0 : in STD_LOGIC;
     A1 : in STD_LOGIC;
     S : in STD_LOGIC;
     Y : out STD_LOGIC);
end component;

begin

mux_2_1_0: mux_2_1_x
    port map(
    A0 => mux_2_4_A(0),
    A1 => mux_2_4_B(0),
    S => mux_2_4_C0,
    Y => mux_2_4_Q(0));
    
mux_2_1_1: mux_2_1_x
    port map(
    A0 => mux_2_4_A(1),
    A1 => mux_2_4_B(1),
    S => mux_2_4_C0,
    Y => mux_2_4_Q(1));
    
mux_2_1_2: mux_2_1_x
    port map(
    A0 => mux_2_4_A(2),
    A1 => mux_2_4_B(2),
    S => mux_2_4_C0,
    Y => mux_2_4_Q(2));
        
mux_2_1_3: mux_2_1_x
    port map(
    A0 => mux_2_4_A(3),
    A1 => mux_2_4_B(3),
    S => mux_2_4_C0,
    Y => mux_2_4_Q(3));
    
end Behavioral;
