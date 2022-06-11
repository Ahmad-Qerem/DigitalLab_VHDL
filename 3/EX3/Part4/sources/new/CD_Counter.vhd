library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
entity BCD_Counter is
Port ( 
    clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    UpDown: in STD_LOGIC;
    Digit0: out STD_LOGIC_VECTOR (3 downto 0);
    Digit1: out STD_LOGIC_VECTOR (3 downto 0));
end BCD_Counter;
architecture Behavioral of BCD_Counter is

signal temp0,temp1:std_logic_vector(3 downto 0):="0000";

begin
process (clk,Reset,UpDown)
begin
    if (Reset = '0') then
        temp0<="0000";
        temp1<="0000";
    else
        if (clk'event and clk='1')then
            if (UpDown='1')then
                if (temp0 < "1001")then
                    temp0<=temp0+'1';
                else 
                    temp0<="0000";
                    if (temp1<"1001")then
                        temp1<=temp1+'1';
                        
                    else 
                        temp1<="0000";
                    end if;
                end if; 
            elsif (UpDown='0')then
                 if (temp0 > "0000")then
                    temp0<=temp0-'1';
                else 
                    temp0<="1001";
                    if (temp1>"0000")then
                        temp1<=temp1-'1';
                    else 
                        temp1<="1001"; 
                    end if;
                end if; 
            end if;
        else 
            null;
        end if;--2
    end if;--1 
        Digit0<=temp0;
        Digit1<=temp1;
end process;
end Behavioral;