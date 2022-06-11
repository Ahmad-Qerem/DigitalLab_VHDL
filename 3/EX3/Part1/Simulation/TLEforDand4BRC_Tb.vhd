library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TLEforDand4BRC_Tb is
end TLEforDand4BRC_Tb;

architecture Behavioral of TLEforDand4BRC_Tb is
component TLEofDand4BRC port (
    CLK : in STD_LOGIC;
    E : in STD_LOGIC;
    R : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR (3 downto 0)
);
end component;
signal CLK,E,R:std_logic:='1';
signal Q: std_logic_vector (3 downto 0):="0000";

begin
    uut:TLEofDand4BRC port map(CLK,E,R,Q); 
    clk_G: process
    begin
        CLK<='0';
        wait for 5 ns;
        CLK<='1';
        wait for 5 ns;
    end process;
    sim:process
    begin
    E<='0';
    wait for 20 ms;
    E<='1';
    R<='0';
    wait for 10 ms;
    R<='1';
    
    wait for 10000 ms;
    
    R<='0';
    wait for 10 ms;
    R<='1';
    
    wait;
    end process; 
end Behavioral;