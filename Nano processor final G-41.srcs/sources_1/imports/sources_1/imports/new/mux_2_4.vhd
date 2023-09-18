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

entity mux_2_4_add_sub is
    Port ( Mux_A : in STD_LOGIC_VECTOR (3 downto 0);
           Mux_B : in STD_LOGIC_VECTOR (3 downto 0);
           NegMux : in STD_LOGIC;
           Mux_out : out STD_LOGIC_VECTOR (3 downto 0));
end mux_2_4_add_sub;

architecture Behavioral of mux_2_4_add_sub is

component mux_2_1_add_sub
port(A0 : in STD_LOGIC;
     A1 : in STD_LOGIC;
     S : in STD_LOGIC;
     Y : out STD_LOGIC);
end component;

begin
mux_2_1_0: mux_2_1_add_sub
    port map(
    A0 => Mux_A(0),
    A1 => Mux_B(0),
    S => NegMux,
    Y => Mux_out(0));
    
mux_2_1_1: mux_2_1_add_sub
    port map(
    A0 => Mux_A(1),
    A1 => Mux_B(1),
    S => NegMux,
    Y => Mux_out(1));
    
mux_2_1_2: mux_2_1_add_sub
    port map(
    A0 => Mux_A(2),
    A1 => Mux_B(2),
    S => NegMux,
    Y => Mux_out(2));
        
mux_2_1_3: mux_2_1_add_sub
    port map(
    A0 => Mux_A(3),
    A1 => Mux_B(3),
    S => NegMux,
    Y => Mux_out(3));
    
end Behavioral;
