library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity bit16or is
    Port ( a : in  std_logic_vector(15 downto 0);   
           b : in std_logic_vector(15 downto 0);   
           o : out std_logic_vector(15 downto 0)
		);	  
end bit16or;

architecture Behavioral of bit16or is
begin
    o(0)<= a(0) or b(0);
	 o(1)<= a(1) or b(1);
	 o(2)<= a(2) or b(2);
	 o(3)<= a(3) or b(3);
	 o(4)<= a(4) or b(4);
	 o(5)<= a(5) or b(5);
	 o(6)<= a(6) or b(6);
	 o(7)<= a(7) or b(7);
	 o(8)<= a(8) or b(8);
	 o(9)<= a(9) or b(9);
	 o(10)<= a(10) or b(10);
	 o(11)<= a(11) or b(11);
	 o(12)<= a(12) or b(12);
	 o(13)<= a(13) or b(13);
	 o(14)<= a(14) or b(14);
	 o(15)<= a(15) or b(15);
	 
end Behavioral;