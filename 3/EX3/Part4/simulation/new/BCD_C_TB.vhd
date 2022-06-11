library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity BCD_C_TB is
--  Port ( );
end BCD_C_TB;

architecture Behavioral of BCD_C_TB is
component BCD_Counter 
    Port ( 
    clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    UpDown: in STD_LOGIC;
    Digit0: out STD_LOGIC_VECTOR (3 downto 0);
    Digit1: out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;
signal clk,Reset,UpDown:std_logic:='0';
signal Digit0,Digit1:std_logic_vector(3 downto 0):="0000";
begin
UUT:BCD_Counter port map (clk,Reset,UpDown,Digit0,Digit1);
CLK_G:process
begin
clk<='0';
wait for 5 ns;
clk<='1';
wait for 5 ns;
end process;
sim:process
begin
Reset<='0';
wait for 5 ns;
Reset<='1';
UpDown<='1';
wait for 200 ns;
UpDown<='0';
wait for 250 ns;
UpDown<='1';
wait;
end process;

end Behavioral;
