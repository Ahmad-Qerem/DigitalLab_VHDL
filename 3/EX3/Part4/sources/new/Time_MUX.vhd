library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Time_MUX is
    Port ( 
        clk : in STD_LOGIC;
        Digit0 : in STD_LOGIC_VECTOR (3 downto 0);
        Digit1 : in STD_LOGIC_VECTOR (3 downto 0);
        BCD_Value : out STD_LOGIC_VECTOR (3 downto 0);
        DigSelect : out STD_LOGIC
        );
end Time_MUX;
architecture Behavioral of Time_MUX is
signal count:integer range 0 to 1000000:=0;
signal CLK1 : std_logic := '0';
begin
process(clk)
begin
    if (clk'event and clk='1') then  
        if (count=1000000)then 
            CLK1<=not CLK1;
            count<=0;
   
        else
             count<= count +1;
        end if;
     end if;         
 if (CLK1='0')then
      BCD_Value<=Digit0;
 else 
      BCD_Value<=Digit1;
 end if;
         
   
end process;
           DigSelect <= CLK1; 
end Behavioral;
