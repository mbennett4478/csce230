LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ControlUnit IS
           PORT(
           opCode:IN std_logic_vector(3 downto 0);
           Cond  :IN std_logic_vector(3 downto 0);
           opx   :IN std_logic_vector(2 downto 0);
           s        :IN std_logic;
           n        :IN std_logic;
           c        :IN std_logic;
           v        :IN std_logic;
           z        :IN std_logic;
           mfc    :IN std_logic;
           clock    :IN std_logic;
           reset :IN std_logic;
           alu_op         :OUT std_logic_vector(1 downto 0);
           c_select     :OUT std_logic_vector(1 downto 0);
           y_select     :OUT std_logic_vector(1 downto 0);
           rf_write     :OUT std_logic;
           b_select     :OUT std_logic;
           a_inv         :OUT std_logic;
           b_inv         :OUT std_logic;
           extend         :OUT std_logic_vector(1 downto 0);
           ir_enable     :OUT std_logic;
           ma_select     :OUT std_logic;
           mem_read      :OUT std_logic;
           mem_write     :OUT std_logic;
           pc_select     :OUT std_logic;
           pc_enable     :OUT std_logic;
           inc_select     :OUT std_logic

       
           );
END ControlUnit;

ARCHITECTURE behavior OF ControlUnit IS 
               
       signal wmfc: std_logic;
       shared variable stage: integer:= 0;
BEGIN
   
       PROCESS(clock, reset)BEGIN
   
       IF(rising_edge(clock))THEN
           IF(reset = '1')THEN
				stage := 0;
           END IF;
           IF((mfc = '1' or wmfc = '0'))THEN
				stage := stage mod 5+1;
           end if;
           if(stage = 1)then            
				wmfc <= '1';
				alu_op <= "00";
				c_select <= "01";
				y_select <= "00";
				rf_write <= '0';
				b_select <= '0';
				a_inv <= '0';
				b_inv <='0';
				extend <= "00";
				ir_enable <= '1';
				ma_select <= '1';
				mem_read <= '1';
				mem_write <= '0';
				pc_select <= '1';
				pc_enable <= mfc;
				inc_select <= '0';
           elsif(stage = 2)then
               wmfc <= '0';
               ir_enable <= '0';
               mem_read <= '0';
               pc_enable <= '0';
			  ELSIF(stage = 3)THEN
				IF((opCode(3) = '0' AND opCode(2) = '0'))THEN
               IF((opCode(1) = '0') AND (opCode(0) = '1'))THEN
					ELSIF(( opCode(1) = '0' AND opCode (0) = '0'))THEN
							IF(opx = "111" ) THEN
								alu_op <= "00";
							ELSIF( opx = "110") THEN
								alu_op <= "01";
							ELSIF( opx = "101") then
								alu_op <= "10";
							ELSIF( opx = "100") then
								alu_op <= "11";
							ELSIF( opx = "011") then
								alu_op <= "11";
								b_inv <= '1';
							end if;
               end if;
				end if;
           ELSIF(stage = 3)THEN
           IF((opCode(3) = '0' AND opCode(2) = '0'))THEN
						IF((opCode(1) = '0') AND (opCode(0) = '1'))THEN
						ELSIF(( opCode(1) = '0' AND opCode (0) = '0'))THEN
							IF(opx = "111" ) THEN
							alu_op <= "00";
							ELSIF( opx = "110") THEN
							alu_op <= "00";
							ELSIF( opx = "101") then
							alu_op <= "00";
							ELSIF( opx = "100") then
							alu_op <= "00";
							ELSIF( opx = "011") then
							alu_op <= "00";
							b_inv <= '1';
							end if;
						end if;
					end if;
			  elsif(stage = 4)then
					
			  elsif(stage = 5)then
					rf_write <= '1';
					
				end if;
			end if;
	end process;
	
--end if;
--end PROCESS;
end behavior;