library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Quad7SegDriver is
	port
	(	
		clk		: in STD_LOGIC;									--50MHz clock
		reset		: in STD_LOGIC;									--asynchronous reset
		i_toDisp	: in STD_LOGIC_VECTOR(15 downto 0);			--16 bit value to display
	   dp_toDisp: in STD_LOGIC_VECTOR(3 downto 0);		-- dot
		o_A2G		: out STD_LOGIC_VECTOR(6 downto 0);			--LED segments
		o_AN		: out STD_LOGIC_VECTOR(3 downto 0);			--Enable lines
	   o_DP     : out STD_LOGIC
	);


end Quad7SegDriver;

architecture Behavioral of Quad7SegDriver is

	signal s_counter : STD_LOGIC_VECTOR(17 downto 0);
	signal s_muxSel : STD_LOGIC_VECTOR(1 downto 0);
	signal s_A2G : STD_LOGIC_VECTOR(6 downto 0);
	signal s_AN : STD_LOGIC_VECTOR(3 downto 0);
	signal s_DP : STD_LOGIC;

	type lut is array (15 downto 0) of STD_LOGIC_VECTOR(6 downto 0);		--define matrix type
	constant lut_bin2Seg : lut := (													--instance of matrix
		0 	=> "1000000", 	--Display "0" on segment
		1 	=> "1111001", 	--Display "1" on segment
		2 	=> "0100100", 	--Display "2" on segment
		3 	=> "0110000", 	--Display "3" on segment
		4 	=> "0011001", 	--Display "4" on segment
		5 	=> "0010010", 	--Display "5" on segment
		6 	=> "0000010", 	--Display "6" on segment
		7 	=> "1111000", 	--Display "7" on segment
		8 	=> "0000000", 	--Display "8" on segment
		9 	=> "0010000", 	--Display "9" on segment
		10 => "0001000", 	--Display "A" on segment
		11 => "0000011", 	--Display "B" on segment
		12	=> "1000110", 	--Display "C" on segment
		13	=> "0100001", 	--Display "D" on segment
		14 => "0000110", 	--Display "E" on segment
		15	=> "0001110" 		--Display "F" on segment
	);

begin

	counter : process(clk, reset)
	begin
		if reset = '1' then
			s_counter <= "000000000000000000";

		elsif clk'event and clk = '1' then
			s_counter <= s_counter + 1;
			s_muxSel <= s_counter(17 downto 16);		--2 bits to mux the digits

		end if;
	end process;

	--Multiplexor process that determines which digit should be ON
	mux_an : process(s_muxSel)
	begin

		if s_muxSel = "00" then					--0x0 then
			s_AN <= "1110";						--display the first digit on the right			
		elsif s_muxSel = "01" then				--if mux is 0x1 then
			s_AN <= "1101";						--display the digit second from right
		elsif s_muxSel = "10" then				--if mux is 0x2 then
			s_AN <= "1011";						--display the digit second from left
		else											--otherwise
			s_AN <= "0111";						--display the left most digit
		end if;

	end process;

	a2g_seg : process(s_muxSel)
	begin

		if s_muxSel = "00" then														
			s_A2G <= lut_bin2Seg(conv_integer(i_toDisp(3 downto 0)));	
		elsif s_muxSel = "01" then													
			s_A2G <= lut_bin2Seg(conv_integer(i_toDisp(7 downto 4)));	
		elsif s_muxSel = "10" then													
			s_A2G <= lut_bin2Seg(conv_integer(i_toDisp(11 downto 8)));	
		else																				
			s_A2G <= lut_bin2Seg(conv_integer(i_toDisp(15 downto 12)));	
		end if;
		s_DP <= dp_toDisp(conv_integer(s_muxSel));
	end process;

	o_A2G <= s_A2G;
	o_AN <= s_AN;
	o_DP <= s_DP;

end Behavioral;



