-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;


entity Parallel_To_Serial is

port( CLK , RESET , WR : in std_logic;
      Data : in std_logic_vector(6 downto 0);
      TXD : out std_logic
      );
end Parallel_To_Serial;



architecture BEHAVIOR of Parallel_To_Serial is
type STATE_TYPE is (T0 , T1 , T2 , T3 , T4);
signal CURRENT_STATE : STATE_TYPE;
signal NEXT_STATE : STATE_TYPE;
signal R : std_logic_vector(6 downto 0);
signal n : INTEGER range 0 to 7;
signal p : std_logic;


begin

--TO WRITE TO THE OUTPUT TXD &&& THE INTERNAL SIGNALS
P1: process(CLK)
variable TMP : std_logic_vector(6 downto 0);
begin
if(CLK'event and CLK = '1')then

	CASE CURRENT_STATE is
    
    when T0 =>
    if (WR = '1')then
    R <= Data;
    n <= 7;
    p <= '0';
    end if;
    
    
    when T1 =>
    TXD <= '0';
    
    
    when T2 =>
    if(n > 0)then
    TXD <= R(0);
    TMP := R;
    TMP := TMP SRL 1;
    n <= (n-1);
    p <= p Xor TMP(0);
    R <= TMP;
    end if;

    when T3 =>
    TXD <= p;
    
    
    when T4 =>
    TXD <= '1';
    
    END CASE;
    
end if;
end process P1;


--STORE THE NEXT STATE BASED ON THE THE CURRENT STATE AND THE EXTERNAL INPUT WR AND THE COUNTER
P2: process(CURRENT_STATE , WR , n)
begin

	CASE CURRENT_STATE is
    
    when T0 =>
    if (WR = '1')then
    NEXT_STATE <= T1;
    else     
    NEXT_STATE <= T0;
    end if;
    
    when T1 =>
    NEXT_STATE <= T2;
    
    
    when T2 =>
    if(n = 0)then 
    NEXT_STATE <= T3;
    else
    NEXT_STATE <= T2;
    end if;
    
    when T3 =>
    NEXT_STATE <= T4;
    
    
    when T4 =>
    NEXT_STATE <= T0;
    
    END CASE;
end process P2;


--CHECK THE ASYNCHRONOUS RESET &&& MOVE ON TO THE NEXT STATE
P3: process(RESET , CLK)
begin

	if(RESET = '0')then 
    CURRENT_STATE <= T0;
    
    elsif(CLK'event and CLK = '1')then
    CURRENT_STATE <= NEXT_STATE;
    
end if;
end process P3;


end BEHAVIOR;
