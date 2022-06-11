library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
entity ASM is
    port (
        CLK, RESET, S, X , Y : in STD_LOGIC;
        Digit0 , Digit1 : out STD_LOGIC_VECTOR (3 downto 0)
    );
end ASM;
architecture Behavioral of ASM is
    type state_type is (T0, T1,T2,T3,T4);
    signal next_state :state_type ;
    signal current_state:state_type:=T0;
    signal temp0,temp1 :std_logic_vector (3 downto 0):="0000";
begin

    state_register : process( clk, reset)
    begin
        if(reset = '1') then
            current_State <= T0;

        elsif (clk'event and clk = '1') then
            current_State <= next_state;
            
            
        end if;
    end process;
    
    next_state_process : process( s, X, Y, current_State)
    begin
        case current_state is
            when T0 =>
                if ( s='1' )then
                   next_state <= T1; 
                else
                    next_state <= T0;
                end if;
            when T1 =>
                if (x='0') then
                    if (y='0') then
                        next_state <= T1;
                    else 
                        next_state <= T3;
                    end if;    
                else 
                    next_state <= T2;
                end if;
            when T2 =>
                if (x='1')then
                    if (y='0')then
                        next_state <= T2;
                    else 
                        next_state <= T4;
                    end if;    
                else 
                    next_state <= T1;
                end if;    
            when T3 =>
                if (y='0')then
                    next_state <= T1;
                else 
                    if (x='0')then 
                        next_state <= T3;
                    else 
                        next_state <= T4;    
                    end if;      
                end if;      
            when T4 =>
                if (y='0')then  
                    next_state <= T2;    
                else 
                    if (x='1')then 
                        next_state <= T4;
                    else
                        next_state <= T3;
                    end if; 
                end if;    
        end case;           
    end process;
    output_process : process(clk)
    begin
        if(clk'event and clk = '1') then
            case current_state is
                when T0 =>
                   Digit0<="0000";
                   Digit1<="0000";
                
                  
                when T2 =>
                if (x='0' and clk='1')then 
                    if (temp0 < "1001")then
                        temp0<=temp0+'1';
                        else 
                        temp0<="0000";
                        if (temp1 < "1001")then
                            temp1<=temp1+'1';
                        else 
                            Digit1<="0000";
                        end if;
                    end if; 
                end if;
    
                when T3 =>
                if (y='0') then
                    if (temp0 > "0000")then
                        temp0<=temp0-'1';
                    else 
                        temp0<="1001";
                        if (temp1>"0000")then
                            temp1<=temp1-'1';
                        else 
                            Digit1<="0000"; 
                        end if;
                    end if;
                end if;
    
                when T4 =>
                    if (y='0')then
                        if (temp0 > "0000")then
                            temp0<=temp0-'1';
                        else 
                            temp0<="1001";
                            if (temp1>"0000")then
                                temp1<=temp1-'1';
                            else 
                                Digit1<="0000"; 
                            end if;
                        end if;
                    elsif (x='0')then 
                        if (temp0 < "1001")then
                            temp0<=temp0+'1';
                            else 
                            Digit0<="0000";
                            if (temp1<"1001")then
                                temp1<=temp1+'1';
                            else 
                                Digit1<="1001";
                            end if;
                        end if; 
                    end if;    
                when T1 =>null;    
            end case;
        end if;
        Digit0<= temp0 ;
        Digit1<= temp1 ; 
    end process ; 
end Behavioral;