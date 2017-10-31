----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:53:33 10/31/2017 
-- Design Name: 
-- Module Name:    task4 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity task4 is
    Port ( clk : in  STD_LOGIC;
			  seg : out  STD_LOGIC_VECTOR (6 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           dp : out  STD_LOGIC;
           btn : in  STD_LOGIC_VECTOR (0 downto 0);
           Led : out  STD_LOGIC_VECTOR (0 downto 0));
end task4;

architecture Behavioral of task4 is
	component Quad7SegDriver is
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
	end component; 
	
	component clk_divider is
    Port ( clk : in  STD_LOGIC;
				reset : in  STD_LOGIC;
           o_clk : out  STD_LOGIC);
	end component;
	
	signal counter: STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
	signal i_toDisp: STD_LOGIC_VECTOR(15 downto 0);
	signal dp_toDisp: STD_LOGIC_VECTOR(3 downto 0) := "1111";
	signal rst: STD_LOGIC;
	signal clk_1s: STD_LOGIC;
	signal led_status: STD_LOGIC := '0';
begin
	rst <= btn(0);
	i_toDisp <= counter;
	led(0) <= led_status;
	
	driver: entity Quad7SegDriver port map (
					clk => clk,
					reset => rst,
					i_toDisp => i_toDisp,
					dp_toDisp => dp_toDisp,
					o_A2G => seg,
					o_AN => an,
					o_DP => dp
				);	
				
	clock_devider: entity clk_divider port map (
					clk => clk,
					reset => rst,
					o_clk => clk_1s
				); 
				
	main: process(rst, clk_1s)
	begin
		if rst = '1' then
			counter <= "0000000000000000";
			led_status <= '0';
		elsif rising_edge(clk_1s) then
			led_status <= not led_status;
			counter <= counter + '1';
		end if;
	end process;

end Behavioral;

