library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;

entity BCD_To_7s_Tb is
--  Port ( );
end BCD_To_7s_Tb;

architecture Behavioral of BCD_To_7s_Tb is
component BCD_To_SevenSeg 
    Port ( 
        BCD: in STD_LOGIC_VECTOR(3 downto 0);
        AA : out STD_LOGIC;
        AB : out STD_LOGIC;
        AC : out STD_LOGIC;
        AD : out STD_LOGIC;
        AE : out STD_LOGIC;
        AF : out STD_LOGIC;
        AG : out STD_LOGIC
        );
        end component;
        
signal AA,AB,AC,AD,AE,AF,AG:std_logic:='0';
signal BCD:std_logic_vector(3 downto 0):="0000";
begin
UUT:BCD_To_SevenSeg port map (BCD,AA,AB,AC,AD,AE,AF,AG);

sim:process
begin
Bcd<="0000";
wait for 10 ns;
Bcd<="0001";
wait for 10 ns;
Bcd<="0010";
wait for 10 ns;
Bcd<="0011";
wait for 10 ns;
Bcd<="0100";
wait for 10 ns;
Bcd<="0101";
wait for 10 ns;
Bcd<="0110";
wait for 10 ns;
Bcd<="0111";
wait for 10 ns;
Bcd<="1000";
wait for 10 ns;
Bcd<="1001";
wait for 10 ns;
Bcd<="1010";
wait for 10 ns;
Bcd<="1011";
wait for 10 ns;
Bcd<="0000";
wait for 10 ns;
wait;
end process;
end Behavioral;
