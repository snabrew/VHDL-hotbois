----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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
    --target_temp : out std_logic_vector(7 downto 0);
    onoff : out std_logic;
    seg : out std_logic_vector(6 downto 0);
    --C:out std_logic_vector(6 downto 0);
    AN : out std_logic_vector(3 downto 0)
  );
end entity;

architecture Behavioral of temperature_controller is
  signal clk_div : std_logic;
  shared variable target : integer := 7;
  signal temp : unsigned(7 downto 0) := (others => '0');
begin
  process(clk)
    variable count : integer range 0 to 69999999 := 0;
  begin
    if rising_edge(clk) then
      count := count + 1;
      if count = 69999999 then
        count := 0;
        clk_div <= not clk_div;
      end if;
    end if;
  end process;

  process(clk_div)
  begin
    if rising_edge(clk_div) then
      if reset = '1' then
        temp <= (others => '0');
      elsif U = '1' then
          target := target + 1;
      elsif D = '1' then
          target := target - 1;
      elsif temp < target then
             onoff <= '1';
             temp <= temp +1;           
      elsif temp >= target then
           onoff <= '0';
           temp <= temp -1;
            end if;
        end if;
  end process;

  --target_temp <= std_logic_vector(temp);

  -- BCD to 7-segment decoder to display target_temp
  seg <= "0000001" when temp = 0 else
         "1001111" when temp = 1 else
         "0010010" when temp = 2 else
         "0000110" when temp = 3 else
         "1001100" when temp = 4 else
         "0100100" when temp = 5 else
         "0100000" when temp = 6 else
         "0001111" when temp = 7 else
         "0000000" when temp = 8 else
         "0001100" when temp = 9;
  AN <= "1101";   -- enable 7-segment display 0

--C <= "0001101";

end Behavioral;


