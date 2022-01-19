-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;


ENTITY multiplier_TB IS
END multiplier_TB;




ARCHITECTURE Behavior OF multiplier_TB IS 

COMPONENT multiplier is
 port( CLK : in std_logic;
       A , B : in std_logic_vector(3 downto 0);
       P : out std_logic_vector(7 downto 0)
 );
end COMPONENT;


signal CLK : std_logic := '0';
signal A : std_logic_vector (3 downto 0):= (others => '0');
signal B : std_logic_vector (3 downto 0):= (others => '0');
signal P : std_logic_vector (7 downto 0):= (others => '0');
constant CLK_period : time := 10ns;


begin

instantiation :
multiplier PORT MAP(
            CLK => CLK,
            A => A,
            B => B,
            P => P
);


CLK_genetarion: process 
begin 
CLK <= '0' ;
wait for CLK_period;
CLK <= '1' ;
wait for CLK_period;
end process;



stimulation_process: process
variable NUM1 : INTEGER range 0 to 15 := 0;
variable NUM2 : INTEGER range 0 to 15 := 0;

begin
-- doing it with two nested loops much easier than 265 different cases
-- it will give us 265 different cases for sure , two nested loops 16*16=256
for I in 0 to 15 loop
NUM1 := I;
for J in 0 to 15 loop
NUM2 := J;
A <= conv_std_logic_vector( NUM1 , 4 );
B <= conv_std_logic_vector( NUM2 , 4 );
wait for CLK_period*2;
end loop;
end loop;
wait;
end process;
end Behavior;
