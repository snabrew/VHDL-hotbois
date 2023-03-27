-- fpga4student.com: FPGA projects, Verilog projects, VHDL projects
-- VHDL code for seven-segment display on Basys 3 FPGA
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity seven_segment_display_VHDL is
    Port (clk : in std_logic;
           LED_out : out STD_LOGIC_VECTOR (6 downto 0));-- Cathode patterns of 7-segment display
end seven_segment_display_VHDL;

architecture Behavioral of seven_segment_display_VHDL is
-- counting decimal number to be displayed on 4-digit 7-segment display
signal LED_BCD: STD_LOGIC_VECTOR (3 downto 0);
signal sseg : STD_LOGIC_VECTOR (6 downto 0);
signal ref : STD_LOGIC_VECTOR (27 downto 0);
signal sel : std_logic_vector(1 downto 0);
signal anode : std_logic_vector (3 downto 0);

begin
-- VHDL code for BCD to 7-segment decoder
-- Cathode patterns of the 7-segment LED display 
LED_BCD <= "0001";

process (clk)
begin
    ref <= ref + 1;
end process;

sel <= ref (27 downto 26);

process(sel)
begin
case sel is
 when "00" => anode <= "0111";
 when "01" => anode <= "1011";
 when "10" => anode <= "1101";
 when "11" => anode <= "1110";
 end case;
end process;

process(LED_BCD)
begin
    case LED_BCD is
    when "0000" => LED_out <= "0000001"; -- "0"     
    when "0001" => LED_out <= "1001111"; -- "1" 
    when "0010" => LED_out <= "0010010"; -- "2" 
    when "0011" => LED_out <= "0000110"; -- "3" 
    when "0100" => LED_out <= "1001100"; -- "4" 
    when "0101" => LED_out <= "0100100"; -- "5" 
    when "0110" => LED_out <= "0100000"; -- "6" 
    when "0111" => LED_out <= "0001111"; -- "7" 
    when "1000" => LED_out <= "0000000"; -- "8"     
    when "1001" => LED_out <= "0000100"; -- "9" 
    when others => LED_out <= "0000000"; -- "nothing"
    end case;
    
    
end process;

end Behavioral;