library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Time_Mux_Tb is
--  Port ( );
end Time_Mux_Tb;

architecture Behavioral of Time_Mux_Tb is
component Time_MUX 
    Port ( 
        clk : in STD_LOGIC;
        Digit0 : in STD_LOGIC_VECTOR (3 downto 0);
        Digit1 : in STD_LOGIC_VECTOR (3 downto 0);
        BCD_Value : out STD_LOGIC_VECTOR (3 downto 0);
        DigSelect : out STD_LOGIC
        );
end component;
signal clk,DigSelect:std_logic:='0';
signal Digit0,Digit1,BCD_Value:std_logic_vector(3 downto 0):="0000";

begin
uut:Time_MUX port map(clk,Digit0,Digit1,BCD_Value,DigSelect);
clk_G:process
begin
clk<='0';
wait for 5 ns;
clk<='1';
wait for 5 ns;
end process;
sim:process
begin
Digit0<="0000";
Digit1<="0001";
wait for 400 ms;
Digit0<="1001";
Digit1<="0001";
wait for 400 ms;
wait;
end process;
end Behavioral;
