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
		   inc_select    :OUT std_logic;
			s_out			  :OUT std_logic
			
		   );
END ControlUnit;

ARCHITECTURE behavior OF ControlUnit IS 
		signal cond_enable:  std_logic;	   
	   signal wmfc: std_logic;
	   shared variable stage: integer:= 0;
BEGIN
   
	   PROCESS(clock, reset)BEGIN
		
		IF(falling_edge(clock))THEN
			if((Cond(3)='0' and Cond(2)='0' and Cond(1)='0' and Cond(0)='0'))then
				cond_enable <= '1';
			elsif((Cond(3)='0' and Cond(2)='0' and Cond(1)='0' and Cond(0)='1'))then
				cond_enable <= '0';
			elsif((Cond(3)='0' and Cond(2)='0' and Cond(1)='1' and Cond(0)='0'))then
				if(z='1')then
					cond_enable <= '1';
				end if;
			elsif((Cond(3)='0' and Cond(2)='0' and Cond(1)='1' and Cond(0)='1'))then
				if(z='0')then
					cond_enable <= '1';
				end if;
			elsif((Cond(3)='0' and Cond(2)='1' and Cond(1)='0' and Cond(0)='0'))then
				if(v='1')then
					cond_enable <= '1';
				end if;	
			end if;
		end if;
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
			elsif(cond_enable <= '1')then
				IF(stage = 3)THEN
					IF((opCode(3) = '0' AND opCode(2) = '0'))THEN
							IF((opCode(1) = '0') AND (opCode(0) = '1'))THEN
								pc_select <= '0';
								pc_enable <= '1';
							ELSIF(( opCode(1) = '0' AND opCode (0) = '0'))THEN
								s_out <= s;
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
					elsif((opCode(3) = '0' AND opCode(2) = '1'))then		
						if((opCode(1) = '1') AND (opCode(0) = '0'))THEN
							s_out <= s;
							alu_op <= "11";
							b_inv <= '0';
							b_select <= '1';
						elsIF((opCode(1) = '0') AND (opCode(0) = '0'))THEN
							s_out <= s;
							alu_op <= "11";
							b_inv <= '0';
							b_select <= '1';
							extend <= "01";
						elsIF((opCode(1) = '0') AND (opCode(0) = '1'))THEN
							s_out <= s;
							alu_op <= "11";
							b_inv <= '0';
							b_select <= '1';
							extend <= "01";
						end if;
					elsif(( opCode(3)='1' and opCode(2)='0'))then
						if((opCode(1)='0' and opCode(0)='0'))then
							inc_select <= '1';
							pc_enable <= '1';
						elsif((opCode(1)='0' and opCode(0)='1'))then
							inc_select <= '1';
							pc_enable <= '1';
						end if;
					end if;
				elsif(stage = 4)then
					if((opCode(3)='0' and opCode(2)='1' and opCode(1)='1' and opCode(0)='0'))then
						s_out <='0';
						y_select <= "00";
					elsif((opCode(3)='0' and opCode(2)='0' and opCode(1)='0' and opCode(0)='0'))then
						s_out <= '0';
					elsif((opCode(3)='0' and opCode(2)='1' and opCode(1)='0' and opCode(0)='0'))then
						s_out <= '0';
						ma_select <= '0';
						y_select <= "01";
					elsif((opCode(3)='0' and opCode(2)='1' and opCode(1)='0' and opCode(0)='1'))then
						s_out <= '0';
						ma_select <= '0';
						mem_write <= '1';
					elsif((opCode(3)='1' and opCode(2)='0' and opCode(1)='0' and opCode(0)='0'))then
						pc_enable <= '0';
					elsif((opCode(3)='1' and opCode(2)='0' and opCode(1)='0' and opCode(0)='1'))then
						pc_enable <= '0';
						y_select <= "10";
					elsif((opCode(3)='0' and opCode(2)='0' and opCode(1)='0' and opCode(0)='1'))then
						s_out <= '0';
						pc_enable <= '0';
					end if;
				elsif(stage = 5)then				
					if((opCode(3)='1' and opCode(2)='0' and opCode(1)='1' and opCode(0)='0'))then
						c_select <= "01";
					elsif((opCode(3)='0' and opCode(2)='1' and opCode(1)='0' and opCode(0)='0'))then
						c_select <= "01";
						rf_write <= '1';
					elsif((opCode(3)='0' and opCode(2)='1' and opCode(1)='1' and opCode(0)='0'))then
						rf_write <='1';
						c_select <="01";
					elsif((opCode(3)='0' and opCode(2)='1' and opCode(1)='0' and opCode(0)='1'))then
						mem_write <= '0';
						c_select <= "01";
						rf_write <= '1';
					elsif((opCode(3)='1' and opCode(2)='0' and opCode(1)='0' and opCode(0)='1'))then
						c_select <= "10";
						rf_write <= '1';
					end if;
				end if;
			end if;
		end if;
	end process;
end behavior;