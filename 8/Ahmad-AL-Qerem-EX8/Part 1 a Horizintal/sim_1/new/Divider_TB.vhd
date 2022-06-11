library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Divider_TB is
--  Port ( );
end Divider_TB;

architecture Behavioral of Divider_TB is
component Divider 
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT : out STD_LOGIC);
end component;

signal clk:std_logic:='0';
signal clk_out:std_logic;

begin
    UUT:Divider port map(clk,clk_out);
    CLKGenrator:process 
    begin
        wait for 5 ns; 
        clk<= not clk;
    end process;
    
    TB:process
    begin
    
    wait;
    
    end process;

end Behavioral;
