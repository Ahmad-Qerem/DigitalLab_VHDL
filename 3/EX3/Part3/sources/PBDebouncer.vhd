library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity PBDebouncer is
    Port ( 
        CLK : in STD_LOGIC;
        PB : in STD_LOGIC;
        PB_debounced: out STD_LOGIC
        );
end PBDebouncer;
architecture Behavioral of PBDebouncer is
constant COUNT_MAX:integer := 1000000; 
SIGNAL BTN_ACTIVE : std_logic := '0';
signal count : integer := 0;
type state_type is (idle,wait_time);
signal state : state_type := idle;
begin
process(CLK)
begin
   if(CLK'event and CLK='1') then
        case (state) is
            when idle =>
                if(PB /= BTN_ACTIVE) then  
                    state <= wait_time;
                else
                    state <= idle;
                end if;
            when wait_time =>
                if(count = COUNT_MAX) then
                    count <= 0;
                    BTN_ACTIVE <= NOT BTN_ACTIVE;
                    state <= idle;  
                else
                    count <= count + 1;
                end if; 
        end case;       
    end if;        
end process;   
PB_debounced <= BTN_ACTIVE;                                                                                       
end Behavioral;