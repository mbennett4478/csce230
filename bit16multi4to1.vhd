library ieee;
use ieee.std_logic_1164.all;

entity bit16multi4to1 is
	port(
		in0, in1, in2, in3 : in std_logic_vector(15 downto 0); 
		s :in std_logic_vector(1 downto 0);
		f :out std_logic_vector(15 downto 0)
	);
end bit16multi4to1;

architecture behavior of bit16multi4to1 is
	component  multi4to1 
	port(
		in0, in1, in2, in3 :in std_logic;
		s :in std_logic_vector(1 downto 0);
		f :out std_logic
	);
	end component;


	
begin
	
	mult0: multi4to1 port map(in0(0),in1(0),in2(0),in3(0),s,f(0));
	mult1: multi4to1 port map(in0(1),in1(1),in2(1),in3(1),s,f(1));
	mult2: multi4to1 port map(in0(2),in1(2),in2(2),in3(2),s,f(2));
	mult3: multi4to1 port map(in0(3),in1(3),in2(3),in3(3),s,f(3));
	mult4: multi4to1 port map(in0(4),in1(4),in2(4),in3(4),s,f(4));
	mult5: multi4to1 port map(in0(5),in1(5),in2(5),in3(5),s,f(5));
	mult6: multi4to1 port map(in0(6),in1(6),in2(6),in3(6),s,f(6));
	mult7: multi4to1 port map(in0(7),in1(7),in2(7),in3(7),s,f(7));
	mult8: multi4to1 port map(in0(8),in1(8),in2(8),in3(8),s,f(8));
	mult9: multi4to1 port map(in0(9),in1(9),in2(9),in3(9),s,f(9));
	mult10: multi4to1 port map(in0(10),in1(10),in2(10),in3(10),s,f(10));
	mult11: multi4to1 port map(in0(11),in1(11),in2(11),in3(11),s,f(11));
	mult12: multi4to1 port map(in0(12),in1(12),in2(12),in3(12),s,f(12));
	mult13: multi4to1 port map(in0(13),in1(13),in2(13),in3(13),s,f(13));
	mult14: multi4to1 port map(in0(14),in1(14),in2(14),in3(14),s,f(14));
	mult15: multi4to1 port map(in0(15),in1(15),in2(15),in3(15),s,f(15));
	
end behavior;