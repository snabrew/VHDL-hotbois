-- fpga4student.com: FPGA projects, Verilog projects, VHDL projects
-- VHDL code for seven-segment display on Basys 3 FPGA
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity seven_segment_display_VHDL is
    Port (clk : in std_logic;
           LED_out : out STD_LOGIC_VECTOR (6 downto 0);
           anode_out : out std_logic_vector(3 downto 0);
           ind : out std_logic;
           dispo : out std_logic_vector (15 downto 0));
           --reeee : out std_logic_vector(19 downto 0));-- Cathode patterns of 7-segment display
end seven_segment_display_VHDL;

architecture Behavioral of seven_segment_display_VHDL is
-- counting decimal number to be displayed on 4-digit 7-segment display
signal LED_BCD: STD_LOGIC_VECTOR (3 downto 0);
--signal sseg : STD_LOGIC_VECTOR (6 downto 0);
signal ref : std_logic_vector (24 downto 0);
signal subclk : std_logic;
signal sel : std_logic_vector(1 downto 0);
signal anode : std_logic_vector (3 downto 0);

signal disp : std_logic_vector (15 downto 0); 

shared variable int : integer := 1;
shared variable work : std_logic_vector(20 downto 0) := "000000000000000000000" ;
shared variable x,y,z :  std_logic_vector(3 downto 0) := "0000";

shared variable start : std_logic := '1'; --starting flag to run code once
shared variable done : std_logic := '0'; -- done flag to stop code from running when its done

begin

process(subclk)
begin


-- initialising
if start = '1' and done = '0' then
work(8 downto 0) := std_logic_vector(TO_UNSIGNED(int,9)); -- sets last 9 bit of work to the value we want to change to bcd
start := '0'; 
end if;

if rising_edge(subclk) and start = '0' and done = '0' then
work := work(19 downto 0) & '0';
end if;
--shifting and adding 3
if start = '0' and done = '0' then


x := work(20 downto 17);

if falling_edge(subclk) and unsigned(x) > 4 then 
    x := std_logic_vector((unsigned(x) + 3));
end if;

y := work(16 downto 13);
if falling_edge(subclk) and unsigned(y) > 4 then 
    y := std_logic_vector((unsigned(y) + 3));
end if;

z := work(12 downto 9);
if falling_edge(subclk) and unsigned(z) > 4 then 
    z := std_logic_vector((unsigned(z) + 3));
end if;

work(20 downto 17) := x; 
work(16 downto 13) := y;
work(12 downto 9)  := z;


end if;

if rising_edge(subclk) and work (8 downto 0) = "000000000" and start = '0'   then
disp <= "0000" & x & y & z;
done := '1';
ind <= done;
end if;


end process;

process (clk)
    variable REG : unsigned(24 downto 0) := "0000000000000000000000000";
begin
if rising_edge(clk) then
    REG := REG + 1; -- this happens immediately
end if;
ref <= std_logic_vector(REG);



end process;

--disp <= "0001001000110100"; 
--reeee <= ref;
sel <= ref (19 downto 18);
dispo <= disp;
subclk <= ref(24);

process(disp)
begin
case sel is
 when "00" => anode <= "1110"; LED_BCD <= disp(3 downto 0);-- ind <= '1';
 when "01" => anode <= "1101"; LED_BCD <= disp(7 downto 4);-- ind <= '0';
 when "10" => anode <= "1011"; LED_BCD <= disp(11 downto 8);-- ind <= '1';
 when "11" => anode <= "0111"; LED_BCD <= disp(15 downto 12);-- ind <= '1';
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
