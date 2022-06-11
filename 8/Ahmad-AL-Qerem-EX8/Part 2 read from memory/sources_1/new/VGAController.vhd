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
COMPONENT image_memory
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
  );
END COMPONENT;
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
signal RGB:std_logic_vector (11 downto 0);
signal addr:std_logic_vector (18 downto 0):=(others=>'0');

begin
DIVIDED_CLK:Divider port map(CLK,clk25);
MEMORY: image_memory
  PORT MAP (
    clka => clk25,
    addra => addr,
    douta => RGB
  );
Horizontal_position_counter:process(clk25, Reset)
    begin
        if(Reset = '1')then
            H <= 0;
        elsif(rising_edge (clk25))then
            if (H = (D + E + B + C)) then--799 BECOUSE I START COUNT FROM ZERO
                H <= 0;
            else
                H <= H + 1;
            end if;
        end if;
    end process;

Vertical_position_counter:process(clk25, Reset, H)
begin
	if(Reset = '1')then
		V <= 0;
	elsif(rising_edge (clk25))then
		if(H = (D + E + B + C))then
			if (V = (R + S + P + Q)) then--524 BECOUSE I START COUNT FROM ZERO
				V <= 0;
			else
				V <= V + 1;
			end if;
		end if;
	end if;
end process;

Horizontal_Synchronisation_PULSE:process(clk25, Reset, H)
begin
	if(Reset = '1')then
		HS <= '0';
	elsif(rising_edge (clk25))then
		if((H <= (D + E)) OR (H > D + E + B))then
			HS <= '1';
		else
			HS <= '0';
		end if;
	end if;
end process;

Vertical_Synchronisation_PULSE:process(clk25, Reset, V)
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
DISPLAY_on_PULSE:process(clk25, Reset, H, V)
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
DISPLAYimage:process(clk25, Reset, DISPLAY)
begin
	if(Reset = '1')then
        RED <= "0000" ;
        GREEN <= "0000" ;
        BLUE <= "0000";
        addr <= (others=> '0');
	elsif(rising_edge (clk25))then
        if (addr>= x"4b000")then
	       addr <= (others=> '0'); 
	    end if;	   
		if(DISPLAY = '1')then
            addr <= addr+1;   
            RED <= RGB(3 downto 0 ) ;
            GREEN <= RGB(7 downto 4 ) ;
            BLUE <= RGB(11 downto 8 ); 
		else 
            RED <= "0000" ;
            GREEN <= "0000" ;
            BLUE <= "0000";
		end if;
	end if;
end process;
end Behavioral;