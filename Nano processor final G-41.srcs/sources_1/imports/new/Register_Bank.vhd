----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/30/2022 12:56:35 AM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
    Port ( Data : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Enable : in STD_LOGIC_VECTOR (2 downto 0);
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0));
end Register_Bank;

architecture Behavioral of Register_Bank is

component Decoder_3x8
    Port (  Input : in STD_LOGIC_VECTOR (2 downto 0);
            Output : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component RegX
    Port (  Data : in STD_LOGIC_VECTOR (3 downto 0);
            Enable : in STD_LOGIC;
            Clk : in STD_LOGIC;
            Reset: in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal selector : STD_LOGIC_VECTOR (7 downto 0);
begin
Decoder : Decoder_3x8
    PORT MAP (
        Input => Enable,
        Output => selector);

R0 <= "0000";

Reg_1 : RegX
    PORT MAP (
        Data => Data,
        Enable => selector(1),
        Clk => Clk,
        Reset => Reset,
        Q => R1);

Reg_2 : RegX
    PORT MAP (
        Data => Data,
        Enable => selector(2),
        Clk => Clk,
        Reset => Reset,
        Q => R2);

Reg_3 : RegX
    PORT MAP (
        Data => Data,
        Enable => selector(3),
        Clk => Clk,
        Reset => Reset,
        Q => R3);

Reg_4 : RegX
    PORT MAP (
        Data => Data,
        Enable => selector(4),
        Clk => Clk,
        Reset => Reset,
        Q => R4);

Reg_5 : RegX
    PORT MAP (
        Data => Data,
        Enable => selector(5),
        Clk => Clk,
        Reset => Reset,
        Q => R5);
        
Reg_6 : RegX
     PORT MAP (
        Data => Data,
        Enable => selector(6),
        Clk => Clk,
        Reset => Reset,
        Q => R6);
                
Reg_7 : RegX
      PORT MAP (
         Data => Data,
         Enable => selector(7),
         Clk => Clk,
         Reset => Reset,
          Q => R7);
end Behavioral;
