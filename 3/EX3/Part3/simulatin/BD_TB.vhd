library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity BD_TB is
--  Port ( );
end BD_TB;
architecture Behavioral of BD_TB is
component PBDebouncer 
    Port ( 
        CLK : in STD_LOGIC;
        PB : in STD_LOGIC;
        PB_debounced: out STD_LOGIC
        ); 
end component;
signal CLK:std_logic:='0';
signal PB,PB_debounced:std_logic;   
begin
UUT: PBDebouncer port map (CLK,PB,PB_debounced);

CLKG:process 
begin
CLK<='0';
wait for 5ns;
CLK<='1';
wait for 5ns;
end process;

process
begin
PB<='1';
wait for 1 ms;
PB<='0';
wait for 1 ms;
PB<='1';
wait for 1 ms;
PB<='0';
wait for 1 ms;
PB<='1';
wait for 1 ms;

wait for 40 ms;

PB<='0';
wait for 1 ms;
PB<='1';
wait for 1 ms;
PB<='0';
wait for 1 ms;
PB<='1';
wait for 1 ms;
PB<='0';
wait for 1 ms;

wait for 40 ms;

wait;
end process;
end Behavioral;
