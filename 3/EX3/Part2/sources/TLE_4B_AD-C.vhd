library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TLE_4B_AD_C is
    Port (
        UpDown : in STD_LOGIC;
        reset : in STD_LOGIC;
        clk : in STD_LOGIC;
        cnt : out STD_LOGIC_VECTOR(3 downto 0)
        );
end TLE_4B_AD_C;
architecture Behavioral of TLE_4B_AD_C is
component Divider Port ( 
    CLK_IN : in STD_LOGIC;
    CLK_OUT : out STD_LOGIC
     );
end component;
component AutoUpDownCounter 
        Port (
        UpDown : in STD_LOGIC;
        reset : in STD_LOGIC;
        clk : in STD_LOGIC;
        cnt : out STD_LOGIC_VECTOR(3 downto 0)
        ); 
end component;
signal clk2:std_logic;
           
begin
mod1:Divider port map(
    CLK_IN => clk,
    CLK_OUT => clk2
    );
mod2:AutoUpDownCounter port map (UpDown,reset,clk2,cnt);      
end Behavioral;