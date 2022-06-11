library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity div_tb is
--  Port ( );
end div_tb;

architecture Behavioral of div_tb is
component Divider
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT : out STD_LOGIC);
end component;
signal CLK_IN,CLK_OUT:std_logic:='0';
begin
uut:Divider port map (CLK_IN,CLK_OUT);
clk_G:process
begin
CLK_IN<='0';
wait for 5 ns;
CLK_IN<='1';
wait for 5 ns;
end process;
sim:process
begin
wait;
end process;
end Behavioral;
