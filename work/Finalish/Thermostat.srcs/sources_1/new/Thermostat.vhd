----------------------------------------------------------------------------------
-- Company: university of strathclyde
-- Engineers: Lewis Carty, San Brewer, Ross McWilliam
-- 
-- Create Date: 28.03.2023 16:51:56
-- Design Name: 
-- Module Name: Thermostat - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity temperature_controller is
  port (
    clk : in std_logic;
    reset : in std_logic;
    U : in std_logic;
    D : in std_logic;
    ind : out std_logic;
    --target_temp : out std_logic_vector(7 downto 0);
    onoff : out std_logic;
    seg : out std_logic_vector(6 downto 0);
    AN : out std_logic_vector(3 downto 0)
  );
end entity;

architecture Behavioral of temperature_controller is
  signal clk_div : std_logic;
  shared variable target : integer := 155;
  signal tempA : unsigned(3 downto 0) := (others => '0');
  signal tempB : unsigned(3 downto 0) := (others => '0');
  signal tempC : unsigned(3 downto 0) := (others => '0');
  signal sel : std_logic_vector(1 downto 0);
  signal anode : std_logic_vector (3 downto 0);
  signal LED_BCD: STD_LOGIC_VECTOR (3 downto 0);
  signal REG : unsigned(10 downto 0) := "01111111111";
  signal ref : std_logic_vector (10 downto 0);
  
begin
  process(clk)
    variable count : integer range 0 to 49999999/5 := 0;
  begin
    if rising_edge(clk) then
      count := count + 1;
      if count = 49999999/5 then
        count := 0;
        clk_div <= not clk_div;
      end if;
    end if;
  end process;



  process(clk_div)
  begin
    if rising_edge(clk_div) then
      if reset = '1' then
        tempA <= (others => '0');
        tempB <= (others => '0');
        tempC <= (others => '0');
      elsif U = '1' then
          target := target + 10;
      elsif D = '1' then
          target := target - 10;
      elsif tempA = "1001" and tempB = "1001" and tempC = "1001" then
            tempA <= "0000"; 
            tempA <= "0000"; 
            tempA <= "0000";                            
      elsif (TO_INTEGER(tempA) + TO_INTEGER(tempB)*10 + TO_INTEGER(tempC)*100) < target then --heater on
             onoff <= '1';
             tempA <= tempA +1; 
             if tempA = "1001" then
                tempB <= tempB +1;
                tempA <= "0000";
                elsif tempB = "1001" then
                tempC <= tempC +1;
                tempB <= "0000";
                end if;
      elsif (TO_INTEGER(tempA) + TO_INTEGER(tempB)*10 + TO_INTEGER(tempC)*100) >= target then --heater off
           onoff <= '0';
           tempA <= tempA -1;
           if tempA = "0000" then
                tempA <= "1001";
                tempB <= tempB -1;
                elsif tempB = "0000" then
                tempB <= "1001";
                tempC <= tempC -1;
                end if;
        end if;
       end if;
  end process;

  --target_temp <= std_logic_vector(temp);
 
 process(clk,reset)
begin 
    if(reset='1') then
        REG <= (others => '0');
    elsif(rising_edge(clk)) then
        REG <= REG + 1;
    end if;
    
ref <= std_logic_vector(REG);
end process;
 
sel <= ref (10 downto 9);
 
process(sel)
begin
case sel is
 when "00" => anode <= "1110"; LED_BCD <= "1111"; ind <= '1';
 when "01" => anode <= "1101"; LED_BCD <= std_logic_vector(tempA); ind <= '1';
 when "10" => anode <= "1011"; LED_BCD <= std_logic_vector(tempB); ind <= '0';
 when "11" => anode <= "0111"; LED_BCD <= std_logic_vector(tempC); ind <= '1';
 when others => null;
 end case;
AN <= anode; 
end process;



process(LED_BCD)
begin
    case LED_BCD is
    when "0000" => seg <= "0000001"; -- "0"     
    when "0001" => seg <= "1001111"; -- "1" 
    when "0010" => seg <= "0010010"; -- "2" 
    when "0011" => seg <= "0000110"; -- "3" 
    when "0100" => seg <= "1001100"; -- "4" 
    when "0101" => seg <= "0100100"; -- "5" 
    when "0110" => seg <= "0100000"; -- "6" 
    when "0111" => seg <= "0001111"; -- "7" 
    when "1000" => seg <= "0000000"; -- "8"     
    when "1001" => seg <= "0000100"; -- "9" 
    when "1111" => seg <= "0110001"; -- "9" 
    when others => seg <= "1111111"; -- "nothing"
    end case;

end process;


end Behavioral;


