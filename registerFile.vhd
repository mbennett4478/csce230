LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY registerFile IS
	PORT(
		DataD							:IN std_logic_vector(15 downto 0);
		RegD, RegT, RegS			:IN std_logic_vector(3 downto 0);
		Enable, Clock, Reset		:IN std_logic;		
		DataS, DataT				:OUT std_logic_vector(15 downto 0)
	);
END registerFile;

ARCHITECTURE behavior OF registerFile IS

	component mux16 
	PORT(
		d0,d1,d2,d3,d4,d5,d6,d7		:IN std_logic_vector(15 downto 0);
		d8,d9,dA,dB,dC,dD,dE,dF		:IN std_logic_vector(15 downto 0);
		sel								:IN std_logic_vector(3 downto 0);
		f									:OUT std_logic_vector(15 downto 0)
	);
END component;
component decoder16 
	PORT(
		  Sel		:IN std_logic_vector(3 downto 0);
		  Output :OUT std_logic_vector(15 downto 0)
	);
	
END component;

component Reg16 
	PORT(
		data									:IN std_logic_vector(15 downto 0);
		enable, reset, Clock				:IN std_logic;
		output								:OUT std_logic_vector(15 downto 0)
	);
END component;

signal reg0,out1, q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15:std_logic_vector(15 downto 0);
signal e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, e11, e12, e13, e14, e15 :std_logic;

begin
decode: decoder16 port map(regD,out1);

reg0<= "0000000000000011";
e1<= enable and out1(1);
e2<= enable and out1(2);
e3<= enable and out1(3);
e4<= enable and out1(4);
e5<= enable and out1(5);
e6<= enable and out1(6);
e7<= enable and out1(7);
e8<= enable and out1(8);
e9<= enable and out1(9);
e10<= enable and out1(10);
e11<= enable and out1(11);
e12<= enable and out1(12);
e13<= enable and out1(13);
e14<= enable and out1(14);
e15<= enable and out1(15);


reg1: Reg16 port map(dataD,e1,reset,clock,q1);
reg2: Reg16 port map(dataD,e2,reset,clock,q2);
reg3: Reg16 port map(dataD,e3,reset,clock,q3);
reg4: Reg16 port map(dataD,e4,reset,clock,q4);
reg5: Reg16 port map(dataD,e5,reset,clock,q5);
reg6: Reg16 port map(dataD,e6,reset,clock,q6);
reg7: Reg16 port map(dataD,e7,reset,clock,q7);
reg8: Reg16 port map(dataD,e8,reset,clock,q8);
reg9: Reg16 port map(dataD,e9,reset,clock,q9);
reg10: Reg16 port map(dataD,e10,reset,clock,q10);
reg11: Reg16 port map(dataD,e11,reset,clock,q11);
reg12: Reg16 port map(dataD,e12,reset,clock,q12);
reg13: Reg16 port map(dataD,e13,reset,clock,q13);
reg14: Reg16 port map(dataD,e14,reset,clock,q14);
reg15: Reg16 port map(dataD,e15,reset,clock,q15);

mux1: mux16 port map(reg0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,regS,dataS);
mux2: mux16 port map(reg0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,regT,dataT);
END behavior;