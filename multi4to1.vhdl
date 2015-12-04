library ieee;
use ieee.std_logic_1164.all;

entity multi4to1 is
	port(
		in0, in1, in2, in3 :in std_logic;
		s :in std_logic_vector(1 downto 0);
		f :out std_logic
	);
end multi4to1;

architecture behavior of multi4to1 is
begin
	with s select f <= 
		in0 when "00",
		in1 when "01",
		in2 when "10",
		in3 when "11";
end behavior;
