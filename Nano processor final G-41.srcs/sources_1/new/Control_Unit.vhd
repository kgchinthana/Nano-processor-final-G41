----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/04/2022 12:11:42 AM
-- Design Name: 
-- Module Name: Control_Unit - Behavioral
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

entity Control_Unit is
    Port ( Clk_in : in STD_LOGIC;
           Reset_in : in STD_LOGIC;
           Seven_seg_out : out STD_LOGIC_VECTOR (6 downto 0);
           Led_out : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow_out : out STD_LOGIC;
           Zero_out : out STD_LOGIC;
           Anode:out STD_LOGIC_VECTOR (3 downto 0)
           );
end Control_Unit;

architecture Behavioral of Control_Unit is

component Nano_processor
           Port ( Clk : in STD_LOGIC;
                  Reset0 : in STD_LOGIC;
                  Sev_seg : out STD_LOGIC_VECTOR (3 downto 0);
                  Zero0 : out STD_LOGIC;
                  Overflow0 : out STD_LOGIC;
                  To_LED : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component LUT_16_7
            Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
                   data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal data: STD_LOGIC_VECTOR (6 downto 0);
signal Zero0,Overflow0:STD_LOGIC;
signal To_LED,Sev_seg: STD_LOGIC_VECTOR (3 downto 0);

begin
Nano_processor_0:Nano_processor
        Port map( Clk => Clk_in,
                  Reset0 => Reset_in,
                  Sev_seg => Sev_seg,
                  Zero0 => Zero0,
                  Overflow0 => Overflow0,
                  To_LED => To_LED );

LUT_16_7_0:LUT_16_7
        Port map(address => Sev_seg,
                 data => data
                 );

Seven_seg_out <= data;
Led_out <= To_LED;
Overflow_out <= Overflow0;
Zero_out <= Zero0;
Anode <= "1110";

end Behavioral;

