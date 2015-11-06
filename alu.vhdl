library ieee;
use ieee.std_logic_1164.all;

entity alu is
	port(
		a, b :in std_logic_vector(15 downto 0);
		alu_op :in std_logic_vector(1 downto 0);
		a_inv, b_inv :in std_logic;
		alu_out :out std_logic_vector(15 downto 0);
		n,z,v,c :out std_logic
	);
end alu;

architecture behavior of alu is
	component bit16add
		port(
			cin :in std_logic;
			a, b :IN STD_LOGIC_VECTOR(15 downto 0);
			s :out std_logic_vector(15 downto 0);
			Carry14,Carry15 :OUT STD_LOGIC
		);
	end component;
	component bit16multi2to1
		port(
			a, b :in std_LOGIC_VECTOR(15 downto 0); 
			s :in std_logic;
			f :out std_LOGIC_VECTOR(15 downto 0)
		);
	end component;
	component bit16multi4to1
		port(
			in0, in1, in2, in3 :in std_LOGIC_VECTOR(15 downto 0);
			s :in std_logic_vector(1 downto 0);
			f :out std_LOGIC_VECTOR(15 downto 0)
		);
	end component;
	component  bit16and
		  Port ( a : in  std_logic_vector(15 downto 0);   
           b : in std_logic_vector(15 downto 0);   
           o : out std_logic_vector(15 downto 0)
		);	  
	end component;
	component bit16or 
		Port ( a : in  std_logic_vector(15 downto 0);   
           b : in std_logic_vector(15 downto 0);   
           o : out std_logic_vector(15 downto 0)
		);	  
	end component;
	component bit16xor
		Port ( a : in  std_logic_vector(15 downto 0);   
           b : in std_logic_vector(15 downto 0);   
           o : out std_logic_vector(15 downto 0)
		);	  
	end component;
	component variousLogic
		Port (   
           s :IN STD_LOGIC_VECTOR(15 downto 0);
			  in15carryout : in  STD_LOGIC;
			  in14carryout : in  STD_LOGIC; 
           outN   : out STD_LOGIC;    
			  outZ   : out STD_LOGIC;    
			  outV   : out STD_LOGIC;    
			  outC   : out STD_LOGIC
	);		  
end component;
	
	signal inv, c1, c2 : std_lOGIC;
	signal aResult, bResult,add, andResult, orResult, xorResult : std_LOGIC_VECTOR(15 downto 0);
	
begin	
	inv <= a_inv or b_inv;
	multa: bit16multi2to1 Port map(a,not a, a_inv,aResult);
	multb: bit16multi2to1 Port map(b,not b, b_inv,bResult);
	FA: bit16add Port map(inv,aResult,bResult,add,c1,c2);
	flags: variousLogic port map(add,c2,c1,n,z,v,c);
	and1: bit16and port map(aResult, bResult, andResult);
	or1: bit16or port map(aResult, bResult, orResult);
	xor1: bit16xor port map(aResult, bResult, xorResult);
	multfin: bit16multi4to1 port map(andResult,orResult,xorResult,add,alu_op,alu_out);	
	
end behavior;
