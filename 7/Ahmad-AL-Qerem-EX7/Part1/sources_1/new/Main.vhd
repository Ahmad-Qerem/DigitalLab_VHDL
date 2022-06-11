library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std;
use IEEE.std_logic_unsigned.all;
entity Main is
    Port ( 
        CLK : in STD_LOGIC;
        Reset : in STD_LOGIC;
        RXD : in STD_LOGIC;
        TXD : out STD_LOGIC;
        LED : out STD_LOGIC_VECTOR (7 downto 0)
        );
end Main;
architecture Behavioral of Main is
component Minimal_UART_CORE 
port( 
	  CLOCK : in std_logic;
	  EOC : out std_logic;
	  OUTP : inout std_logic_vector(7 downto 0) := "ZZZZZZZZ";
	  RXD : in	std_logic;	
	  TXD : out std_logic;
	  EOT :	out std_logic;
	  INP : in std_logic_vector(7 downto 0);	
	  READY : out std_logic;
	  WR : in std_logic
    );
end component;
    signal EOC,EOT :std_logic;
    signal READY:std_logic:='1';
    signal WR:std_logic:='0';
    signal LEDOUT:std_logic_vector (7 downto 0);
    signal INP:std_logic_vector (7 downto 0);
    signal counter :integer range 0 to 50000000:=0;
begin
mod1 : Minimal_UART_CORE port map (
CLOCK => CLK ,
EOC => EOC,
OUTP => LEDOUT,
RXD => RXD,
TXD => TXD,
EOT => EOT,
INP => INP ,
READY => READY ,
WR => WR
);

process (CLK)--Reseving
begin
if (CLK'event and CLK='1' )then
    counter<=counter+1;
    if (EOC='1')then
        LED <= LEDOUT;
        counter<=0;
        INP <= LEDOUT+'1';
        READY<='0';
        WR <= '1';
    elsif (counter = 5 )then
        WR<= '0';
    elsif (EOT = '1') then
        READY<='1';
    end if;
end if ;
end process;

end Behavioral;
