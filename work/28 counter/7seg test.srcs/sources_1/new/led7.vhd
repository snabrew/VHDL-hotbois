-- fpga4student.com: FPGA projects, Verilog projects, VHDL projects
-- VHDL code for seven-segment display on Basys 3 FPGA
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity seven_segment_display_VHDL is
    Port (clk : in std_logic;
           --LED_out : out STD_LOGIC_VECTOR (6 downto 0);
           anode_out : out std_logic_vector(3 downto 0));
           --reeee : out std_logic_vector(19 downto 0));-- Cathode patterns of 7-segment display
end seven_segment_display_VHDL;

architecture Behavioral of seven_segment_display_VHDL is
-- counting decimal number to be displayed on 4-digit 7-segment display
--signal LED_BCD: STD_LOGIC_VECTOR (3 downto 0);
--signal sseg : STD_LOGIC_VECTOR (6 downto 0);
signal ref : std_logic_vector (25 downto 0);
signal sel : std_logic_vector(1 downto 0);
signal anode : std_logic_vector (3 downto 0);

begin

--LED_BCD <= "0001";

process (clk)
    variable REG : unsigned(25 downto 0) := "00000000000000000000000000";
begin
if rising_edge(clk) then
    REG := REG + 1; -- this happens immediately
end if;
ref <= std_logic_vector(REG);
end process;


--reeee <= ref;
sel <= ref (25 downto 24);


process(sel)
begin
case sel is
 when "00" => anode <= "0111";
 when "01" => anode <= "1011";
 when "10" => anode <= "1101";
 when "11" => anode <= "1110";
 when others => null;
 end case;
 anode_out <= anode; --change later
end process;

--process(LED_BCD)
--begin
--    case LED_BCD is
--    when "0000" => LED_out <= "0000001"; -- "0"     
--    when "0001" => LED_out <= "1001111"; -- "1" 
--    when "0010" => LED_out <= "0010010"; -- "2" 
--    when "0011" => LED_out <= "0000110"; -- "3" 
--    when "0100" => LED_out <= "1001100"; -- "4" 
--    when "0101" => LED_out <= "0100100"; -- "5" 
--    when "0110" => LED_out <= "0100000"; -- "6" 
--    when "0111" => LED_out <= "0001111"; -- "7" 
--    when "1000" => LED_out <= "0000000"; -- "8"     
--    when "1001" => LED_out <= "0000100"; -- "9" 
--    when others => LED_out <= "0000000"; -- "nothing"
--    end case;

--end process;

end Behavioral;