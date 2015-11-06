LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY BuffReg16 IS
	PORT(
		data									:IN std_logic_vector(15 downto 0);
		reset, Clock						:IN std_logic;
		output								:OUT std_logic_vector(15 downto 0)
	);
END BuffReg16;

ARCHITECTURE behavior OF BuffReg16 IS
BEGIN
	PROCESS(Clock, reset)
	BEGIN
		IF(reset = '1') THEN	
			output <= (OTHERS =>'0');
		ELSIF(rising_edge(Clock)) THEN
				output <= data;
		END IF;
	END PROCESS;
END behavior;