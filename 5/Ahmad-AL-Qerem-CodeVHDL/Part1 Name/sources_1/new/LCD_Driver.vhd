library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity LCD_Driver is
    Port ( 
           clk : in STD_LOGIC;
           E : out STD_LOGIC;
           RS : out STD_LOGIC;
           RW : out STD_LOGIC;
           Data_bus : out STD_LOGIC_VECTOR (7 downto 0)
           );
end LCD_Driver;

architecture Behavioral of LCD_Driver is
signal myCounter,con_C,dis_C:integer range 0 to 10000000:=0;
signal start_done,con_done,dis_char_done:std_logic :='0';
begin
process( clk )
begin
if (clk'event and clk='1')then 
    myCounter <= myCounter + 1 ;
    if (start_done='0' )then--startup
            RS<='0';
            RW<='0';
            E<='0';
        if (myCounter=2000000)then 
            myCounter <= 0;
            start_done<='1';
        end if;
    elsif (start_done='1' and con_done='0') then--configration
        if (myCounter = 1)then
            RS <= '0';
            RW <= '0';
            Data_bus <= x"38";            --Function Set command, 0x38
            E <= '1';
        elsif (myCounter = 100) then
            E <= '0';
            
        elsif (myCounter = 4100)then
            RS <= '0';
            RW <= '0';
            Data_bus <= x"06";            --Entry Mode Set command, 0x06
            E <= '1';
        elsif (myCounter = 4200) then
            E <= '0';
            
        elsif (myCounter = 8200 )then
            RS <= '0';
            RW <= '0';
            Data_bus <= x"0C";            --Display On/Off command, 0x0C
            E <= '1';
        elsif (myCounter = 8300) then
            E <= '0';
            
         elsif (myCounter = 12300)then
            RS <= '0';
            RW <= '0';
            Data_bus <= x"01";            --Clear Display command, 0x01
            E <= '1';
        elsif (myCounter = 12400) then
            E <= '0';
              
        elsif (myCounter = 176400)then-- wait for 1.64 ms
        
            myCounter <= 0;
            con_done <= '1';    
        end if;
           
    elsif (start_done='1' and con_done='1' and dis_char_done='0' )then --display
        if (myCounter = 1)then
            RS <= '0';
            RW <= '0';
            Data_bus <= x"8F";            --addres at 01 location command, 0x38
            E <= '1';
        elsif (myCounter = 100) then
            E <= '0';
            
        elsif (myCounter = 4100)then        
            RS <= '1';
            RW <= '0';                                                             
            Data_bus <= x"41";            --        1 => X"41",--A
            E <= '1';
        elsif (myCounter = 4200) then
            E <= '0';
            
        elsif (myCounter = 8200)then
            RS <= '1';
            RW <= '0';
            Data_bus <= x"68";            --        2 => X"68",--h
            E <= '1';
        elsif (myCounter = 8300) then
            E <= '0';
            
        elsif (myCounter = 12300)then
            RS <= '1';
            RW <= '0';
            Data_bus <= x"6D";            --        3 => X"6D",--m
            E <= '1';
        elsif (myCounter = 12400) then
            E <= '0';
            
        elsif (myCounter = 16400)then
            RS <= '1';
            RW <= '0';
            Data_bus <= x"61";            --        4 => X"61",--a
            E <= '1';
        elsif (myCounter = 16500) then
            E <= '0';
            
        elsif (myCounter = 20500)then
            RS <= '1';
            RW <= '0';
            Data_bus <= x"64";            --        5 => X"64",--d
            E <= '1';
        elsif (myCounter = 20600) then
            E <= '0';
            
        elsif (myCounter = 24600)then
            RS <= '1';
            RW <= '0';
            Data_bus <= x"20";            --        6 => X"20",-- 
            E <= '1';
        elsif (myCounter = 24700) then
            E <= '0';
            
        elsif (myCounter = 28700)then
            RS <= '1';
            RW <= '0';
            Data_bus <= x"41";            --        7 => X"41",--A
            E <= '1';
        elsif (myCounter = 28800) then
            E <= '0';
            
        elsif (myCounter = 32800)then
            RS <= '1';
            RW <= '0';
            Data_bus <= x"4C";            --        8 => X"4C",--L
            E <= '1';
        elsif (myCounter = 32900) then
            E <= '0';
            
        elsif (myCounter = 36900)then
            RS <= '1';
            RW <= '0';
            Data_bus <= x"2D";            --        9 => X"2D",--(-)
            E <= '1';
        elsif (myCounter = 37000) then
            E <= '0';
            
        elsif (myCounter = 41000)then
            RS <= '1';
            RW <= '0';
            Data_bus <= x"51";            --        10 => X"51",--Q
            E <= '1';
        elsif (myCounter = 41100) then
            E <= '0';
            
        elsif (myCounter = 45100)then
            RS <= '1';
            RW <= '0';
            Data_bus <= x"65";            --        11 => X"65",--e
            E <= '1';
        elsif (myCounter = 45200) then
            E <= '0';
            
        elsif (myCounter = 49200)then
            RS <= '1';
            RW <= '0';
            Data_bus <= x"72";            --        12 => X"72",--r
            E <= '1';
        elsif (myCounter = 49300) then
            E <= '0';
        
        elsif (myCounter = 53300)then
            RS <= '1';
            RW <= '0';
            Data_bus <= x"65";            --        13 => X"65",--e
            E <= '1';
        elsif (myCounter = 53400) then
            E <= '0';
            
        elsif (myCounter = 57400)then
            RS <= '1';
            RW <= '0';
            Data_bus <= x"6D";            --        14 => X"6D",--m
            E <= '1';
        elsif (myCounter = 57500) then
            E <= '0'; 
                   
        elsif (myCounter = 61500) then
            myCounter <= 0;
            dis_char_done<='1';
             end if;
        elsif (dis_char_done='1')then
            if (myCounter = 1)then
            RS <= '0';
            RW <= '0';
            Data_bus <= x"18";            --        14 => X"6D",--shift display left comman
            E <= '1';
        elsif (myCounter = 100) then
            E <= '0';
              
        elsif (myCounter=50000100)then 
               myCounter<=0;
               dis_char_done<='0'; 
        end if;    
    end if;
end if;    
end process;
end Behavioral;