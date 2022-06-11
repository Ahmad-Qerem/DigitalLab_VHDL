library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TLEofDand4BRC is
    Port ( CLK : in STD_LOGIC;
           E : in STD_LOGIC;
           R : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end TLEofDand4BRC;

architecture Behavioral of TLEofDand4BRC is
component RC4Bit port (
    CLK : in STD_LOGIC;
    E : in STD_LOGIC;
    R : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR (3 downto 0)
);
end component;
component Divider port (
    CLK_IN : in STD_LOGIC;
    CLK_OUT : out STD_LOGIC 
);
end component;
signal CLKto:std_logic;
begin
Divmod:Divider port map (
CLK_IN=>CLK,
CLK_OUT=>CLKto
);
RC4Bitmod:RC4Bit port map (CLKto,E,R,Q);
end Behavioral;
