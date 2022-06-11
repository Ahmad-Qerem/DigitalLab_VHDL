library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TLE_99C is
Port ( 
    clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    UpDown: in STD_LOGIC;
    C: out STD_LOGIC;
    Seven_Seq_Code: out std_logic_vector(6 downto 0)
    );
end TLE_99C;
architecture Behavioral of TLE_99C is
component BCD_Counter Port ( 
    clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    UpDown: in STD_LOGIC;
    Digit0: out STD_LOGIC_VECTOR (3 downto 0);
    Digit1: out STD_LOGIC_VECTOR (3 downto 0));
end component;
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
component Divider
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT : out STD_LOGIC
           );
end component;
component Time_MUX 
    Port ( 
        clk : in STD_LOGIC;
        Digit0 : in STD_LOGIC_VECTOR (3 downto 0);
        Digit1 : in STD_LOGIC_VECTOR (3 downto 0);
        BCD_Value : out STD_LOGIC_VECTOR (3 downto 0);
        DigSelect : out STD_LOGIC
        ); 
end component;
signal div_out:std_logic;
signal dig0,dig1,BCD:std_logic_vector(3 downto 0);
signal AA,AB,AC,AD,AE,AF,AG:std_logic;
begin
mod1:Divider port map (clk,div_out);
mod2:BCD_Counter port map(div_out,Reset,UpDown,dig0,dig1);
mod3:Time_MUX port map(clk,dig0,dig1,BCD,C);
mod4:BCD_To_SevenSeg port map(BCD,AA,AB,AC,AD,AE,AF,AG);
Seven_Seq_Code(6)<= AA;
Seven_Seq_Code(5)<= AB;
Seven_Seq_Code(4)<= AC;
Seven_Seq_Code(3)<= AD;
Seven_Seq_Code(2)<= AE;
Seven_Seq_Code(1)<= AF;
Seven_Seq_Code(0)<= AG;
end Behavioral;