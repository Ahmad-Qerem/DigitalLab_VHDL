library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.ALL;
entity Divider is
    Port ( 
        CLK_IN : in STD_LOGIC;
        CLK_OUT : out STD_LOGIC
           );
end Divider;

architecture Behavioral of Divider is
signal count:integer range 0 to 4:=0;
signal CLK : std_logic := '0';
begin
    process (CLK_IN)
    begin
        if (rising_edge( CLK_IN )) then  
            if (count=1)then 
                CLK<=not CLK;
                count<=0;
            else    
                count<= count +1 ;   
            end if;
        end if;         
    end process; 
    CLK_OUT <= CLK;   
end Behavioral;
