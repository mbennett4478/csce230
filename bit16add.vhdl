LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY bit16add IS
	PORT(
	   cin :in std_logic;
		a, b :IN STD_LOGIC_VECTOR(15 downto 0);
		s :out std_logic_vector(15 downto 0);
		Carry15, Carry14 :OUT STD_LOGIC
	);
END bit16add;

architecture behavior of bit16add is
	component bitAdder
		port(
			a, b, cin :in std_logic;
			s, cout :out std_logic
		);
	end component;
	signal cout1, cout2, cout3, cout4, cout5, cout6, cout7, cout8, cout9, cout10, cout11, cout12, cout13, cout14, cout15,cout16 : std_logic;
begin
	add0: bitAdder port map(a(0), b(0), cin, s(0), cout1);
	add1: bitAdder port map(a(1), b(1), cout1, s(1), cout2);
	add2: bitAdder port map(a(2), b(2), cout2, s(2), cout3);
	add3: bitAdder port map(a(3), b(3), cout3, s(3), cout4);
	add4: bitAdder port map(a(4), b(4), cout4, s(4), cout5);
	add5: bitAdder port map(a(5), b(5), cout5, s(5), cout6);
	add6: bitAdder port map(a(6), b(6), cout6, s(6), cout7);
	add7: bitAdder port map(a(7), b(7), cout7, s(7), cout8);
	add8: bitAdder port map(a(8), b(8), cout8, s(8), cout9);
	add9: bitAdder port map(a(9), b(9), cout9, s(9), cout10);
	add10: bitAdder port map(a(10), b(10), cout10, s(10), cout11);
	add11: bitAdder port map(a(11), b(11), cout11, s(11), cout12);
	add12: bitAdder port map(a(12), b(12), cout12, s(12), cout13);
	add13: bitAdder port map(a(13), b(13), cout13, s(13), cout14);
	add14: bitAdder port map(a(14), b(14), cout14, s(14), cout15);
	add15: bitAdder port map(a(15), b(15), cout15, s(15), cout16);
	Carry14 <= cout15;
	Carry15 <= cout16;
end behavior;
