library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity LCD_TB is
--  Port ( );
end LCD_TB;

architecture Behavioral of LCD_TB is
component LCD_Driver 
    Port ( 
           clk : in STD_LOGIC;
           E : out STD_LOGIC;
           RS : out STD_LOGIC;
           RW : out STD_LOGIC;
           Data_bus : out STD_LOGIC_VECTOR (7 downto 0)
           );
end component;  
signal clk:std_logic:='0';
signal E,RS,RW:std_logic;
signal Data_bus:std_logic_vector (7 downto 0);         
begin
UUT: LCD_Driver port map (
        clk => clk,
        E => E,
        RS => RS,
        RW => RW,
        Data_bus => Data_bus
    );
CLK_GENRATOR:process 
begin
    clk<= not clk;
    wait for 5 ns;
end process;    
TBP:process
begin
    wait for 100 ms;
end process;

end Behavioral;
