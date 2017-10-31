----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:29:58 10/31/2017 
-- Design Name: 
-- Module Name:    task2 - Behavioral 
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

entity task2 is
    Port ( sw : in  STD_LOGIC_VECTOR (7 downto 0);
           led : out  STD_LOGIC_VECTOR (7 downto 0);
           btn : in  STD_LOGIC_VECTOR (0 downto 0));
end task2;

architecture Behavioral of task2 is
	component task2_base is
		 Port ( i_SW : in  STD_LOGIC;
				  i_RST : in  STD_LOGIC;
				  o_LED : out  STD_LOGIC);
	end component; 
	
	signal RST: STD_LOGIC;
begin
	RST <= btn(0);

	SWITCH0: entity task2_base port map (
					i_SW => SW(0),
					i_RST => RST,
					o_LED => LED(0)
				);
				
	SWITCH1: entity task2_base port map (
					i_SW => SW(1),
					i_RST => RST,
					o_LED => LED(1)
				);

	SWITCH2: entity task2_base port map (
					i_SW => SW(2),
					i_RST => RST,
					o_LED => LED(2)
				);
				
	SWITCH3: entity task2_base port map (
					i_SW => SW(3),
					i_RST => RST,
					o_LED => LED(3)
				);

	SWITCH4: entity task2_base port map (
					i_SW => SW(4),
					i_RST => RST,
					o_LED => LED(4)
				);
				
	SWITCH5: entity task2_base port map (
					i_SW => SW(5),
					i_RST => RST,
					o_LED => LED(5)
				);
	SWITCH6: entity task2_base port map (
					i_SW => SW(6),
					i_RST => RST,
					o_LED => LED(6)
				);
				
	SWITCH7: entity task2_base port map (
					i_SW => SW(7),
					i_RST => RST,
					o_LED => LED(7)
				);						

end Behavioral;

