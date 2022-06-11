library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity RC4Bit is
    Port ( CLK : in STD_LOGIC;
           E : in STD_LOGIC;
           R : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end RC4Bit;
architecture Behavioral of RC4Bit is
component TFF port (
    T : in STD_LOGIC;
    CLK : in STD_LOGIC;
    Clear : in STD_LOGIC;
    Q : out STD_LOGIC;
    Qbar : out STD_LOGIC
);
end component;
signal Qb:std_logic_vector(3 downto 0);
begin
mod1 : TFF port map(E,CLK,R,Q(0),Qb(0));
mod2 : TFF port map(E,Qb(0),R,Q(1),Qb(1));
mod3 : TFF port map(E,Qb(1),R,Q(2),Qb(2));
mod4 : TFF port map(E,Qb(2),R,Q(3),Qb(3));
end Behavioral;