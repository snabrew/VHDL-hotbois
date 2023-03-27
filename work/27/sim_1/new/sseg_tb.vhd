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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sseg_tb is
--  Port ( );
end sseg_tb;

architecture Behavioral of sseg_tb is
signal but : std_logic;
signal L : STD_LOGIC_VECTOR (6 downto 0);

component seven_segment_display_VHDL is
    Port ( btn : in std_logic;
           LED_out : out STD_LOGIC_VECTOR (6 downto 0));-- Cathode patterns of 7-segment display
end component;
for DUT: seven_segment_display_VHDL use entity work.seven_segment_display_VHDL(Behavioral);
begin

stim : process
begin
but <= '0'; wait for 30ns;
but <= '1';wait for 5ns;
end process;

DUT : seven_segment_display_VHDL port map(btn => but,LED_out => L);
end Behavioral;
