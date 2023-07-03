--
-- VHDL Architecture my_project1_lib.coll_shif_reg.rtl
--
-- Created:
--          by - Mostafa.UNKNOWN (MOSTAFA_PC)
--          at - 07:34:00 02/26/2017
--
-- using Mentor Graphics HDL Designer(TM) 2007.1 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY coll_shif_reg IS
   PORT( 
      a     : IN     std_logic_vector (15 DOWNTO 0);
      b     : IN     std_logic_vector (15 DOWNTO 0);
      clk   : IN     std_logic;
      frame : OUT    std_logic_vector (127 DOWNTO 0)
   );

-- Declarations

END coll_shif_reg ;

--
ARCHITECTURE rtl OF coll_shif_reg IS
signal tmp : std_logic_vector(127 downto 0);
BEGIN
  process(clk,a,b)
    begin
      if(rising_edge(clk)) then
        tmp <= a & b & tmp(127 downto 32);
      end if;
    end process;
    frame <= tmp;
END ARCHITECTURE rtl;

