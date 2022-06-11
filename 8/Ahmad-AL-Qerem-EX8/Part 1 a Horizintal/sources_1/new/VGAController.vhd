library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
use IEEE.numeric_std.all;
entity VGAController is
    Port ( 
        CLK : in STD_LOGIC;
        Reset : in STD_LOGIC;
        HS : out STD_LOGIC;
        VS : out STD_LOGIC;
        RED : out STD_LOGIC_VECTOR (3 downto 0);
        GREEN : out STD_LOGIC_VECTOR (3 downto 0);
        BLUE : out STD_LOGIC_VECTOR (3 downto 0)
        );
end VGAController;
architecture Behavioral of VGAController is
component Divider 
    Port ( 
        CLK_IN : in STD_LOGIC;
        CLK_OUT : out STD_LOGIC
    );
end component;
signal clk25 : std_logic;
constant D : integer := 639;
constant E : integer := 16; 
constant B : integer := 96;
constant C : integer := 48;
constant R : integer := 479;
constant S : integer := 10;
constant P : integer := 2;
constant Q : integer := 33;
signal H : integer := 0;
signal V : integer := 0;
signal DISPLAY : std_logic := '0';
begin
DIVIDED_CLK:Divider port map(CLK,clk25);

Calculate_Horizontal_position:process(clk25, Reset)
    begin
        if(Reset = '1')then
            H <= 0;
        elsif(rising_edge (clk25))then
            if (H = (D + E + B + C)) then--800
                H <= 0;
            else
                H <= H + 1;
            end if;
        end if;
    end process;

Calculate_Vertical_position:process(clk25, Reset, H)
begin
	if(Reset = '1')then
		V <= 0;
	elsif(rising_edge (clk25))then
		if(H = (D + E + B + C))then
			if (V = (R + S + P + Q)) then--525 
				V <= 0;
			else
				V <= V + 1;
			end if;
		end if;
	end if;
end process;

Horizontal_PULSE:process(clk25, Reset, H)
begin
	if(Reset = '1')then
		HS <= '0';
	elsif(rising_edge (clk25))then
		if((H <= (D + E)) OR (H > (D + E + B)))then
			HS <= '1';
		else
			HS <= '0';
		end if;
	end if;
end process;

Vertical_PULSE:process(clk25, Reset, V)
begin
	if(Reset = '1')then
		VS <= '0';
	elsif(rising_edge (clk25))then
		if((V <= (R + S)) OR (V > R + S + P))then
			VS <= '1';
		else
			VS <= '0';
		end if;
	end if;
end process;

video_on_PULSE:process(clk25, Reset, H, V)
begin
	if(Reset = '1')then
		DISPLAY <= '0';
	elsif(rising_edge (clk25))then
		if(H <= D and V <= R)then
			DISPLAY <= '1';
		else
			DISPLAY <= '0';
		end if;
	end if;
end process;
DISPLAY3HREC:process(clk25, Reset, H, V, DISPLAY)
begin
	if(Reset = '1')then
        RED <= "0000" ;
        GREEN <= "0000" ;
        BLUE <= "0000";
	elsif(rising_edge (clk25))then
		if(DISPLAY = '1')then
			if((H >= 0 and H <= 640) AND (V >= 0 and V < 160))then
                RED <= "1111" ;
                GREEN <= "0000" ;
                BLUE <= "0000";
			elsif ((H >= 0 and H <= 640) AND (V >= 160 and V < 320))then 
                RED <= "0000" ;
                GREEN <= "1111" ;
                BLUE <= "0000";
            elsif ((H >= 0 and H <= 640) AND (V >= 320 and V <= 480))then
                RED <= "0000" ;
                GREEN <= "0000" ;
                BLUE <= "1111";        
			end if;
		else
            RED <= "0000" ;
            GREEN <= "0000" ;
            BLUE <= "0000";
		end if;
	end if;
end process;
end Behavioral;