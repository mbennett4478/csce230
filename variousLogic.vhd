library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity variousLogic is
    Port (    
           s :IN STD_LOGIC_VECTOR(15 downto 0);
			  in15carryout : in  STD_LOGIC;
			  in14carryout : in  STD_LOGIC; 
           outN   : out STD_LOGIC;    
			  outZ   : out STD_LOGIC;    
			  outV   : out STD_LOGIC;    
			  outC   : out STD_LOGIC
	);		  
end variousLogic;

architecture Behavioral of variousLogic is
signal x :std_logic;


begin
	x <= s(0) or s(1) or s(2) or s(3) or s(4) or s(5) or s(6) or s(7) or s(8) or s(9) or s(10) or s(11) or s(12) or s(13) or s(14) or s(15);
	
	
	
	with s(15) select outN <= 
		'0' when '0',
		'1' when '1';
	
	
	outC <= in15carryout;
   outZ <= x xor '1';
	outV <= in14carryout xor in15carryout;
end Behavioral;