library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity PBUpDownCounter is
    Port ( 
        CLK : in STD_LOGIC;
        Reset : in STD_LOGIC;
        UpDown : in STD_LOGIC;
        PB : in STD_LOGIC;
        cnt : out STD_LOGIC_VECTOR (3 downto 0)
        );
end PBUpDownCounter;
architecture Behavioral of PBUpDownCounter is
component AutoUpDownCounter Port (
        UpDown : in STD_LOGIC;
        reset : in STD_LOGIC;
        clk : in STD_LOGIC;
        cnt : out STD_LOGIC_VECTOR(3 downto 0)
        ); 
end component;
component PBDebouncer Port ( 
        CLK : in STD_LOGIC;
        PB : in STD_LOGIC;
        PB_debounced: out STD_LOGIC
        );
end component;
signal PB_debounced2:std_logic; 
begin 
mod1 : PBDebouncer port map(CLK,PB,PB_debounced2);
mod2 : AutoUpDownCounter port map (UpDown,reset,PB_debounced2,cnt); 
end Behavioral;