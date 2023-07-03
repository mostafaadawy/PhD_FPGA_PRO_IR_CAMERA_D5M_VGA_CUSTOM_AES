LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY mix_rom IS
   PORT( 
      clk     : IN     std_logic;
      rom_in  : IN     std_logic_vector (0 TO 3);
      rom_out : OUT    std_logic_vector (0 TO 31)
   );
END mix_rom ;
ARCHITECTURE rtl OF mix_rom IS
Type rom_type is array (0 to 15) of std_logic_vector(0 to 31);
constant rom : rom_type :=(
"00000010000000110000000100000001",
"00000011000000100000000100000001",
"00001001000010000000100100001001",
"00001010000011100000100100001100",
"00000011000010110000000100001000",
"00001110000001010000110100000111",
"00001011000001000000100000000110",
"00000001000001100000001100000101",
"00001100000001110000111000000100",
"00001000000000010000101100000011",
"00000101000000010000011100000010",
"00001011000001100000100000000100",
"00000001000001010000001100000110",
"00001100000001000000111000000111",
"00001000000000110000101100000001",
"00000101000000100000011100000001"
);

BEGIN
process (clk)
variable addr_int: integer range 0 to 15;
begin
  if (rising_edge (clk))then
	addr_int := conv_integer(unsigned(rom_in));
	rom_out <= rom(addr_int);
  end if;
end process;
END rtl;
