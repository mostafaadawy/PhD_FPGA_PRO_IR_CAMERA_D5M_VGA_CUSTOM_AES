LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY sbox_rom379 IS
   PORT( 
      rom_in  : IN     std_logic_vector (0 TO 7);
      clk     : IN     std_logic;
      rom_out : OUT    std_logic_vector (0 TO 7)
   );

-- Declarations

END sbox_rom379 ;

-- hds interface_end
ARCHITECTURE rtl OF sbox_rom379 IS
Type rom_type is array (0 to 255) of std_logic_vector(0 to 7);
constant rom : rom_type := (
"01100011",
"01111100",
"01100101",
"10011000",
"11101001",
"11000100",
"10011110",
"00001100",
"10101111",
"01000110",
"00111001",
"00111011",
"00010100",
"01100110",
"11010100",
"00001111",
"00000101",
"01000111",
"11110001",
"01010001",
"01001110",
"10101100",
"01001111",
"10011111",
"11011000",
"00000100",
"01101000",
"10001110",
"00110001",
"01011010",
"01010101",
"10010110",
"01010000",
"11001111",
"01110001",
"10111111",
"10100011",
"10000101",
"11110011",
"01110100",
"11110101",
"01101111",
"10000100",
"10110000",
"01110101",
"11000111",
"10010100",
"11000101",
"10111110",
"10100000",
"11010000",
"10000000",
"11100110",
"10000011",
"00011100",
"00001000",
"01001010",
"00110111",
"01110110",
"00111000",
"01111000",
"01110000",
"00010000",
"11011001",
"01110011",
"11111011",
"10111100",
"11100011",
"01101010",
"00011011",
"00001101",
"10011100",
"10001010",
"11111111",
"10011001",
"01011110",
"10100010",
"01011011",
"01100001",
"10101001",
"00101000",
"10001001",
"11101100",
"11011101",
"00011001",
"11001100",
"00000011",
"00101100",
"11100001",
"10110100",
"10111000",
"10010000",
"00010001",
"11110100",
"10111001",
"11001101",
"10001101",
"00011010",
"00001011",
"11111000",
"10111010",
"00100110",
"10010010",
"01011000",
"10100001",
"01101110",
"00010011",
"00100001",
"11011100",
"11000011",
"01011111",
"00110000",
"01111110",
"00000001",
"11000000",
"00011101",
"01100000",
"01110010",
"11001110",
"00001110",
"11101110",
"10110011",
"11101010",
"01100111",
"01010011",
"00100011",
"00111110",
"10000001",
"01101011",
"11000010",
"10100110",
"11110000",
"10001100",
"10100111",
"10101010",
"01010010",
"11100111",
"01111001",
"11010110",
"00100010",
"01010100",
"10010001",
"00010101",
"11111010",
"10010111",
"11011111",
"00101101",
"01001100",
"00011110",
"10110110",
"11111101",
"00101111",
"00001010",
"01001001",
"11110110",
"00000000",
"01100010",
"01000001",
"10001111",
"10010011",
"11000110",
"11001011",
"00010110",
"01000101",
"10100100",
"11100100",
"10110101",
"10110001",
"11010111",
"01111011",
"00111101",
"00101010",
"11011010",
"00111010",
"01001101",
"10101110",
"10101011",
"10101101",
"10001000",
"00000010",
"00000111",
"00101011",
"10011010",
"11111100",
"11010011",
"00101001",
"10101000",
"01101001",
"10000111",
"01011101",
"10111101",
"00111111",
"10011101",
"00011000",
"01010110",
"11100101",
"11011110",
"11101101",
"00100111",
"10110111",
"00000110",
"00110110",
"01001000",
"11000001",
"10011011",
"01011001",
"01110111",
"01001011",
"10001011",
"00100101",
"01101100",
"10111011",
"11010010",
"11101111",
"01000010",
"01111010",
"00110101",
"11001001",
"00110011",
"00010111",
"01111101",
"10000110",
"11001010",
"01101101",
"01100100",
"11110111",
"11011011",
"00011111",
"10110010",
"11111110",
"01011100",
"11100000",
"11100010",
"01000000",
"11101011",
"11010001",
"00111100",
"00110010",
"11010101",
"01111111",
"10100101",
"00100100",
"10000010",
"00110100",
"00101110",
"00001001",
"11101000",
"11001000",
"11110010",
"01010111",
"01000011",
"10010101",
"01000100",
"00100000",
"00010010",
"11111001"
);
BEGIN
process (clk)
variable addr_int: integer range 0 to 255;
begin
  if (rising_edge (clk))then
	addr_int := conv_integer(unsigned(rom_in));
	rom_out <= rom(addr_int);
  end if;
end process;
END rtl;