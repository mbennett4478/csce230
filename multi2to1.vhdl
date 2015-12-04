library ieee;
use ieee.std_logic_1164.all;

entity multi2to1 is
	port(
		a, b, s :in std_logic;
		f :out std_logic
	);
end multi2to1;

architecture behavior of multi2to1 is
	signal and1, and2 : std_logic;
begin
	
	with s select f <= 
		a when '0',
		b when '1';
		
end behavior;