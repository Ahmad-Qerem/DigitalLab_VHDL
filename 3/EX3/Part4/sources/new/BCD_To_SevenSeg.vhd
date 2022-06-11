library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity BCD_To_SevenSeg is
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
end BCD_To_SevenSeg;
architecture Behavioral of BCD_To_SevenSeg is
signal temp:std_logic_vector(6 downto 0);
begin
process(BCD)
begin
    case BCD is 
        when "0000"=>temp<="1111110";
        when "0001"=>temp<="0110000";
        when "0010"=>temp<="1101101";
        when "0011"=>temp<="1111001";
        when "0100"=>temp<="0110011";
        when "0101"=>temp<="1011011";
        when "0110"=>temp<="1011111";
        when "0111"=>temp<="1110000";
        when "1000"=>temp<="1111111";
        when "1001"=>temp<="1111011";
        when others => temp<=(others=>'0'); 
    end case;
end process;
    AA <=temp(6);
    AB <=temp(5);
    AC <=temp(4);
    AD <=temp(3);
    AE <=temp(2);
    AF <=temp(1);
    AG <=temp(0);
end Behavioral;