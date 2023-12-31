-- hds header_start
--
-- VHDL Architecture Reconfigurable_AES.cnt10.rtl
--
-- Created:
--          by - mostafa_ahmed.UNKNOWN (MOSTAFA)
--          at - 10:07:32 03/01/2010
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY cnt10 IS
   PORT( 
      clk     : IN     std_logic;
      en      : IN     std_logic;
      start   : IN     std_logic;
      cnt_add : OUT    std_logic_vector (0 TO 3)
   );

-- Declarations

END cnt10 ;

-- hds interface_end
ARCHITECTURE rtl OF cnt10 IS
signal count : unsigned(0 to 3);
BEGIN
process(clk,start,en)
begin
if(start = '1') then
count <= (others=>'0');
elsif(rising_edge(clk))then
if(en = '1') then
if (count >= 11) then
count <= (others=>'0');
else
count <= count + 1;
end if;
end if;
end if;
end process;
cnt_add <= std_logic_vector(count);
END rtl;
