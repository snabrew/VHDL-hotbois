----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2023 10:47:27
-- Design Name: 
-- Module Name: dbdb_tb - Behavioral
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

entity dbdb_tb is
--  Port ( );
end dbdb_tb;

architecture Behavioral of dbdb_tb is
signal clk,d : std_logic;
signal output : std_logic_vector(15 downto 0);
signal x,y,z : std_logic_vector(3 downto 0);
component doubledabble is
    Port (clk : in std_logic; 
    bcd : out std_logic_vector(15 downto 0);
    a,b,c :out std_logic_vector(3 downto 0);
    d : out std_logic);
end component;
for DUT : doubledabble use entity work.doubledabble(behavioral);

begin
process
begin
loop
clk <= '1'; wait for 1 ns;
clk <= '0';wait for 1 ns;
end loop;
end process;


DUT : doubledabble port map(clk =>clk, bcd => output,a => x, b => y, c => z, d => d );
end Behavioral;
