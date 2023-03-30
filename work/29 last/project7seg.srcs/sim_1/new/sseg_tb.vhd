----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2023 09:58:47
-- Design Name: 
-- Module Name: sseg_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sseg_tb is
--  Port ( );
end sseg_tb;

architecture Behavioral of sseg_tb is
signal clk : std_logic;
signal L:STD_LOGIC_VECTOR (6 downto 0);
signal ao:std_logic_vector(3 downto 0);
signal led: std_logic;
signal dispoo: std_logic_vector (15 downto 0);
signal re :std_logic_vector(1 downto 0);
component seven_segment_display_VHDL is
    Port (clk : in std_logic;
           LED_out : out STD_LOGIC_VECTOR (6 downto 0);
           anode_out : out std_logic_vector(3 downto 0);
           ind : out std_logic;
           dispo : out std_logic_vector (15 downto 0));
end component;

for DUT: seven_segment_display_VHDL use entity work.seven_segment_display_VHDL(Behavioral);
begin

process
begin
loop exit when now > 100ns;

clk <= '1';wait for 0.001 ns;
clk <= '0';wait for 0.001 ns;
 
end loop;
end process;

DUT : seven_segment_display_VHDL port map(clk => clk,LED_out => L, anode_out=> ao,ind => led,dispo => dispoo); --LED_out => L
end Behavioral;