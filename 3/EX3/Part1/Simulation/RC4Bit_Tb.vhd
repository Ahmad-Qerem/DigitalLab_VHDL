library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity RC4Bit_Tb is
end RC4Bit_Tb;
architecture Behavioral of RC4Bit_Tb is
component RC4Bit port (
    CLK : in STD_LOGIC;
    E : in STD_LOGIC;
    R : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR (3 downto 0)
);
end component;
signal CLK,E,R:std_logic:='1';
signal Q: std_logic_vector (3 downto 0):="0000";

begin
    uut:RC4Bit port map(CLK,E,R,Q); 
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
    wait for 20 ns;
    
    E<='1';
    R<='0';
    wait for 10 ns;
    R<='1';
    
    wait for 200 ns; 
    
    R<='0';
    wait for 5 ns; 
    R<='1';
    wait for 200 ns;
    
    E<='0';
    wait for 50 ns;
    
    E<='1';
   
    wait;
    
    end process; 
end Behavioral;