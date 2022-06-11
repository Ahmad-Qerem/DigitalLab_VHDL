library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TLE_BCDC_Tb is
--  Port ( );
end TLE_BCDC_Tb;

architecture Behavioral of TLE_BCDC_Tb is
component TLE_99C 
Port ( 
    clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    UpDown: in STD_LOGIC;
    C: out STD_LOGIC;
    Seven_Seq_Code: out std_logic_vector(6 downto 0)
    );
    end component;
    signal clk,Reset,UpDown,c:std_logic:='0';
    signal Seven_Seq_Code:std_logic_vector(6 downto 0):="0000000";

begin
UUT:TLE_99C port map(clk,Reset,UpDown,c,Seven_Seq_Code);
clk_G:process
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
wait for 1000000 ms;
wait ;
end process;
end Behavioral;