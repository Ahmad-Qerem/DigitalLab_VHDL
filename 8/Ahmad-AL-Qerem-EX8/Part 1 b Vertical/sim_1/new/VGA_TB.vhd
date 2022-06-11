library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity VGA_TB is
--  Port ( );
end VGA_TB;
architecture Behavioral of VGA_TB is
component VGAController 
    Port ( 
        CLK : in STD_LOGIC;
        Reset : in STD_LOGIC;
        HS : out STD_LOGIC;
        VS : out STD_LOGIC;
        RED : out STD_LOGIC_VECTOR (3 downto 0);
        GREEN : out STD_LOGIC_VECTOR (3 downto 0);
        BLUE : out STD_LOGIC_VECTOR (3 downto 0)
        );
end component;
SIGNAL CLK,Reset :std_logic:='0';
SIGNAL HS,VS :std_logic;
SIGNAL RED,GREEN,BLUE :std_logic_vector( 3 downto 0);
begin
UUT:VGAController port map(CLK,Reset,HS,VS,RED,GREEN,BLUE);
CLK_GENRATORE: process
    begin
        wait for 5 ns;
        CLK<= not CLK;
    end process;
TB:process
    begin
        wait for 100 ms;
        Reset<= '1';
        wait for 100 ns;
        Reset<= '0';
        wait;
    end process;    
end Behavioral;
