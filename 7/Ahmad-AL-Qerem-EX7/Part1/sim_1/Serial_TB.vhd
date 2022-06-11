library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE STD.TEXTIO.ALL;
ENTITY Serial_TB IS
END Serial_TB;

ARCHITECTURE testbench_arch OF Serial_TB IS
    COMPONENT Main
        Port ( 
            CLK : in STD_LOGIC;
            Reset : in STD_LOGIC;
            RXD : in STD_LOGIC;
            TXD : out STD_LOGIC;
            LED : out STD_LOGIC_VECTOR (7 downto 0)
            );
    END COMPONENT;

    SIGNAL CLOCK : std_logic := '0';
    SIGNAL Reset : std_logic := '0';
    SIGNAL EOC : std_logic := '0';
    SIGNAL OUTP : std_logic_vector (7 DownTo 0) := "ZZZZZZZZ";
    SIGNAL RXD : std_logic := '1';
    SIGNAL TXD : std_logic := '0';

    constant PERIOD : time := 5 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : Main PORT MAP (
            CLK => CLOCK,
            Reset => Reset,
            RXD => RXD,
            TXD => TXD,
            LED => OUTP
        );
        process
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                CLOCK <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                CLOCK <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;
        PROCESS
            BEGIN
                WAIT FOR 1 ms;

                --next byte a=x"61" in binary "01100001"
                RXD <= '0';--start bit
                wait for 1.64417 us;
                
                --Data  
                RXD <= '1';--D0
                wait for 1.64417 us;
                
                RXD <= '0';--D1
                wait for 1.64417 us;
                
                RXD <= '0';--D2
                wait for 1.64417 us;
                
                RXD <= '0';--D3
                wait for 1.64417 us;
                
                RXD <= '0';--D4
                wait for 1.64417 us;
                
                RXD <= '1';--D5
                wait for 1.64417 us;
                
                RXD <= '1';--D6
                wait for 1.64417 us;
                
                RXD <= '0';--D7
                wait for 1.64417 us;
                
                RXD <= '1';--Stop bit
                
                
                wait for 1 ms;
                RXD <= '0';--start bit
                wait for 1.64417 us;
                
                --Data  --next byte b=x"62" in binary "01100010" 
                RXD <= '0';--D0
                wait for 1.64417 us;
                
                RXD <= '1';--D1
                wait for 1.64417 us;
                
                RXD <= '0';--D2
                wait for 1.64417 us;
                
                RXD <= '0';--D3
                wait for 1.64417 us;
                
                RXD <= '0';--D4
                wait for 1.64417 us;
                
                RXD <= '1';--D5
                wait for 1.64417 us;
                
                RXD <= '1';--D6
                wait for 1.64417 us;
                
                RXD <= '0';--D7
                wait for 1.64417 us;
                
                RXD <= '1';--Stop bit
                
                wait;

            END PROCESS;
    END testbench_arch;