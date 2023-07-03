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


ENTITY Inv_SBox351 IS
   PORT( 
      invsboxip : IN     std_logic_vector (0 TO 7);
      invsboxop : OUT    std_logic_vector (0 TO 7);
      clk       : IN     std_logic
   );

-- Declarations

END Inv_SBox351 ;

-- hds interface_end
ARCHITECTURE rtl OF Inv_SBox351 IS
Type rom_type is array (0 to 255) of std_logic_vector(0 to 7);
constant rom : rom_type := (
"01000110",
"10100110",
"01011110",
"01110101",
"11101011",
"11110001",
"11111010",
"11111110",
"11001001",
"00111011",
"00101101",
"00010110",
"11100011",
"10100010",
"11000010",
"01000000",
"01110110",
"00101100",
"01111000",
"10111011",
"00010011",
"11101010",
"10110011",
"10010111",
"11101101",
"11011001",
"10110100",
"11000011",
"01011000",
"00101001",
"01101110",
"11111000",
"00100010",
"01100101",
"11111011",
"11100000",
"00000110",
"01111101",
"01100110",
"01111111",
"11010100",
"00111101",
"11000001",
"01100000",
"10011100",
"00101111",
"01111001",
"10010101",
"10000011",
"00110100",
"00001000",
"00001101",
"10001010",
"01100001",
"01101011",
"00100000",
"11100010",
"10110101",
"00001001",
"01110011",
"00011001",
"10111001",
"01110010",
"00001011",
"01010110",
"01000101",
"11001010",
"10011111",
"00010100",
"00010101",
"01111010",
"11000000",
"01000010",
"11101110",
"01101000",
"00011010",
"11111111",
"01001111",
"00110101",
"11100110",
"10111101",
"10100011",
"01101111",
"11110011",
"00011011",
"10000000",
"11010011",
"11000111",
"10001011",
"01110001",
"10111111",
"11110101",
"01010010",
"10101111",
"00100111",
"11001000",
"11111100",
"10000010",
"01011011",
"00000000",
"00001111",
"00110011",
"10000110",
"10010000",
"10101101",
"01000011",
"11100001",
"01001000",
"10110111",
"11010010",
"11111101",
"01110000",
"00101010",
"11011111",
"10001111",
"00100100",
"10011110",
"10010011",
"11000100",
"11100101",
"01011111",
"11010001",
"11100111",
"00111000",
"00000001",
"11001111",
"11101001",
"00110000",
"00011111",
"00111100",
"01100111",
"11110010",
"00101110",
"11000110",
"00001100",
"11001100",
"00000111",
"11110110",
"00110010",
"11100100",
"01001010",
"10011000",
"01001011",
"11010110",
"11001101",
"01011010",
"00111110",
"11001110",
"10001100",
"10111100",
"00001110",
"01100100",
"10000101",
"00110111",
"11000101",
"01111100",
"11101100",
"11110000",
"01010101",
"11010101",
"10000001",
"00001010",
"00110001",
"10100101",
"10100000",
"00100011",
"00011110",
"01010011",
"00011101",
"00101011",
"00000010",
"10001101",
"00010111",
"11011010",
"01100011",
"11010111",
"10000100",
"11010000",
"01110100",
"10001000",
"10101100",
"11001011",
"01111011",
"10110010",
"01001001",
"00100001",
"01001101",
"01110111",
"00100101",
"11011110",
"01001100",
"01010001",
"00111010",
"00000100",
"01000100",
"10101001",
"01011101",
"01100010",
"11110111",
"11011101",
"10010010",
"10011010",
"01011001",
"00010000",
"01010111",
"11101000",
"10011011",
"00010010",
"10001001",
"10101011",
"10010100",
"10010110",
"10011001",
"11011011",
"01011100",
"00011000",
"00100110",
"00111001",
"10000111",
"10101010",
"10110000",
"11011100",
"01000111",
"00011100",
"11011000",
"10101000",
"10100111",
"10110110",
"11101111",
"00010001",
"00000101",
"10011101",
"01101100",
"01111110",
"01010100",
"01000001",
"01010000",
"00000011",
"10111110",
"10010001",
"00101000",
"11110100",
"10101110",
"01101001",
"10100001",
"01101010",
"10111010",
"10110001",
"00110110",
"11111001",
"00111111",
"10001110",
"10100100",
"01001110",
"01101101",
"10111000"
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
