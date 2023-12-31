-- hds header_start
--
-- VHDL Architecture AES_Algorithm.Xor_4Byte.rtl
--
-- Created:
--          by - Administrator.UNKNOWN (PC2)
--          at - 02:55:11 24/11/2005
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY Xor_4Byte IS
   PORT( 
      IP1    : IN     std_logic_vector (0 TO 7);
      IP2    : IN     std_logic_vector (0 TO 7);
      IP3    : IN     std_logic_vector (0 TO 7);
      IP4    : IN     std_logic_vector (0 TO 7);
      XorOP : OUT    std_logic_vector (0 TO 7)
   );
-- Declarations

END Xor_4Byte ;

-- hds interface_end
ARCHITECTURE rtl OF Xor_4Byte IS
BEGIN
	XorOP<= IP1 xor IP2 xor IP3 xor IP4;
END rtl;
