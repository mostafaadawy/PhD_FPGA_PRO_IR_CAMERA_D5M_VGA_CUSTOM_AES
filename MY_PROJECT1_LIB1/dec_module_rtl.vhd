LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY dec_module IS
port(
  clk : in std_logic;
  a : in std_logic_vector(15 downto 0);
  b : in std_logic_vector(15 downto 0);
  ion : in std_logic;
  idec : in std_logic;
  ioff: in std_logic;
  c_a : out std_logic_vector(15 downto 0);
  c_b : out std_logic_vector(15 downto 0)
);
END dec_module ;

-- hds interface_end
ARCHITECTURE rtl OF dec_module IS
BEGIN
process (a,b,clk,idec,ion,ioff)
begin
if(rising_edge(clk))   then
  if (ion = '1') then
    if (idec ='1') then
    c_a <= a xor "1111111111111111";
    c_b <= b xor "1111111111111111";
    else
    c_a <= a;
    c_b <= b;  
    end if;
  elsif (ioff = '1')then
      c_a <=  "0000000000000000";
      c_b <=  "0000000000000000";
  end if;
end if;
end process;
END rtl;