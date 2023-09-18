----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/03/2022 09:56:03 PM
-- Design Name: 
-- Module Name: Nano_processor - Behavioral
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

entity Nano_processor is
    Port ( Clk : in STD_LOGIC;
           Reset0 : in STD_LOGIC;
           Sev_seg : out STD_LOGIC_VECTOR (3 downto 0);
           Zero0 : out STD_LOGIC;
           Overflow0 : out STD_LOGIC;
           To_LED : out STD_LOGIC_VECTOR (3 downto 0));
end Nano_processor;

architecture Behavioral of Nano_processor is

component Slow_Clk
   Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

component Program_Counter
    Port ( Pro_Counter_Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Pro_Counter_Address_In : in STD_LOGIC_VECTOR (2 downto 0);
           Pro_Counter_Address_Out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component ROM
    Port ( Mem_Select : in STD_LOGIC_VECTOR (2 downto 0);
           instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Add_3
    Port ( Add3_A : in STD_LOGIC_VECTOR (2 downto 0);
           Add3_B : in STD_LOGIC_VECTOR (2 downto 0);
           Add3_C_in : in STD_LOGIC;
           Add3_S : out STD_LOGIC_VECTOR (2 downto 0);
           Add3_C_out : out STD_LOGIC);
end component;

component mux_2_3_x
     Port ( mux_2_3_A : in STD_LOGIC_VECTOR (2 downto 0);
          mux_2_3_B : in STD_LOGIC_VECTOR (2 downto 0);
          mux_2_3_C0 : in STD_LOGIC;
          mux_2_3_Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component inst_Decoder_unit
    Port ( inst_bus : in STD_LOGIC_VECTOR (11 downto 0);
           check_jump : in STD_LOGIC_VECTOR (3 downto 0);
           register_en : out STD_LOGIC_VECTOR (2 downto 0);
           register_sel_A : out STD_LOGIC_VECTOR (2 downto 0);
           register_sel_B : out STD_LOGIC_VECTOR (2 downto 0);
           immediate_value : out STD_LOGIC_VECTOR (3 downto 0);
           load_sel : out STD_LOGIC;
           jump_flag : out STD_LOGIC;
           add_sub_sel : out STD_LOGIC;
           Addr_jump : out STD_LOGIC_VECTOR (2 downto 0)
           );
end component;

component mux_2_4
     Port ( mux_2_4_A : in STD_LOGIC_VECTOR (3 downto 0);
          mux_2_4_B : in STD_LOGIC_VECTOR (3 downto 0);
          mux_2_4_C0 : in STD_LOGIC;
          mux_2_4_Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Register_Bank
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
end component;

component mux_8_4_x
    Port ( mux_8_4_R0 : in STD_LOGIC_VECTOR (3 downto 0);
       mux_8_4_R1 : in STD_LOGIC_VECTOR (3 downto 0);
       mux_8_4_R2 : in STD_LOGIC_VECTOR (3 downto 0);
       mux_8_4_R3 : in STD_LOGIC_VECTOR (3 downto 0);
       mux_8_4_R4 : in STD_LOGIC_VECTOR (3 downto 0);
       mux_8_4_R5 : in STD_LOGIC_VECTOR (3 downto 0);
       mux_8_4_R6 : in STD_LOGIC_VECTOR (3 downto 0);
       mux_8_4_R7 : in STD_LOGIC_VECTOR (3 downto 0);
       mux_8_4_S : in STD_LOGIC_VECTOR (2 downto 0);
       mux_8_4_Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Add_Sub
    Port ( add_sub_A : in STD_LOGIC_VECTOR (3 downto 0);
           add_sub_B : in STD_LOGIC_VECTOR (3 downto 0);
           add_sub_out : out STD_LOGIC_VECTOR (3 downto 0);
           add_sub_sel : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

signal Slow_Clk_out,Add3_C_out,jump_flag,load_sel,add_sub_sel,Overflow,Zero:STD_LOGIC;
signal mux_8_4_A_out,immediate_value,add_sub_out,mux_2_4_out,mux_8_4_B_out:STD_LOGIC_VECTOR (3 downto 0);
signal instruction:STD_LOGIC_VECTOR (11 downto 0);
signal Pro_Counter_Address_Out,Add3_out,register_en,register_sel_A,register_sel_B,mux_2_3_out,Addr_jump:STD_LOGIC_VECTOR (2 downto 0);
signal data_bus:STD_LOGIC_VECTOR (31 downto 0);
begin
Slow_Clk_0:Slow_Clk
    Port map ( Clk_in => Clk,
               Clk_out => Slow_Clk_out);

Program_Counter_0:Program_Counter
    Port map(Pro_Counter_Reset => Reset0,
             Clk => Slow_Clk_out,
             Pro_Counter_Address_In => mux_2_3_out,
             Pro_Counter_Address_Out => Pro_Counter_Address_Out);             

ROM_0:ROM
    Port map(
             Mem_Select => Pro_Counter_Address_Out,
             instruction => instruction);
             
Add_3_0:Add_3
    Port map(Add3_A => "001",
             Add3_B => Pro_Counter_Address_Out,
             Add3_C_in =>'0',
             Add3_S =>Add3_out,
             Add3_C_out =>Add3_C_out);
             
mux_2_3_x_0:mux_2_3_x
    Port map(mux_2_3_A =>Add3_out,
             mux_2_3_B =>Addr_jump,
             mux_2_3_C0 =>jump_flag,
             mux_2_3_Q => mux_2_3_out
          );   
          
inst_Decoder_unit_0:inst_Decoder_unit
    Port map(inst_bus => instruction,
           check_jump => mux_8_4_A_out,
           register_en => register_en,
           register_sel_A => register_sel_A,
           register_sel_B => register_sel_B,
           immediate_value => immediate_value,
           load_sel => load_sel,
           jump_flag => jump_flag,
           add_sub_sel => add_sub_sel,
           Addr_jump => Addr_jump
           );  
           
mux_2_4_0 :mux_2_4
    Port map(mux_2_4_A => immediate_value,
             mux_2_4_B => add_sub_out,
             mux_2_4_C0 => load_sel,
             mux_2_4_Q => mux_2_4_out
              );

Register_Bank_0:Register_Bank
    Port map(Data=>mux_2_4_out,
           Clk => Slow_Clk_out,
           Reset => Reset0,
           Enable => register_en,
           R0 => data_bus(3 downto 0),
           R1 => data_bus(7 downto 4),
           R2 => data_bus(11 downto 8),
           R3 => data_bus(15 downto 12),
           R4 => data_bus(19 downto 16),
           R5 => data_bus(23 downto 20),
           R6 => data_bus(27 downto 24),
           R7 => data_bus(31 downto 28)
           );
           
mux_8_4_x_0:mux_8_4_x
    Port map(mux_8_4_R0 => data_bus(3 downto 0),
            mux_8_4_R1 => data_bus(7 downto 4),
            mux_8_4_R2 => data_bus(11 downto 8),
            mux_8_4_R3 => data_bus(15 downto 12),
            mux_8_4_R4 => data_bus(19 downto 16),
            mux_8_4_R5 => data_bus(23 downto 20),
            mux_8_4_R6 => data_bus(27 downto 24),
            mux_8_4_R7 => data_bus(31 downto 28),
            mux_8_4_S => register_sel_A,
            mux_8_4_Q => mux_8_4_A_out
       );
       
mux_8_4_x_1:mux_8_4_x
      Port map(mux_8_4_R0 => data_bus(3 downto 0),
               mux_8_4_R1 => data_bus(7 downto 4),
               mux_8_4_R2 => data_bus(11 downto 8),
               mux_8_4_R3 => data_bus(15 downto 12),
               mux_8_4_R4 => data_bus(19 downto 16),
               mux_8_4_R5 => data_bus(23 downto 20),
               mux_8_4_R6 => data_bus(27 downto 24),
               mux_8_4_R7 => data_bus(31 downto 28),
               mux_8_4_S => register_sel_B,
               mux_8_4_Q => mux_8_4_B_out
              );
              
Add_Sub_0:Add_Sub
     Port map(add_sub_A => mux_8_4_A_out,
              add_sub_B => mux_8_4_B_out,
             add_sub_out =>add_sub_out,
             add_sub_sel => add_sub_sel,
            Overflow => Overflow,
            Zero => Zero
            );

Sev_seg <=data_bus(31 downto 28);
Zero0 <= Zero;
Overflow0 <= Overflow;
To_LED <= data_bus(31 downto 28);
   
end Behavioral;
