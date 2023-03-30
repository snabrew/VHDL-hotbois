-- fpga4student.com: FPGA projects, Verilog projects, VHDL projects
-- VHDL code for seven-segment display on Basys 3 FPGA
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity seven_segment_display_VHDL is
    Port ( btn : in std_logic;
           
           LED_out : out STD_LOGIC_VECTOR (6 downto 0));-- Cathode patterns of 7-segment display
end seven_segment_display_VHDL;

architecture Behavioral of seven_segment_display_VHDL is
signal displayed_number: STD_LOGIC_VECTOR (15 downto 0);
-- counting decimal number to be displayed on 4-digit 7-segment display
signal LED_BCD: STD_LOGIC_VECTOR (3 downto 0);
signal sseg : STD_LOGIC_VECTOR (6 downto 0);

begin
-- VHDL code for BCD to 7-segment decoder
-- Cathode patterns of the 7-segment LED display 
LED_BCD <= "0000";
process(LED_BCD)
begin
    case LED_BCD is
    when "0000" => sseg <= "0000001"; -- "0"     
    when "0001" => sseg <= "1001111"; -- "1" 
    when "0010" => sseg <= "0010010"; -- "2" 
    when "0011" => sseg <= "0000110"; -- "3" 
    when "0100" => sseg <= "1001100"; -- "4" 
    when "0101" => sseg <= "0100100"; -- "5" 
    when "0110" => sseg <= "0100000"; -- "6" 
    when "0111" => sseg <= "0001111"; -- "7" 
    when "1000" => sseg <= "0000000"; -- "8"     
    when "1001" => sseg <= "0000100"; -- "9" 
    when others => sseg <= "0000000"; -- "nothing"
    end case;
    
    LED_out <= sseg;
end process;

process (btn)
begin
    if btn = '1' then
        LED_BCD <= "0001";
        
    end if;
end process;




end Behavioral;