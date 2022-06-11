library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
entity BCD_Counter is Port (
    clk: in STD_LOGIC;  
    Digit0: out  STD_LOGIC_VECTOR (3 downto 0);
    Digit1: out  STD_LOGIC_VECTOR (3 downto 0)); 
end BCD_Counter; 
architecture Behavioral of BCD_Counter is
signal temp1: STD_LOGIC_VECTOR (3 downto 0):="0000";
signal temp2: STD_LOGIC_VECTOR (3 downto 0):="0000";
begin
process(clk)
begin
	if(clk'event and clk='1')then
			temp1 <= temp1+1;
			if(temp1="1001") then
				temp1 <="0000";
				temp2 <= temp2+ 1;
			end if;
			if(temp2 = "1010") then
				temp1 <="0000";
				temp2 <="0000";
			end if;
	end if;
end process;
Digit0<=temp1;
Digit1<=temp2;
end Behavioral;