LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY reg_128bit IS
   PORT( 
      Clk   : IN     std_logic;
      D_in  : IN     std_logic_vector (0 TO 127);
      En    : IN     std_logic;
      Rst   : IN     std_logic;
      D_out : OUT    std_logic_vector (0 TO 127)
   );

-- Declarations

END reg_128bit ;

-- hds interface_end
ARCHITECTURE rtl OF reg_128bit IS
BEGIN
process(rst,clk,en,D_in)
begin
if(rst = '0') then
D_out <= (others=>'0');
elsif(rising_edge(clk)) then
if (en = '1') then
d_out <= d_in;
end if ;
end if;
end process;
END rtl;
