library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TFF_TB is
--  Port ( );
end TFF_TB;

architecture Behavioral of TFF_TB is
component TFF port (
    T : in STD_LOGIC;
    CLK : in STD_LOGIC;
    Clear : in STD_LOGIC;
    Q : out STD_LOGIC
   -- Qbar : out STD_LOGIC
);
end component;
signal CLK,Clear,Q : STD_LOGIC:='0';
signal T:std_logic:='1';
begin
uus:TFF port map(T,CLK,Clear,Q);
clk_G: process
begin
CLK<='0';
wait for 5 ns;
CLK<='1';
wait for 5 ns;
end process;
sim:process
begin
Clear<='1';
wait for 10 ns;
Clear<='0';
wait for 10 ns;
Clear<='1';
wait for 100 ns;
T<='0';

wait;
end process;
end Behavioral;
