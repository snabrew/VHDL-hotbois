----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2023 10:35:18
-- Design Name: 
-- Module Name: doubledabble - Behavioral
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

entity doubledabble is
    Port (clk : in std_logic; 
    bcd : out std_logic_vector(15 downto 0);
    a,b,c :out std_logic_vector(3 downto 0);
    d : out std_logic);
end doubledabble;

architecture Behavioral of doubledabble is



shared variable int : integer := 111;
shared variable work : std_logic_vector(20 downto 0) := "000000000000000000000" ;
shared variable x,y,z :  std_logic_vector(3 downto 0) := "0000";

shared variable start : std_logic := '1'; --starting flag to run code once
shared variable done : std_logic := '0'; -- done flag to stop code from running when its done
begin

process(clk)
begin

-- initialising
if rising_edge(clk) and start = '1' and done = '0' then
work(8 downto 0) := std_logic_vector(TO_UNSIGNED(int,9)); -- sets last 9 bit of work to the value we want to change to bcd
start := '0'; 
end if;

--shifting and adding 3
if rising_edge(clk) and start = '0' and done = '0' then
work := work(19 downto 0) & '0';

x := work(20 downto 17);
if rising_edge(clk) and unsigned(x) > 4 then 
    x := std_logic_vector((unsigned(x) + 3));
end if;

y := work(16 downto 13);
if rising_edge(clk) and unsigned(y) > 4 then 
    y := std_logic_vector((unsigned(y) + 3));
end if;

z := work(12 downto 9);
if rising_edge(clk) and unsigned(z) > 4 then 
    z := std_logic_vector((unsigned(z) + 3));
end if;

work(20 downto 17) := x; 
work(16 downto 13) := y;
work(12 downto 9)  := z;


end if;

if work (8 downto 0) = "000000000" and start = '0'  then
bcd <= "0000" & x & y & z;
done := '1';
end if;

a <= x;
b <= y;
c <= z;
d <= done;

end process;

end Behavioral;
