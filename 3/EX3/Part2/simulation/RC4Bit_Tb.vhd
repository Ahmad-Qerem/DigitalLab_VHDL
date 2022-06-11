library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity RC4Bit_Tb is
--  Port ( );
end RC4Bit_Tb;

architecture Behavioral of RC4Bit_Tb is
component AutoUpDownCounter 
    Port (
        UpDown : in STD_LOGIC;
        reset : in STD_LOGIC;
        clk : in STD_LOGIC;
        cnt : out STD_LOGIC_VECTOR(3 downto 0)
        );
end component;
signal UpDown,reset,clk:std_logic:='0';
signal cnt:std_logic_vector(3 downto 0);      
begin
UUT:AutoUpDownCounter port map(UpDown,reset,clk,cnt);
CLK_Genrator: process
begin
clk<='1';
wait for 5 ns;
clk<='0';
wait for 5 ns;
end process;
sim:process 
begin
reset <= '0';
wait for 5 ns;
reset <= '1';
UpDown <= '1';
wait for 100 ns;

UpDown <= '0';
wait for 100 ns;

reset <= '0';
wait for 5 ns;

reset <= '1';
wait for 50 ns;
UpDown <= '1';
wait;
end process;
end Behavioral;