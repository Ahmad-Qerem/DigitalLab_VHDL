library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Asm_TB is
end Asm_TB;

architecture Behavioral of Asm_TB is
component ASM port (
        CLK, RESET, S, X , Y : in STD_LOGIC;
        Digit0 , Digit1 : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;
signal CLK : std_logic:='0';
signal  RESET, S, X , Y : STD_LOGIC;
signal Digit0 , Digit1 : STD_LOGIC_VECTOR (3 downto 0);

begin
UUT: ASM port map (CLK, RESET,S,X,Y,Digit0,Digit1);
CLOKP: process 
begin
CLK <= not CLK;
wait for 5 ns; 
end process;

TP:process
begin
    x<='0';
    y<='0';
    s<='0';
    RESET<='1';
    wait for 1ms;
    RESET<='0';

    wait for 1 ms;
    
    S<='1';
    wait for 1 ms;
    S<='0';
    wait for 1 ms;
    

    
    wait for 1 ms;
    
    X<='1';
    wait for 3 ms;
    X<='0';
    
    wait for 1 ms;
   
    X<='1';
    wait for 3 ms;
    X<='0';
    
    wait for 1 ms;
        
    X<='1';
    wait for 3 ms;
    X<='0';
    
    wait for 1 ms;
    
    y<='1';
    wait for 3 ms;
    y<='0';
    
    wait for 1 ms;
    
    y<='1';
    wait for 3 ms;
    y<='0';
    
    wait for 1 ms;
    
    X<='1';
    wait for 2 ms;
    y<='1';
    wait for 1 ms;
    X<='0';
    wait for 1 ms ;
    Y<='0';
    wait for 5 ms;
    
    
    RESET<='1';
    wait for 2ms;
    RESET<='0';  

    wait;
end process;
end Behavioral;
