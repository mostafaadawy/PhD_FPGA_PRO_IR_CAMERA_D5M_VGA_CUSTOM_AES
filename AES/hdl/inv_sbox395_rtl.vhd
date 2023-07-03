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


ENTITY Inv_SBox395 IS
   PORT( 
      clk       : IN     std_logic;
      invsboxip : IN     std_logic_vector (0 TO 7);
      invsboxop : OUT    std_logic_vector (0 TO 7)
   );

-- Declarations

END Inv_SBox395 ;

-- hds interface_end
ARCHITECTURE rtl OF Inv_SBox395 IS
Type rom_type is array (0 to 255) of std_logic_vector(0 to 7);
constant rom : rom_type := (
"11111011",
"00101111",
"00001011",
"10101010",
"10000011",
"11100110",
"00001010",
"00010010",
"11011000",
"11110110",
"01101011",
"11011101",
"00100110",
"00111100",
"11100001",
"11001110",
"00100010",
"00100001",
"01010100",
"01010011",
"10001111",
"00101011",
"10001011",
"01100001",
"11111101",
"10010000",
"11001011",
"10011010",
"10011000",
"10111001",
"00101001",
"10100111",
"00111111",
"01000011",
"01010111",
"11111111",
"01000101",
"01001111",
"11100101",
"01101101",
"01101000",
"00110101",
"11110111",
"10101001",
"10100101",
"11000111",
"00110010",
"11000110",
"01111100",
"01000110",
"11101000",
"11010111",
"11011110",
"00011100",
"00111101",
"10110110",
"10101111",
"00001101",
"00101000",
"10010100",
"11101101",
"01100000",
"10110001",
"01011010",
"01101110",
"10001001",
"10000110",
"01110101",
"10011111",
"10110010",
"01101010",
"11011001",
"00000010",
"10001000",
"10001100",
"00100101",
"11111110",
"11111010",
"00011010",
"10100011",
"01000111",
"00100100",
"00000100",
"10010011",
"01111000",
"00010111",
"11011100",
"10000111",
"01010110",
"11000010",
"10101100",
"11010011",
"11111001",
"11000101",
"10001110",
"00001000",
"11000001",
"01100100",
"11001000",
"00000000",
"10001010",
"01000001",
"01011001",
"01001110",
"01010001",
"11101001",
"01110010",
"00100111",
"00110111",
"01111010",
"10000001",
"00111010",
"11101111",
"00111001",
"00111011",
"11010110",
"01111111",
"11001101",
"01111101",
"00010110",
"00101110",
"10000101",
"01110001",
"00011101",
"00000001",
"00010000",
"01000100",
"10101000",
"11100000",
"00101010",
"11100011",
"11101100",
"01101111",
"00000110",
"00001110",
"00110110",
"00011000",
"10000000",
"01100110",
"11110101",
"00111110",
"11001001",
"00100011",
"01100010",
"01011000",
"10100000",
"01001011",
"01001101",
"10110011",
"11001010",
"00110000",
"11001100",
"10100100",
"11010001",
"10110000",
"10010110",
"10010010",
"01011111",
"11000011",
"11101011",
"10110111",
"11001111",
"11110011",
"01101001",
"01110000",
"10111000",
"00010101",
"11010010",
"11101110",
"10111100",
"10111010",
"11110001",
"11110010",
"10000100",
"00000011",
"01110011",
"00011001",
"11000100",
"01100011",
"11111100",
"00001100",
"01101100",
"01000000",
"01111011",
"10111110",
"01011101",
"10010001",
"10111101",
"00011111",
"00010011",
"10100001",
"00011110",
"11110100",
"01110100",
"01111110",
"10101110",
"10000010",
"10011100",
"11010000",
"01100101",
"00100000",
"11011011",
"11111000",
"01011011",
"00010001",
"00101100",
"11010101",
"01010000",
"10001101",
"00010100",
"10011011",
"01001010",
"01001100",
"01001001",
"10011001",
"11101010",
"10010101",
"10011101",
"00001111",
"00101101",
"10111011",
"01010010",
"01001000",
"10101101",
"00000101",
"00000111",
"00001001",
"00011011",
"10011110",
"11011010",
"10100010",
"11100100",
"11000000",
"10110100",
"01010101",
"01110110",
"00111000",
"11100111",
"01011100",
"11100010",
"10110101",
"11010100",
"01100111",
"00110001",
"01110111",
"00110100",
"01011110",
"11011111",
"11110000",
"00110011",
"10101011",
"10111111",
"01111001",
"10010111",
"01000010",
"10100110"
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
