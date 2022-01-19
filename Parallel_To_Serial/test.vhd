-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;


ENTITY test is
END test;

architecture behavioral of test is

COMPONENT Parallel_To_Serial is
port( CLK , RESET , WR : in std_logic;
      Data : in std_logic_vector(6 downto 0);
      TXD : out std_logic
      );
end COMPONENT;

signal CLK : std_logic := '0';
signal RESET : std_logic;
signal WR : std_logic ;
signal Data : std_logic_vector(6 downto 0);
signal TXD : std_logic;
constant CLK_period : time := 10ns;


begin

port_instantiation:
Parallel_To_Serial PORT MAP(
            				CLK => CLK,
       				        RESET => RESET,
            				WR => WR,
                            Data => Data,
                            TXD => TXD
);


CLK_genetarion: process 
begin 
CLK <= '0' ;
wait for CLK_period;
CLK <= '1' ;
wait for CLK_period;
end process;



stimulation_process: process
begin
--For One Clock Cycle There is 20 ns 
-- 20 ns = CLK_period*20 ns ,, so for N clock cycles ==> there is CLK_period*N*2
--NOTE : RUN TIME=1620 ns ,, with that run time number i will have the same # of cycles for the each case mentioned in the assignment

--Reset: Activation
RESET <= '0' ;
WR <= '0' ;
wait for CLK_period*5*2;


--Reset: Deactivation
RESET <= '1' ;
WR <= '0' ;
wait for CLK_period*3*2;


--Parallel Load 
Data <= "1010100";
WR <= '1' ;
wait for CLK_period*2*2;
WR <= '0' ;
wait for CLK_period*15*2;


--Parallel Load 
Data <= "1011100";
WR <= '1' ;
wait for CLK_period*2*2;
WR <= '0' ;
wait for CLK_period*15*2;


--Parallel Load 
Data <= "0000000";
WR <= '1' ;
wait for CLK_period*2*2;
WR <= '0' ;
wait for CLK_period*15*2;


--Parallel Load 
Data <= "1111111";
WR <= '1' ;
wait for CLK_period*2*2;
WR <= '0' ;
wait for CLK_period*15*2;


--Reset: Activation
RESET <= '0' ;
wait for CLK_period*5*2;


wait;
end process stimulation_process;
end behavioral;
