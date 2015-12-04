library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bit16xor is
    Port ( a : in  std_logic_vector(15 downto 0);   
           b : in std_logic_vector(15 downto 0);   
           o : out std_logic_vector(15 downto 0)
		);	  
end bit16xor;

architecture Behavioral of bit16xor is
begin
    o(0)<= a(0) xor b(0);
	 o(1)<= a(1) xor b(1);
	 o(2)<= a(2) xor b(2);
	 o(3)<= a(3) xor b(3);
	 o(4)<= a(4) xor b(4);
	 o(5)<= a(5) xor b(5);
	 o(6)<= a(6) xor b(6);
	 o(7)<= a(7) xor b(7);
	 o(8)<= a(8) xor b(8);
	 o(9)<= a(9) xor b(9);
	 o(10)<= a(10) xor b(10);
	 o(11)<= a(11) xor b(11);
	 o(12)<= a(12) xor b(12);
	 o(13)<= a(13) xor b(13);
	 o(14)<= a(14) xor b(14);
	 o(15)<= a(15) xor b(15);
	 
end Behavioral;