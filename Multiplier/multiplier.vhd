-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;


entity multiplier is
 port( CLK : in std_logic;
       A , B : in std_logic_vector(3 downto 0);
       P : out std_logic_vector(7 downto 0)
 );
end multiplier;






architecture behavioral of multiplier is 

begin


process(CLK)
variable INPUT1 : INTEGER range 0 to 15 := 0;
variable INPUT2 : INTEGER range 0 to 15 := 0;
variable SUM : INTEGER range 0 to 255 := 0;
variable OUTPUT : INTEGER range 0 to 255 := 0;

begin
if(clk'event and clk='1') then
INPUT1 := conv_integer(A);
INPUT2 := conv_integer(B);
SUM := 0;


     mul_loop:
         for I in 1 to INPUT2 loop
         SUM := SUM + INPUT1;
         end loop;
         end if;
P <= conv_std_logic_vector( SUM , 8 );
end process;
end behavioral;
