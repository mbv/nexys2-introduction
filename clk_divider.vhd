----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:58:37 10/31/2017 
-- Design Name: 
-- Module Name:    clk_divider - Behavioral 
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

entity clk_divider is
    Port ( clk : in  STD_LOGIC;
				reset : in  STD_LOGIC;
           o_clk : out  STD_LOGIC);
end clk_divider;

architecture Behavioral of clk_divider is
	signal pulse : std_logic := '0';
	signal count : integer range 0 to 49999999 := 0;
begin
	counter : process(reset, CLK)
	begin
		if reset = '1' then
			count <= 0;
		elsif rising_edge(CLK) then
			if count = 49999999 then
				count <= 0;
				pulse <= not pulse;
			else
				count <= count + 1;
			end if;
		end if;
	end process;
	
	o_clk <= pulse;
end Behavioral;

