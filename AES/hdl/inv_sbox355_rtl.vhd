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


ENTITY Inv_SBox355 IS
   PORT( 
      invsboxip : IN     std_logic_vector (0 TO 7);
      invsboxop : OUT    std_logic_vector (0 TO 7);
      clk       : IN     std_logic
   );

-- Declarations

END Inv_SBox355 ;

-- hds interface_end
ARCHITECTURE rtl OF Inv_SBox355 IS
Type rom_type is array (0 to 255) of std_logic_vector(0 to 7);
constant rom : rom_type := (
"01001010",
"00111010",
"01010111",
"11001010",
"11011001",
"01110101",
"01101001",
"10101010",
"10010001",
"10011110",
"01110110",
"11010110",
"11010111",
"00010101",
"00110011",
"00111000",
"01011010",
"01010010",
"10100010",
"10001000",
"01111111",
"00011110",
"00100011",
"00110001",
"00100110",
"10111010",
"10010111",
"00100001",
"11111100",
"00110000",
"11100100",
"11101001",
"11001000",
"01101111",
"00100000",
"10101111",
"11010101",
"10111101",
"11110000",
"01101000",
"11000010",
"00001101",
"00111110",
"00100100",
"01111001",
"11111111",
"00010100",
"00000100",
"01001011",
"00110101",
"01000101",
"10000000",
"00001011",
"11001100",
"10000111",
"01110111",
"10111001",
"11110001",
"11000111",
"10011000",
"11111000",
"00101100",
"10001100",
"10000010",
"01100111",
"01011000",
"11011110",
"00111101",
"11101110",
"11111011",
"00011010",
"01001000",
"00001000",
"10011101",
"01101010",
"01100011",
"11010000",
"00011001",
"10000001",
"01010011",
"11101010",
"00110111",
"01000010",
"00010111",
"00101010",
"01110000",
"01110011",
"10100100",
"00111100",
"01100010",
"11001111",
"01011111",
"01100000",
"10110001",
"11110111",
"01110100",
"00000011",
"10110011",
"00000101",
"00000000",
"11011100",
"00101111",
"00011011",
"10110101",
"00000111",
"10111100",
"01000011",
"11101011",
"00001001",
"01011110",
"01010110",
"10110010",
"10010101",
"10010000",
"10111110",
"11000100",
"00110010",
"10100110",
"00101110",
"01101110",
"11100000",
"00101011",
"11000110",
"01011001",
"00000001",
"11101000",
"01111010",
"10110000",
"11011000",
"01010001",
"11100001",
"01000100",
"10100101",
"00011000",
"10001111",
"01111110",
"10011100",
"10100000",
"01000111",
"10101001",
"00111001",
"01011101",
"11110101",
"00010011",
"11100010",
"11111010",
"11010011",
"10100001",
"10110110",
"00001111",
"01011011",
"10001110",
"10001001",
"01110010",
"10100111",
"11000101",
"01111101",
"00101001",
"01110001",
"00101101",
"10111000",
"00011100",
"11001011",
"10101000",
"01101100",
"00100101",
"10011001",
"00011101",
"11100101",
"01101011",
"10010010",
"00111011",
"11100011",
"11011101",
"00001100",
"10001011",
"00111111",
"01010101",
"11110110",
"10000101",
"01001110",
"11111001",
"01010000",
"01001111",
"00100010",
"01100101",
"11000001",
"10011010",
"10101101",
"11011010",
"10011111",
"10111011",
"01111011",
"10010011",
"11110011",
"01000000",
"01101101",
"00010110",
"11100111",
"01111100",
"00101000",
"11110010",
"10010110",
"10001010",
"10000011",
"11001001",
"00010001",
"11101101",
"11010001",
"11010010",
"01001101",
"01001100",
"11001101",
"01100110",
"00100111",
"10110100",
"11111110",
"01000110",
"11101100",
"01000001",
"10011011",
"10101011",
"10101110",
"10010100",
"11110100",
"00000010",
"00000110",
"00001010",
"01011100",
"01100100",
"00001110",
"10000110",
"10101100",
"00010010",
"01001001",
"00011111",
"00110110",
"11011011",
"10100011",
"11101111",
"10111111",
"00110100",
"11111101",
"01111000",
"11000011",
"01100001",
"10000100",
"10110111",
"01010100",
"11100110",
"11010100",
"00010000",
"11000000",
"10001101",
"11011111",
"11001110"
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

