library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
entity AutoUpDownCounter is
    Port (
        UpDown : in STD_LOGIC;
        reset : in STD_LOGIC;
        clk : in STD_LOGIC;
        cnt : out STD_LOGIC_VECTOR(3 downto 0)
        );
end AutoUpDownCounter;
architecture Behavioral of AutoUpDownCounter is
signal temp:std_logic_vector(3 downto 0):="0000";
begin
process (clk,reset)
begin
    if (reset ='0') then 
        temp <= "0000";
    elsif (clk'event and clk='1')then
        if (UpDown = '1')then 
            temp <= temp + '1';
        else 
            temp <= temp - '1';
        end if;
    end if;                
cnt <= temp;
end process;
end Behavioral;