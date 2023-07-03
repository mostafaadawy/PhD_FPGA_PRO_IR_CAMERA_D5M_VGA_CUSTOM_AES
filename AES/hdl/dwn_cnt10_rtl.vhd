LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY Dwn_Cnt10 IS
  port(clk     : IN     std_logic;
      en      : IN     std_logic;
      start   : IN     std_logic;
      cnt_add : OUT    std_logic_vector (0 TO 3));
END Dwn_Cnt10 ;

-- hds interface_end
ARCHITECTURE rtl OF Dwn_Cnt10 IS
signal count : unsigned(0 to 3);
BEGIN
process(clk,start,en)
begin
if(start = '1') then
count <= "1010";
elsif(rising_edge(clk))then
if(en = '1') then
if (count <= 0) then
count <= "0000";
else
count <= count - 1;
end if;
end if;
end if;
end process;
cnt_add <= std_logic_vector(count);
END rtl;
