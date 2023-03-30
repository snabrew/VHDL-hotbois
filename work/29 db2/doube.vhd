----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2023 21:01:52
-- Design Name: 
-- Module Name: doube - Behavioral
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

entity doube is
Port (disp: out std_logic_vector ( 15 downto 0 ) );
end doube;

architecture Behavioral of doube is

begin

process
variable int : integer := 111; --maximum must be under 512 as 2^9
variable work : std_logic_vector(20 downto 0);
variable x,y,z : std_logic_vector(3 downto 0);
begin

--double dabble algo
work(8 downto 0) := std_logic_vector(to_unsigned(int,9));
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

end Behavioral;
