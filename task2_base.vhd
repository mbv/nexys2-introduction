----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:18:36 10/31/2017 
-- Design Name: 
-- Module Name:    task1_base - Behavioral 
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

entity task2_base is
    Port ( i_SW : in  STD_LOGIC;
           i_RST : in  STD_LOGIC;
           o_LED : out  STD_LOGIC);
end task2_base;

architecture Behavioral of task2_base is
signal led_status: STD_LOGIC := '0';
signal sw_status: STD_LOGIC := '0';
begin
	process(i_RST, i_SW)
	begin
		if i_RST = '1' then
			led_status <= '0';  
		elsif sw_status /= i_SW then	
			led_status <= not led_status;
			sw_status <= i_SW;
		end if;					
	end process;
	
	o_LED <= led_status;
end Behavioral;

