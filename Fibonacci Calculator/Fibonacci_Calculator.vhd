library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity Fibonacci_Calculator is
port ( clk : in std_logic;
       data_in : in std_logic_vector (3 downto 0);
       load_enable : in std_logic;
       data_out : out std_logic_vector (9 downto 0)); 
end Fibonacci_Calculator;



architecture behavioral of Fibonacci_Calculator is
begin 

process(clk)
variable INPUT_NUM : INTEGER range 0 to 15;
variable OUTPUT_NUM : INTEGER range 0 to 610;
type INT_ARRAY is array (0 to 15) of INTEGER range 0 to 610;
variable int_arr : INT_ARRAY;

begin
if(clk'event and clk='1') then
int_arr(0) := 0;
int_arr(1) := 1;
if(load_enable ='1') then
         INPUT_NUM := conv_integer(data_in);
         
         if(INPUT_NUM = 0) then
         OUTPUT_NUM := 0;
         elsif(INPUT_NUM = 1) then
         OUTPUT_NUM := 1;
         else 
         for_loop:
         for I in 2 to INPUT_NUM loop
         int_arr(I) := int_arr(I-1) + int_arr(I-2);
         OUTPUT_NUM := int_arr(I);
         end loop;
         end if;       
end if;
end if;
data_out <= conv_std_logic_vector( OUTPUT_NUM , 10 );
end process;
end behavioral;
