LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY bitAdder IS
	PORT(
		a, b, cin :IN STD_LOGIC;
		s,cout :OUT STD_LOGIC
	);
END bitAdder;

ARCHITECTURE behavior OF bitAdder IS
	SIGNAL xor1, and1, and2 : STD_LOGIC;	
BEGIN
	xor1 <= a XOR b;
	and1 <= xor1 AND cin;
	and2 <= a AND b;
	s <= xor1 XOR cin;
	cout <= and1 OR and2;
END behavior;
	