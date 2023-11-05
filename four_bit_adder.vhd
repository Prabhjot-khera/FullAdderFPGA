-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY four_bit_adder IS
  PORT( a : IN std_logic_vector (3 DOWNTO 0);
	  	b : IN std_logic_vector(3 DOWNTO 0);
  		s : OUT std_logic_vector (3 DOWNTO 0);
        c_out : OUT std_logic
  );
  END four_bit_adder;
  
ARCHITECTURE Behavioral OF four_bit_adder IS
	
    COMPONENT full_adder
    	PORT( 
        	a_in : IN std_logic;
	  		b_in : IN std_logic;
  			c_in : IN std_logic;
        	s_out : OUT std_logic;
        	c_out : OUT std_logic
  );
  END COMPONENT;
    
    SIGNAL carryOut1 : std_logic;
	SIGNAL carryOut2 : std_logic;
    SIGNAL carryOut3 : std_logic;
    
    BEGIN
    	fa1 : full_adder
        PORT MAP (
    		a_in => a(0),
            b_in => b(0),
            c_in => '0',
			s_out => s(0),
            c_out => carryOut1
        );
    	fa2 : full_adder
        PORT MAP (
    		a_in => a(1),
            b_in => b(1),
            c_in => carryOut1,
			s_out => s(1),
            c_out => carryOut2
        );
    	fa3 : full_adder
        PORT MAP (
    		a_in => a(2),
            b_in => b(2),
            c_in => carryOut2,
			s_out => s(2),
            c_out => carryOut3
        );
    	fa4 : full_adder
        PORT MAP (
    		a_in => a(3),
            b_in => b(3),
            c_in => carryOut3,
			s_out => s(3),
            c_out => c_out
        );
        
END Behavioral;