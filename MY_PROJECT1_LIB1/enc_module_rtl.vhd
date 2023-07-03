LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY enc_module IS
port(
  clk : in std_logic;
  a : in std_logic_vector(15 downto 0);
  b : in std_logic_vector(15 downto 0);
  ion : in std_logic;
  ienc : in std_logic;
  ioff: in std_logic;
  c_a : out std_logic_vector(15 downto 0);
  c_b : out std_logic_vector(15 downto 0)
);
END enc_module ;

-- hds interface_end
ARCHITECTURE rtl OF enc_module IS
BEGIN
process (a,b,clk,ienc,ion,ioff)
begin
if(rising_edge(clk))   then
  if (ion = '1') then
    if (ienc ='1') then
    c_a <= a xor "0010101010101010";
    c_b <= b xor "0010101010101010";
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