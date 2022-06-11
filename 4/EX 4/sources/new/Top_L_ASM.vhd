library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top_L_ASM is
    Port ( s : in STD_LOGIC;
           x : in STD_LOGIC;
           y : in STD_LOGIC;
           rest:in std_logic;
           clk : in STD_LOGIC;
           s7d : out STD_LOGIC_VECTOR (6 downto 0);
           c : out STD_LOGIC);
end Top_L_ASM;

architecture Behavioral of Top_L_ASM is

component ASM port (
        clk, RESET, S, X , Y : in STD_LOGIC;
        Digit0 , Digit1 : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component; 
   
component PBDebouncer Port ( 
        clk : in STD_LOGIC;
        PB : in STD_LOGIC;
        PB_debounced: out STD_LOGIC
        );
end component;

component Time_MUX Port ( 
        clk : in STD_LOGIC;
        Digit0 : in STD_LOGIC_VECTOR (3 downto 0);
        Digit1 : in STD_LOGIC_VECTOR (3 downto 0);
        BCD_Value : out STD_LOGIC_VECTOR (3 downto 0);
        DigSelect : out STD_LOGIC
        );
        end component;
        
component BCD_To_SevenSeg Port ( 
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
signal ds,dx,dy,dRESET :std_logic;
signal dig0,dig1,mux_out:std_logic_vector (3 downto 0);
signal AA,AB,AC,AD,AE,AF,AG:std_logic;             
begin
mod1 : PBDebouncer port map (clk,s,ds);
mod2 : PBDebouncer port map (clk,x,dx);
mod3 : PBDebouncer port map (clk,y,dy);
mod4 : PBDebouncer port map (clk,rest,dRESET);
mod5 : ASM port map (clk,dRESET,ds,dx,dy,dig0,dig1); 
mod6: Time_MUX port map(clk,dig0,dig1,mux_out,c);
mod7: BCD_To_SevenSeg port map (mux_out,AA,AB,AC,AD,AE,AF,AG);
s7d(6)<= AA;
s7d(5)<= AB;
s7d(4)<= AC;
s7d(3)<= AD;
s7d(2)<= AE;
s7d(1)<= AF;
s7d(0)<= AG;
end Behavioral;