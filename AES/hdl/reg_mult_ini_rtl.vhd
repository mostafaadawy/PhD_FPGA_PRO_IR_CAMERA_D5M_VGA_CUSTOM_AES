LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY Reg_Mult_ini IS
   PORT( 
      out_reg : OUT    std_logic_vector (0 TO 31)
   );
END Reg_Mult_ini ;

ARCHITECTURE rtl OF Reg_Mult_ini IS
begin
Out_REG <= "00000001000000000000000000000000"; --unity matrix wher it is shifted every word 1000 
END rtl;																				 -- 0100
																						 -- 0010
																						 -- 0001
