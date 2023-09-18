----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 03:15:04 PM
-- Design Name: 
-- Module Name: Program_Counter - Behavioral
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

entity Program_Counter is
    Port ( Pro_Counter_Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Pro_Counter_Address_In : in STD_LOGIC_VECTOR (2 downto 0);
           Pro_Counter_Address_Out : out STD_LOGIC_VECTOR (2 downto 0) := "000");
end Program_Counter;

architecture Behavioral of Program_Counter is

component D_FF
    port (
        D : in STD_LOGIC;   
        Res: in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC;
        Qbar : out STD_LOGIC);
end component;
    
begin

    D_FF0 : D_FF
        port map (
            D =>  Pro_Counter_Address_In(0),
            Res => Pro_Counter_Reset,
            Clk => Clk,
            Q => Pro_Counter_Address_Out(0));
            
    D_FF1 : D_FF
        port map (
            D => Pro_Counter_Address_In(1),
            Res => Pro_Counter_Reset,
            Clk => Clk,
            Q => Pro_Counter_Address_Out(1));
        
    D_FF2 : D_FF
        port map (
            D => Pro_Counter_Address_In(2),
            Res => Pro_Counter_Reset,
            Clk => Clk,
            Q => Pro_Counter_Address_Out(2));
   
end Behavioral;
