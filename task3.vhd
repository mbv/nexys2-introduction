----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:33:23 10/31/2017 
-- Design Name: 
-- Module Name:    task3 - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity task3 is
    Port ( clk		: in STD_LOGIC;
			  btn : in  STD_LOGIC_VECTOR (0 downto 0);
			  seg : out  STD_LOGIC_VECTOR (6 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           dp : out  STD_LOGIC);
end task3;

architecture Behavioral of task3 is
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
	
	signal i_toDisp: STD_LOGIC_VECTOR(15 downto 0) := "0011000100010000";
	signal dp_toDisp: STD_LOGIC_VECTOR(3 downto 0) := "1011";
begin
	driver: entity Quad7SegDriver port map (
					clk => clk,
					reset => btn(0),
					i_toDisp => i_toDisp,
					dp_toDisp => dp_toDisp,
					o_A2G => seg,
					o_AN => an,
					o_DP => dp
				);				

end Behavioral;

