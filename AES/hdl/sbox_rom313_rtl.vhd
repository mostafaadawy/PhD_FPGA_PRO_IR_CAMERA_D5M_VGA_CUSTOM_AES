LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY sbox_rom313 IS
   PORT( 
      rom_in  : IN     std_logic_vector (0 TO 7);
      clk     : IN     std_logic;
      rom_out : OUT    std_logic_vector (0 TO 7)
   );

-- Declarations

END sbox_rom313 ;

-- hds interface_end
ARCHITECTURE rtl OF sbox_rom313 IS
Type rom_type is array (0 to 255) of std_logic_vector(0 to 7);
constant rom : rom_type := (
"01100011",
"01111100",
"10011001",
"00110000",
"00011110",
"10101101",
"11001010",
"10110101",
"11011101",
"01110111",
"00000100",
"01111000",
"10110111",
"11001101",
"00001000",
"01111111",
"01001001",
"00110001",
"00011100",
"10011111",
"11010000",
"01000000",
"11101110",
"01011111",
"00001001",
"10111100",
"01000001",
"01101111",
"10100011",
"01101010",
"00011000",
"00010010",
"00000011",
"10110011",
"01001010",
"11100101",
"11011100",
"10110000",
"01101000",
"10011011",
"10111010",
"00011011",
"10000111",
"10001111",
"10100101",
"01100111",
"01111101",
"11100000",
"00100011",
"10011110",
"10001100",
"00001011",
"00000111",
"00110111",
"00010000",
"11000101",
"01110110",
"10001000",
"11100111",
"11010010",
"10101011",
"11110011",
"10101110",
"11011011",
"00100110",
"11110100",
"01111110",
"00110010",
"10000010",
"01110011",
"00100000",
"00010011",
"11001001",
"01000111",
"11111111",
"00111010",
"11100110",
"00001100",
"00011111",
"10110010",
"11111010",
"10111110",
"00101010",
"10010001",
"01100100",
"00011101",
"01100000",
"11011001",
"00000000",
"00000001",
"00010100",
"01001111",
"00011001",
"00110100",
"11010111",
"11110110",
"01000011",
"11010110",
"11101000",
"10001010",
"11100001",
"10111000",
"00100010",
"01001101",
"01010001",
"01101101",
"00111100",
"01101110",
"10101111",
"11111100",
"01000101",
"10001011",
"10011100",
"01000100",
"10010110",
"01101001",
"00100001",
"10101010",
"10111011",
"00111001",
"01110010",
"10111111",
"01011110",
"01001011",
"10000101",
"01100001",
"00111111",
"11111001",
"10110100",
"11101010",
"10101000",
"11111000",
"10011000",
"01011001",
"11001011",
"11000100",
"10010011",
"01010000",
"01101011",
"10001110",
"11000010",
"10000100",
"00101110",
"10010010",
"00110110",
"01111011",
"01110001",
"10000001",
"00101101",
"10011010",
"11001111",
"11110001",
"10100001",
"01010101",
"11010100",
"10110001",
"01011101",
"00101111",
"11111110",
"00100100",
"11011010",
"00110011",
"10001101",
"01010110",
"11000111",
"10011101",
"00011010",
"00111101",
"10010101",
"01111001",
"01011100",
"01011000",
"11100010",
"01011010",
"00111110",
"11010101",
"10100111",
"00111011",
"00100111",
"10100010",
"11011000",
"01101100",
"01110101",
"00010110",
"00101011",
"11010001",
"10111101",
"11000000",
"01001100",
"11000001",
"10101001",
"10000011",
"00000110",
"11001110",
"11001100",
"01001000",
"11010011",
"00001010",
"10010111",
"10001001",
"01010111",
"00010101",
"11111011",
"00001110",
"11000011",
"11100011",
"01110100",
"00110101",
"00001111",
"00101100",
"00010001",
"11101101",
"10111001",
"10100110",
"10010000",
"01000110",
"00000101",
"01010010",
"10101100",
"10000000",
"01110000",
"01010100",
"00010111",
"11000110",
"11101001",
"11101111",
"11110000",
"11001000",
"11101100",
"11110101",
"01100110",
"11110111",
"01000010",
"10000110",
"11110010",
"11100100",
"01111010",
"11011110",
"01001110",
"10100000",
"11101011",
"10100100",
"00001101",
"00101000",
"11111101",
"10010100",
"00000010",
"00101001",
"01100101",
"01010011",
"01100010",
"00100101",
"00111000",
"11011111",
"01011011",
"10110110"
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
