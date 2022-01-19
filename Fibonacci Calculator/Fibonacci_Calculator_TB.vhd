library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Fibonacci_Calculator_TB IS
END Fibonacci_Calculator_TB;


ARCHITECTURE Behavior OF Fibonacci_Calculator_TB IS 

COMPONENT Fibonacci_Calculator
port ( clk : in std_logic;
       data_in : in std_logic_vector (3 downto 0);
       load_enable : in std_logic;
       data_out : out std_logic_vector (9 downto 0));
end COMPONENT;


signal clk : std_logic := '0';
signal load_enable : std_logic := '0';
signal data_in : std_logic_vector (3 downto 0):= (others => '0');
signal data_out : std_logic_vector (9 downto 0):= (others => '0');
constant clk_period : time := 10ns;

begin
uut: Fibonacci_Calculator PORT MAP(
            clk => clk,
            data_in => data_in,
            load_enable => load_enable,
            data_out => data_out
);

clk_genetarion: process 
begin 
clk <= '0' ;
wait for clk_period;
clk <= '1' ;
wait for clk_period;
end process;


stim_proc: process
begin

-- WHEN THE LOAD_ENABLE = 0 
load_enable <= '0'; --When The Input Data = 0 "0000" => OUTPUT SHOULD BE 0
data_in <="0000";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = 1 "0001" => OUTPUT SHOULD BE 0
data_in <="0001";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = 2 "0010" => OUTPUT SHOULD BE 0
data_in <="0010";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = 3 "0011" => OUTPUT SHOULD BE 0
data_in <="0011";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = 4 "0100" => OUTPUT SHOULD BE 0
data_in <="0100";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = 5 "0101" => OUTPUT SHOULD BE 0
data_in <="0101";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = 6 "0110" => OUTPUT SHOULD BE 0
data_in <="0110";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = 7 "0111" => OUTPUT SHOULD BE 0
data_in <="0111";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = 8 "1000" => OUTPUT SHOULD BE 0
data_in <="1000";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = 9 "1001" => OUTPUT SHOULD BE 0
data_in <="1001";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = A "1010" => OUTPUT OUTPUT SHOULD BE 0
data_in <="1010";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = B "1011" => OUTPUT OUTPUT SHOULD BE 0
data_in <="1011";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = C "1100" => OUTPUT OUTPUT SHOULD BE 0
data_in <="1100";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = D "1101" => OUTPUT OUTPUT SHOULD BE 0
data_in <="1101";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = E "1110" => OUTPUT OUTPUT SHOULD BE 0
data_in <="1110";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = F "1111" => OUTPUT OUTPUT SHOULD BE 0
data_in <="1111";
wait for clk_period*2;






-- WHEN THE LOAD_ENABLE = 1
-- The Input Data Is Entered Sequentially But if it wasn't it will still work fine


load_enable <= '1'; --When The Input Data = 0 "0000" => OUTPUT SHOULD BE 0
data_in <="0000";
wait for clk_period*2;

load_enable <= '1'; --When The Input Data = 1 "0001" => OUTPUT SHOULD BE 1
data_in <="0001";
wait for clk_period*2;

load_enable <= '1'; --When The Input Data = 2 "0010" => OUTPUT SHOULD BE 1
data_in <="0010";
wait for clk_period*2;

load_enable <= '1'; --When The Input Data = 3 "0011" => OUTPUT SHOULD BE 2
data_in <="0011";
wait for clk_period*2;

load_enable <= '1'; --When The Input Data = 4 "0100" => OUTPUT SHOULD BE 3 
data_in <="0100";
wait for clk_period*2;

load_enable <= '1'; --When The Input Data = 5 "0101" => OUTPUT SHOULD BE 5
data_in <="0101";
wait for clk_period*2;

load_enable <= '1'; --When The Input Data = 6 "0110" => OUTPUT SHOULD BE 8
data_in <="0110";
wait for clk_period*2;

load_enable <= '1'; --When The Input Data = 7 "0111" => OUTPUT SHOULD BE D -13 in decimal-
data_in <="0111";
wait for clk_period*2;

load_enable <= '1'; --When The Input Data = 8 "1000" => OUTPUT SHOULD BE 15 -21 in decimal-
data_in <="1000";
wait for clk_period*2;

load_enable <= '1'; --When The Input Data = 8 "1000" => OUTPUT SHOULD BE 15 -21 in decimal-
data_in <="1000";
wait for clk_period*2;

load_enable <= '1'; --When The Input Data = 9 "1001" => OUTPUT SHOULD BE 22 -34 in decimal-
data_in <="1001";
wait for clk_period*2;

load_enable <= '1'; --When The Input Data = A "1010" => OUTPUT SHOULD BE 37 -55 in decimal-
data_in <="1010";
wait for clk_period*2;

load_enable <= '1'; --When The Input Data = B "1011" => OUTPUT SHOULD BE 59 -89 in decimal-
data_in <="1011";
wait for clk_period*2;

load_enable <= '1'; --When The Input Data = C "1100" => OUTPUT SHOULD BE 90 -144 in decimal-
data_in <="1100";
wait for clk_period*2;

load_enable <= '1'; --When The Input Data = D "1101" => OUTPUT SHOULD BE E9 -233 in decimal-
data_in <="1101";
wait for clk_period*2;

load_enable <= '1'; --When The Input Data = E "1110" => OUTPUT SHOULD BE 179 -377 in decimal-
data_in <="1110";
wait for clk_period*2;

load_enable <= '1'; --When The Input Data = F "1111" => OUTPUT SHOULD BE 262 -610 in decimal-
data_in <="1111";
wait for clk_period*2;



-- WHEN THE LOAD_ENABLE = 0  
load_enable <= '0'; --When The Input Data = 0 "0000" => OUTPUT WILL BE 262 -THE OLD VALUE-
data_in <="0000";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = 1 "0001" => OUTPUT WILL BE 262 -THE OLD VALUE-
data_in <="0001";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = 2 "0010" => OUTPUT WILL BE 262 -THE OLD VALUE-
data_in <="0010";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = 3 "0011" => OUTPUT WILL BE 262 -THE OLD VALUE-
data_in <="0011";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = 4 "0100" => OUTPUT WILL BE 262 -THE OLD VALUE-
data_in <="0100";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = 5 "0101" => OUTPUT WILL BE 262 -THE OLD VALUE-
data_in <="0101";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = 6 "0110" => OUTPUT WILL BE 262 -THE OLD VALUE-
data_in <="0110";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = 7 "0111" => OUTPUT WILL BE 262 -THE OLD VALUE-
data_in <="0111";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = 8 "1000" => OUTPUT WILL BE 262 -THE OLD VALUE-
data_in <="1000";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = 9 "1001" => OUTPUT WILL BE 262 -THE OLD VALUE-
data_in <="1001";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = A "1010" => OUTPUT WILL BE 262 -THE OLD VALUE-
data_in <="1010";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = B "1011" => OUTPUT WILL BE 262 -THE OLD VALUE-
data_in <="1011";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = C "1100" => OUTPUT WILL BE 262 -THE OLD VALUE-
data_in <="1100";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = D "1101" => OUTPUT WILL BE 262 -THE OLD VALUE-
data_in <="1101";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = E "1110" => OUTPUT WILL BE 262 -THE OLD VALUE-
data_in <="1110";
wait for clk_period*2;

load_enable <= '0'; --When The Input Data = F "1111" => OUTPUT WILL BE 262 -THE OLD VALUE-
data_in <="1111";
wait for clk_period*2;



wait;
end process;
end Behavior;
