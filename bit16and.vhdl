library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bit16and is
    Port ( a : in  std_logic_vector(15 downto 0);   
           b : in std_logic_vector(15 downto 0);   
           o : out std_logic_vector(15 downto 0)
		);	  
end bit16and;

architecture Behavioral of bit16and is
begin
    o(0)<= a(0) and b(0);
	 o(1)<= a(1) and b(1);
	 o(2)<= a(2) and b(2);
	 o(3)<= a(3) and b(3);
	 o(4)<= a(4) and b(4);
	 o(5)<= a(5) and b(5);
	 o(6)<= a(6) and b(6);
	 o(7)<= a(7) and b(7);
	 o(8)<= a(8) and b(8);
	 o(9)<= a(9) and b(9);
	 o(10)<= a(10) and b(10);
	 o(11)<= a(11) and b(11);
	 o(12)<= a(12) and b(12);
	 o(13)<= a(13) and b(13);
	 o(14)<= a(14) and b(14);
	 o(15)<= a(15) and b(15);
	 
end Behavioral;