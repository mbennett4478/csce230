library ieee;
use ieee.std_logic_1164.all;

entity bit16multi2to1 is
	port(
		a, b : in std_logic_vector(15 downto 0); 
		s :in std_logic;
		f :out std_logic_vector(15 downto 0)
	);
end bit16multi2to1;

architecture behavior of bit16multi2to1 is
	component multi2to1 
	port(
		a, b, s :in std_logic;
		f :out std_logic
	);
	end component;


	
begin
	
	mult0: multi2to1 port map(a(0),b(0),s,f(0));
	mult1: multi2to1 port map(a(1),b(1),s,f(1));
	mult2: multi2to1 port map(a(2),b(2),s,f(2));
	mult3: multi2to1 port map(a(3),b(3),s,f(3));
	mult4: multi2to1 port map(a(4),b(4),s,f(4));
	mult5: multi2to1 port map(a(5),b(5),s,f(5));
	mult6: multi2to1 port map(a(6),b(6),s,f(6));
	mult7: multi2to1 port map(a(7),b(7),s,f(7));
	mult8: multi2to1 port map(a(8),b(8),s,f(8));
	mult9: multi2to1 port map(a(9),b(9),s,f(9));
	mult10: multi2to1 port map(a(10),b(10),s,f(10));
	mult11: multi2to1 port map(a(11),b(11),s,f(11));
	mult12: multi2to1 port map(a(12),b(12),s,f(12));
	mult13: multi2to1 port map(a(13),b(13),s,f(13));
	mult14: multi2to1 port map(a(14),b(14),s,f(14));
	mult15: multi2to1 port map(a(15),b(15),s,f(15));
	
end behavior;