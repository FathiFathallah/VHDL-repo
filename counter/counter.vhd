

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity Counter is
    Port (
			  clk: in STD_LOGIC;
			  reset: in STD_LOGIC;
              UpDown: in  STD_LOGIC;
			  count : out  STD_LOGIC_VECTOR (3 downto 0));
end Counter;

architecture Behavioral of Counter is
			  
	signal tmp:std_logic_vector(3 downto 0):= (others => '0');
	begin

	process(clk, reset)
	begin
		if (reset = '0') then 
        	tmp <= (others => '0');
		elsif (clk'event and clk='1') then
			if( UpDown = '1') then
				tmp<=tmp +'1';
        	else
        		tmp<=tmp -'1';
			end if;
  		end if;
		count <= tmp;
	end process;
end Behavioral;
































































