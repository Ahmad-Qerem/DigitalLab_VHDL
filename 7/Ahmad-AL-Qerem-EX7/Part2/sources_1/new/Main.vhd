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
        LED : out STD_LOGIC_VECTOR (7 downto 0) :="00000000"
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
type state_type is (idial,sendH,sende,sendl,sendl2,sendo,waits); 
    signal current_state:state_type:= idial;
    signal next_char:state_type:= idial;
    signal next_state:state_type:= idial;
    signal EOC,EOT :std_logic;
    signal WR :std_logic :='0';
    signal READY :std_logic;
    signal LEDOUT:std_logic_vector (7 downto 0);
    signal INP:std_logic_vector (7 downto 0):="00000000";
    signal counter :integer range 0 to 100 :=0;
    signal counter2 :integer range 0 to 1000000 :=0;
    
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

process (clk,EOT)
begin
    case current_state is 
        when idial =>
            if (EOC='1')then 
                counter2<=0;
                next_state <= sendH;
            end if;
        when sendH =>
            if ( falling_edge( EOT )) then 
                next_state <= waits;
                next_char<=sende;
            end if;
        when sende =>
            if (falling_edge( EOT )) then 
                next_state <= waits;
                next_char<=sendl;
            end if;
        when sendl =>
            if (falling_edge( EOT )) then 
                next_state <= waits;
                next_char<=sendl2;
            end if; 
       when sendl2 =>
            if (falling_edge( EOT )) then 
                next_state <= waits;
                next_char<=sendo;
            end if;
       when sendo =>
            if (falling_edge( EOT )) then 
                next_state <= waits;
                next_char<=idial;
            end if;
        when waits => 
            if ((counter2 = 1000000) or(counter2 = 2000000) or(counter2 = 3000000) or(counter2 = 4000000) or(counter2 = 5000000)) then 
                next_state <= next_char;
            end if; 
            counter2<= counter2+1;                     
    end case;          
end process;
process (clk,EOT)
begin
    if falling_edge(EOT) then
        counter <= 0; 
    end if ;
    if (CLK'event and CLK='1' )then
    
        if (current_state = idial )then
	       LED <= LEDOUT;
           INP<= X"00";
           counter <= 0;
            
        elsif (current_state = sendH) then 
            if (counter = 1)then
                INP<= X"48";--H
            elsif (counter = 20)then 
                wr<='1';
            elsif (counter = 21)then 
                wr<='0';          
            end if;
            counter <= counter + 1;
               
        elsif (current_state = sende) then 
            if (counter = 1)then
                INP<= X"65";--e
            elsif (counter = 20)then 
                wr<='1';
            elsif (counter = 21)then 
                wr<='0';          
            end if;
            counter <= counter + 1;
            
        elsif (current_state = sendl) then 
            if (counter = 1)then
                INP<= X"6C";--l
            elsif (counter = 20)then 
                wr<='1';
            elsif (counter = 21)then 
                wr<='0';       
            end if;
            counter <= counter + 1;
            
        elsif (current_state = sendl2) then
            if (counter = 1)then
                INP<= X"6C";--l
            elsif (counter = 20)then 
                wr<='1';
            elsif (counter = 21)then 
                wr<='0';            
            end if;
            counter <= counter + 1;
            
        elsif (current_state = sendo) then 
            if (counter = 1)then
                INP<= X"6F";--o
            elsif (counter = 20)then 
                wr<='1';
            elsif (counter = 21)then 
                wr<='0';          
            end if;
            counter <= counter + 1;
             
        end if; 
        current_state <= next_state;
    end if ;   
end process;
end Behavioral;