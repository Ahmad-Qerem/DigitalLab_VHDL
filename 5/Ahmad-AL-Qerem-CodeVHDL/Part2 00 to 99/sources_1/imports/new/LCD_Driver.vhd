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
component BCD_Counter is     
    Port (  
        clk: in STD_LOGIC;  
        Digit0: out  STD_LOGIC_VECTOR (3 downto 0);
        Digit1: out  STD_LOGIC_VECTOR (3 downto 0)
	); 
end component;

component Divider is
    Port ( 
        CLK_IN : in STD_LOGIC;
        CLK_OUT : out std_logic
     ); 
end component;
signal init_done, config_done, clko : std_logic:='0';
signal Digit0, Digit1: STD_LOGIC_VECTOR (3 downto 0);
signal startup_C,con_C,dis_C:integer range 0 to 2000000:=0;
signal start_done,con_done,dis_char_done:std_logic :='0';
begin
counter1 : BCD_Counter port map (clko, Digit0, Digit1);
div1 : divider port map(clk, clko);
process( clk )
begin
if (clk'event and clk='1')then 
    if (start_done='0')then--startup
        if (startup_C=2000000)then 
            RS<='0';
            RW<='0';
            E<='0';
            startup_C <= 0;
            start_done<='1';
        else
            startup_C <= startup_C + 1 ; 
        end if;
    elsif (start_done='1' and con_done='0' ) then--configration
        if (con_C = 0)then
            RS <= '0';
            RW <= '0';
            Data_bus <= x"38";            --Function Set command, 0x38
            E <= '1';
        elsif (con_C = 100) then
            E <= '0';
            
        elsif (con_C = 4100)then
            RS <= '0';
            RW <= '0';
            Data_bus <= x"06";            --Entry Mode Set command, 0x06
            E <= '1';
        elsif (con_C = 4200) then
            E <= '0';
            
        elsif (con_C = 8200 )then
            RS <= '0';
            RW <= '0';
            Data_bus <= x"0C";            --Display On/Off command, 0x0C
            E <= '1';
        elsif (con_C = 8300) then
            E <= '0';
            
         elsif (con_C = 12300)then
            RS <= '0';
            RW <= '0';
            Data_bus <= x"01";            --Clear Display command, 0x01
            E <= '1';
        elsif (con_C = 12400) then
            E <= '0';
              
        elsif (con_C = 176400)then-- wait for 1.64 ms
            con_C <= 0;
            con_done <= '1';    
        end if;
        con_C<=con_C+1;           
    elsif (start_done='1' and con_done='1')then --display
        if (dis_C = 0)then
            RS <= '0';
            RW <= '0';
            Data_bus <= x"86";            --addres at 06 location command, 0x38
            E <= '1';
        elsif (dis_C = 100) then
            E <= '0';
            
        elsif (dis_C = 4100)then        
            RS <= '1';
            RW <= '0';                                                             
            Data_bus <= "0011"&Digit1;            --        1 => dig 1
            E <= '1';
        elsif (dis_C = 4200) then
            E <= '0';
            
        elsif (dis_C = 8200)then
            RS <= '1';
            RW <= '0';
            Data_bus <= "0011"&Digit0;            --        2 => dig 0 
            E <= '1';
        elsif (dis_C = 8300) then
            E <= '0';
        end if;    
        dis_C <= dis_C+1; 
        if (dis_C=12300)then
            dis_C<=0;
        end if;
    end if;
end if;    
end process;
end Behavioral;