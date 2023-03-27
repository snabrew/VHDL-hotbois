----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.03.2023 13:51:52
-- Design Name: 
-- Module Name: each - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity each is
    Port ( ta,tb,tc,td,te,tf,tg,th,a1,a2,a3,a4 : in STD_LOGIC;
            a,b,c,d,e,f,g,h,i,j,k,l : out std_logic);
end each;


architecture Behavioral of each is

begin
a <= ta;
b <= tb;
c <= tc;
d <= td;
e <= te;
f <= tf;
g <= tg;
h <= th;

i <= a1;
j <= a2 ;
k <= a3;
l <= a4 ;
end Behavioral;
