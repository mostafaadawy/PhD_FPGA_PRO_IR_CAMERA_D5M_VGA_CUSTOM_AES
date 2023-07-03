-- hds header_start
--
-- VHDL Architecture AES_Algorithm.Inv_SBox.rtl
--
-- Created:
--          by - Administrator.UNKNOWN (PC2)
--          at - 01:29:44 24/11/2005
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY Inv_SBox415 IS
   PORT( 
      clk       : IN     std_logic;
      invsboxip : IN     std_logic_vector (0 TO 7);
      invsboxop : OUT    std_logic_vector (0 TO 7)
   );

-- Declarations

END Inv_SBox415 ;

-- hds interface_end
ARCHITECTURE rtl OF Inv_SBox415 IS
Type rom_type is array (0 to 255) of std_logic_vector(0 to 7);
constant rom : rom_type := (
"11110011",
"11111101",
"11011100",
"01100100",
"11000001",
"10111110",
"01010011",
"10101001",
"00110001",
"00010110",
"10100100",
"01100111",
"10000101",
"01110101",
"00011010",
"11110111",
"10000011",
"11000111",
"11001011",
"11011000",
"10111111",
"00010011",
"00111000",
"10010010",
"00000101",
"00011000",
"10001001",
"01000010",
"11101001",
"10001111",
"10001100",
"10101000",
"11111111",
"01000101",
"01111111",
"01010110",
"11101000",
"11110000",
"11010010",
"00101011",
"11100111",
"00001000",
"00000011",
"01000011",
"11100101",
"01101001",
"10010111",
"11011010",
"01100101",
"11001000",
"11110100",
"01100011",
"00101100",
"11001110",
"11010100",
"11101110",
"00010001",
"00101111",
"11010011",
"11011011",
"00110000",
"10000100",
"11100000",
"01101101",
"10100011",
"10001110",
"10001010",
"10101100",
"01100110",
"01111100",
"00010000",
"10000110",
"01000000",
"10010000",
"00001111",
"11000110",
"01001010",
"01011100",
"01011110",
"00101001",
"11100011",
"11001101",
"00100011",
"00001100",
"11101010",
"01110001",
"11011101",
"01110010",
"00100110",
"10111011",
"01101000",
"10001000",
"10000001",
"11001111",
"10010001",
"11001001",
"11010001",
"01110110",
"11101100",
"00000000",
"10100000",
"01101110",
"00110110",
"00110010",
"01001110",
"00011011",
"10111001",
"00011001",
"00010010",
"11100110",
"01010111",
"10011011",
"11111000",
"10010011",
"00011111",
"11000011",
"10111000",
"01010010",
"11101011",
"11111100",
"11100010",
"11100100",
"00111100",
"10000010",
"00000001",
"00001101",
"00111111",
"10110100",
"00010101",
"10101010",
"11011111",
"01101100",
"11010101",
"11000000",
"00100100",
"10101110",
"11000100",
"00011100",
"11101111",
"01001001",
"00010100",
"10111010",
"00000010",
"01111110",
"11011001",
"10001011",
"00101010",
"00100001",
"10000000",
"00011110",
"00010111",
"01000001",
"01011001",
"01000110",
"00101101",
"01010100",
"01001100",
"11010000",
"10110010",
"01011010",
"01111101",
"10100111",
"01001111",
"00111011",
"11000101",
"10110110",
"01010101",
"10110001",
"10110111",
"01010000",
"01011000",
"00110111",
"10100101",
"10101111",
"01100000",
"01011111",
"01111001",
"00100111",
"11010110",
"11000010",
"01100010",
"11010111",
"00001110",
"00001011",
"10011001",
"00001001",
"00111010",
"01110011",
"00001010",
"10001101",
"01011101",
"11110101",
"01101011",
"01111010",
"01100001",
"11111110",
"01111011",
"11011110",
"01010001",
"00000110",
"00000111",
"01101010",
"11001010",
"01110111",
"10010110",
"10100001",
"00100010",
"00111001",
"00011101",
"10100110",
"11110110",
"10100010",
"10010101",
"00110100",
"10110011",
"01000100",
"11100001",
"01110000",
"10110101",
"11111001",
"01001101",
"10000111",
"10011010",
"10101011",
"11111010",
"10011110",
"00111101",
"01000111",
"11110001",
"10110000",
"10011100",
"11101101",
"11110010",
"00110011",
"01101111",
"00111110",
"10101101",
"01110100",
"01011011",
"01111000",
"11001100",
"00100000",
"00110101",
"01001000",
"10010100",
"10111100",
"00101000",
"00000100",
"01001011",
"00100101",
"10011111",
"00101110",
"10011101",
"10111101",
"10011000",
"11111011"
);			  
BEGIN
process (clk)
variable addr_int: integer range 0 to 255;
begin
  if (rising_edge (clk))then
	addr_int := conv_integer(unsigned(invsboxip));
	invsboxop <= rom(addr_int);
  end if;
end process;
END rtl;
