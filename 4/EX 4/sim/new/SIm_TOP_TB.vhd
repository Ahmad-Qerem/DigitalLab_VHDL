
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SIm_TOP_TB is
end SIm_TOP_TB;
architecture Behavioral of SIm_TOP_TB is
component Top_L_ASM 
    Port ( s : in STD_LOGIC;
           x : in STD_LOGIC;
           y : in STD_LOGIC;
           rest:in std_logic;
           clk : in STD_LOGIC;
           s7d : out STD_LOGIC_VECTOR (6 downto 0);
           c : out STD_LOGIC);
           end component;
signal CLK : std_logic:='0';
signal  RESET, S, X , Y,C : STD_LOGIC;
signal S7D:std_logic_vector(6 downto 0);
begin
UUT:Top_L_ASM port map (S,X,Y,RESET,CLK,S7D,C);
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
    RESET<='0';
    
    wait for 1 ms;
-----------------------    
    RESET<='1';
    wait for 1 ms;
    RESET<='0';
    wait for 1 ms;
    RESET<='1';
    wait for 1 ms;
    RESET<='0';
    wait for 1 ms;
    RESET<='1';
    wait for 1 ms;
    
    wait for 30 ms;
    
    RESET<='0';
    wait for 1 ms;
    RESET<='1';
    wait for 1 ms;
    RESET<='0';
    wait for 1 ms;
    RESET<='1';
    wait for 1 ms;
    RESET<='0';
    wait for 1 ms;
   ---------------- 
    wait for 100 ms;
    ------------
    S<='1';
    wait for 1 ms;
    S<='0';
    wait for 1 ms;
    S<='1';
    wait for 1 ms;
    S<='0';
    wait for 1 ms;
    S<='1';
    wait for 1 ms;
    
    wait for 30 ms;
    
    S<='0';
    wait for 1 ms;
    S<='1';
    wait for 1 ms;
    S<='0';
    wait for 1 ms;
    S<='1';
    wait for 1 ms;
    S<='0';
    wait for 1 ms;
    ---------------
    wait for 100 ms;
    -----------
    X<='1';
    wait for 1 ms;
    X<='0';
    wait for 1 ms;
    X<='1';
    wait for 1 ms;
    X<='0';
    wait for 1 ms;
    X<='1';
    wait for 1 ms;
    
    wait for 30 ms;
    
    X<='0';
    wait for 1 ms;
    X<='1';
    wait for 1 ms;
    X<='0';
    wait for 1 ms;
    X<='1';
    wait for 1 ms;
    X<='0';
    wait for 1 ms;
    --------
    wait for 100 ms;
    ----------
    X<='1';
    wait for 1 ms;
    X<='0';
    wait for 1 ms;
    X<='1';
    wait for 1 ms;
    X<='0';
    wait for 1 ms;
    X<='1';
    wait for 1 ms;
    
    wait for 30 ms;
    
    X<='0';
    wait for 1 ms;
    X<='1';
    wait for 1 ms;
    X<='0';
    wait for 1 ms;
    X<='1';
    wait for 1 ms;
    X<='0';
    wait for 1 ms;
    -----------
    wait for 100 ms;
    ----------    
    X<='1';
    wait for 1 ms;
    X<='0';
    wait for 1 ms;
    X<='1';
    wait for 1 ms;
    X<='0';
    wait for 1 ms;
    X<='1';
    wait for 1 ms;
    
    wait for 30 ms;
    
    X<='0';
    wait for 1 ms;
    X<='1';
    wait for 1 ms;
    X<='0';
    wait for 1 ms;
    X<='1';
    wait for 1 ms;
    X<='0';
    wait for 1 ms;
    ----------
    wait for 100 ms;
    --------
    Y<='1';
    wait for 1 ms;
    Y<='0';
    wait for 1 ms;
    Y<='1';
    wait for 1 ms;
    Y<='0';
    wait for 1 ms;
    Y<='1';
    wait for 1 ms;
    
    wait for 30 ms;
    
    Y<='0';
    wait for 1 ms;
    Y<='1';
    wait for 1 ms;
    Y<='0';
    wait for 1 ms;
    Y<='1';
    wait for 1 ms;
    Y<='0';
    wait for 1 ms;
    ---------
    wait for 100 ms;
    -------
    Y<='1';
    wait for 1 ms;
    Y<='0';
    wait for 1 ms;
    Y<='1';
    wait for 1 ms;
    Y<='0';
    wait for 1 ms;
    Y<='1';
    wait for 1 ms;
    
    wait for 30 ms;
    
    Y<='0';
    wait for 1 ms;
    Y<='1';
    wait for 1 ms;
    Y<='0';
    wait for 1 ms;
    Y<='1';
    wait for 1 ms;
    Y<='0';
    wait for 1 ms;
    --------------
    wait for 100 ms;
    ------
wait;
end process;
end Behavioral;