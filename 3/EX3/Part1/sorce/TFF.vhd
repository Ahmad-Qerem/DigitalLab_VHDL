library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TFF is
    Port ( T : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Clear : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end TFF;
architecture Behavioral of TFF is
signal temp : std_logic := '0';
begin
process (CLK,Clear)
begin
    if Clear='0'then
        temp<='0';
    elsif (CLK'event and CLK='1' and T='1') then 
        temp<=not temp;
    end if;    
end process;
Q <= temp;
Qbar <= not temp;
end Behavioral;
