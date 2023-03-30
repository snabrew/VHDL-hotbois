-- fpga4student.com: FPGA projects, Verilog projects, VHDL projects
-- VHDL code for seven-segment display on Basys 3 FPGA
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity seven_segment_display_VHDL is
    Port (clk : in std_logic;
           LED_out : out STD_LOGIC_VECTOR (6 downto 0);
           anode_out : out std_logic_vector(3 downto 0);
           ind : out std_logic);
           --reeee : out std_logic_vector(19 downto 0));-- Cathode patterns of 7-segment display
end seven_segment_display_VHDL;

architecture Behavioral of seven_segment_display_VHDL is
-- counting decimal number to be displayed on 4-digit 7-segment display
signal LED_BCD: STD_LOGIC_VECTOR (3 downto 0);
--signal sseg : STD_LOGIC_VECTOR (6 downto 0);
signal ref : std_logic_vector (20 downto 0);
signal sel : std_logic_vector(1 downto 0);
signal anode : std_logic_vector (3 downto 0);


signal disp : std_logic_vector (15 downto 0); 

begin

process
variable int : integer := 111; --maximum must be under 512 as 2^9
variable work : std_logic_vector(20 downto 0);
variable x,y,z : std_logic_vector(3 downto 0);
begin

--double dabble algo
work(8 downto 0) := std_logic_vector(to_unsigned(int,9));
--0000 0000 0000 001101111
--0000 0000 0000 011011110
loop
exit when work(8 downto 0) = "000000000";

work := work(19 downto 0) & '0';
x := work(20 downto 17);
y := work(16 downto 13);
z := work(12 downto 9);

if unsigned(x) > 4 then
 x := std_logic_vector(unsigned(x) + 3);
end if;
if unsigned(y) > 4 then
 y := std_logic_vector(unsigned(y) + 3);
end if;
if unsigned(z) > 4 then
 z := std_logic_vector(unsigned(z) + 3);
end if;
 
end loop;

--y := 4;
--x := 5;
disp(3 downto 0) <= z ;
disp(7 downto 4) <= y;
disp(11 downto 8) <= x;
disp (15 downto 12) <= "0000";
end process;

process (clk)
    variable REG : unsigned(20 downto 0) := "000000000000000000000";
begin
if rising_edge(clk) then
    REG := REG + 1; -- this happens immediately
end if;
ref <= std_logic_vector(REG);
end process;

--disp <= "0001001000110100"; 
--reeee <= ref;
sel <= ref (20 downto 19);

process(sel)
begin
case sel is
 when "00" => anode <= "1110"; LED_BCD <= disp(3 downto 0); ind <= '1';
 when "01" => anode <= "1101"; LED_BCD <= disp(7 downto 4); ind <= '0';
 when "10" => anode <= "1011"; LED_BCD <= disp(11 downto 8); ind <= '1';
 when "11" => anode <= "0111"; LED_BCD <= disp(15 downto 12); ind <= '1';
 when others => null;
 end case;
 anode_out <= anode; --change later
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
    when others => LED_out <= "1111111"; -- "nothing"
    end case;

end process;

end Behavioral;
