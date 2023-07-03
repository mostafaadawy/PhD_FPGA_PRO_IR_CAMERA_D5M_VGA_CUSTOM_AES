LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY sbox_rom IS
   PORT( 
      rom_in  : IN     std_logic_vector (0 TO 7);
      clk     : IN     std_logic;
      rom_out : OUT    std_logic_vector (0 TO 7)
   );

-- Declarations

END sbox_rom ;

-- hds interface_end
ARCHITECTURE rtl OF sbox_rom IS
Type rom_type is array (0 to 255) of std_logic_vector(0 to 7);
constant rom : rom_type :=(
        		  "01100011", -- when "00000000", -- Row= 0 -Col= 0 -- Value=63
                  "01111100", -- when "00000001", -- Row= 0 -Col= 1 -- Value=7C
                  "01110111", -- when "00000010", -- Row= 0 -Col= 2 -- Value=77
                  "01111011", -- when "00000011", -- Row= 0 -Col= 3 -- Value=7B
                  "11110010", -- when "00000100", -- Row= 0 -Col= 4 -- Value=F2
                  "01101011", -- when "00000101", -- Row= 0 -Col= 5 -- Value=6B
                  "01101111", -- when "00000110", -- Row= 0 -Col= 6 -- Value=6F
                  "11000101", -- when "00000111", -- Row= 0 -Col= 7 -- Value=C5
                  "00110000", -- when "00001000", -- Row= 0 -Col= 8 -- Value=30
                  "00000001", -- when "00001001", -- Row= 0 -Col= 9 -- Value=1
                  "01100111", -- when "00001010", -- Row= 0 -Col= 10 -- Value=67
                  "00101011", -- when "00001011", -- Row= 0 -Col= 11 -- Value=2B
                  "11111110", -- when "00001100", -- Row= 0 -Col= 12 -- Value=FE
                  "11010111", -- when "00001101", -- Row= 0 -Col= 13 -- Value=D7
                  "10101011", -- when "00001110", -- Row= 0 -Col= 14 -- Value=AB
                  "01110110", -- when "00001111", -- Row= 0 -Col= 15 -- Value=76
                  "11001010", -- when "00010000", -- Row= 1 -Col= 0 -- Value=CA
                  "10000010", -- when "00010001", -- Row= 1 -Col= 1 -- Value=82
                  "11001001", -- when "00010010", -- Row= 1 -Col= 2 -- Value=C9
                  "01111101", -- when "00010011", -- Row= 1 -Col= 3 -- Value=7D
                  "11111010", -- when "00010100", -- Row= 1 -Col= 4 -- Value=FA
                  "01011001", -- when "00010101", -- Row= 1 -Col= 5 -- Value=59
                  "01000111", -- when "00010110", -- Row= 1 -Col= 6 -- Value=47
                  "11110000", -- when "00010111", -- Row= 1 -Col= 7 -- Value=F0
                  "10101101", -- when "00011000", -- Row= 1 -Col= 8 -- Value=AD
                  "11010100", -- when "00011001", -- Row= 1 -Col= 9 -- Value=D4
                  "10100010", -- when "00011010", -- Row= 1 -Col= 10 -- Value=A2
                  "10101111", -- when "00011011", -- Row= 1 -Col= 11 -- Value=AF
                  "10011100", -- when "00011100", -- Row= 1 -Col= 12 -- Value=9C
                  "10100100", -- when "00011101", -- Row= 1 -Col= 13 -- Value=A4
                  "01110010", -- when "00011110", -- Row= 1 -Col= 14 -- Value=72
                  "11000000", -- when "00011111", -- Row= 1 -Col= 15 -- Value=C0
                  "10110111", -- when "00100000", -- Row= 2 -Col= 0 -- Value=B7
                  "11111101", -- when "00100001", -- Row= 2 -Col= 1 -- Value=FD
                  "10010011", -- when "00100010", -- Row= 2 -Col= 2 -- Value=93
                  "00100110", -- when "00100011", -- Row= 2 -Col= 3 -- Value=26
                  "00110110", -- when "00100100", -- Row= 2 -Col= 4 -- Value=36
                  "00111111", -- when "00100101", -- Row= 2 -Col= 5 -- Value=3F
                  "11110111", -- when "00100110", -- Row= 2 -Col= 6 -- Value=F7
                  "11001100", -- when "00100111", -- Row= 2 -Col= 7 -- Value=CC
                  "00110100", -- when "00101000", -- Row= 2 -Col= 8 -- Value=34
                  "10100101", -- when "00101001", -- Row= 2 -Col= 9 -- Value=A5
                  "11100101", -- when "00101010", -- Row= 2 -Col= 10 -- Value=E5
                  "11110001", -- when "00101011", -- Row= 2 -Col= 11 -- Value=F1
                  "01110001", -- when "00101100", -- Row= 2 -Col= 12 -- Value=71
                  "11011000", -- when "00101101", -- Row= 2 -Col= 13 -- Value=D8
                  "00110001", -- when "00101110", -- Row= 2 -Col= 14 -- Value=31
                  "00010101", -- when "00101111", -- Row= 2 -Col= 15 -- Value=15
                  "00000100", -- when "00110000", -- Row= 3 -Col= 0 -- Value=4
                  "11000111", -- when "00110001", -- Row= 3 -Col= 1 -- Value=C7
                  "00100011", -- when "00110010", -- Row= 3 -Col= 2 -- Value=23
                  "11000011", -- when "00110011", -- Row= 3 -Col= 3 -- Value=C3
                  "00011000", -- when "00110100", -- Row= 3 -Col= 4 -- Value=18
                  "10010110", -- when "00110101", -- Row= 3 -Col= 5 -- Value=96
                  "00000101", -- when "00110110", -- Row= 3 -Col= 6 -- Value=5
                  "10011010", -- when "00110111", -- Row= 3 -Col= 7 -- Value=9A
                  "00000111", -- when "00111000", -- Row= 3 -Col= 8 -- Value=7
                  "00010010", -- when "00111001", -- Row= 3 -Col= 9 -- Value=12
                  "10000000", -- when "00111010", -- Row= 3 -Col= 10 -- Value=80
                  "11100010", -- when "00111011", -- Row= 3 -Col= 11 -- Value=E2
                  "11101011", -- when "00111100", -- Row= 3 -Col= 12 -- Value=EB
                  "00100111", -- when "00111101", -- Row= 3 -Col= 13 -- Value=27
                  "10110010", -- when "00111110", -- Row= 3 -Col= 14 -- Value=B2
                  "01110101", -- when "00111111", -- Row= 3 -Col= 15 -- Value=75
                  "00001001", -- when "01000000", -- Row= 4 -Col= 0 -- Value=9
                  "10000011", -- when "01000001", -- Row= 4 -Col= 1 -- Value=83
                  "00101100", -- when "01000010", -- Row= 4 -Col= 2 -- Value=2C
                  "00011010", -- when "01000011", -- Row= 4 -Col= 3 -- Value=1A
                  "00011011", -- when "01000100", -- Row= 4 -Col= 4 -- Value=1B
                  "01101110", -- when "01000101", -- Row= 4 -Col= 5 -- Value=6E
                  "01011010", -- when "01000110", -- Row= 4 -Col= 6 -- Value=5A
                  "10100000", -- when "01000111", -- Row= 4 -Col= 7 -- Value=A0
                  "01010010", -- when "01001000", -- Row= 4 -Col= 8 -- Value=52
                  "00111011", -- when "01001001", -- Row= 4 -Col= 9 -- Value=3B
                  "11010110", -- when "01001010", -- Row= 4 -Col= 10 -- Value=D6
                  "10110011", -- when "01001011", -- Row= 4 -Col= 11 -- Value=B3
                  "00101001", -- when "01001100", -- Row= 4 -Col= 12 -- Value=29
                  "11100011", -- when "01001101", -- Row= 4 -Col= 13 -- Value=E3
                  "00101111", -- when "01001110", -- Row= 4 -Col= 14 -- Value=2F
                  "10000100", -- when "01001111", -- Row= 4 -Col= 15 -- Value=84
                  "01010011", -- when "01010000", -- Row= 5 -Col= 0 -- Value=53
                  "11010001", -- when "01010001", -- Row= 5 -Col= 1 -- Value=D1
                  "00000000", -- when "01010010", -- Row= 5 -Col= 2 -- Value=0
                  "11101101", -- when "01010011", -- Row= 5 -Col= 3 -- Value=ED
                  "00100000", -- when "01010100", -- Row= 5 -Col= 4 -- Value=20
                  "11111100", -- when "01010101", -- Row= 5 -Col= 5 -- Value=FC
                  "10110001", -- when "01010110", -- Row= 5 -Col= 6 -- Value=B1
                  "01011011", -- when "01010111", -- Row= 5 -Col= 7 -- Value=5B
                  "01101010", -- when "01011000", -- Row= 5 -Col= 8 -- Value=6A
                  "11001011", -- when "01011001", -- Row= 5 -Col= 9 -- Value=CB
                  "10111110", -- when "01011010", -- Row= 5 -Col= 10 -- Value=BE
                  "00111001", -- when "01011011", -- Row= 5 -Col= 11 -- Value=39
                  "01001010", -- when "01011100", -- Row= 5 -Col= 12 -- Value=4A
                  "01001100", -- when "01011101", -- Row= 5 -Col= 13 -- Value=4C
                  "01011000", -- when "01011110", -- Row= 5 -Col= 14 -- Value=58
                  "11001111", -- when "01011111", -- Row= 5 -Col= 15 -- Value=CF
                  "11010000", -- when "01100000", -- Row= 6 -Col= 0 -- Value=D0
                  "11101111", -- when "01100001", -- Row= 6 -Col= 1 -- Value=EF
                  "10101010", -- when "01100010", -- Row= 6 -Col= 2 -- Value=AA
                  "11111011", -- when "01100011", -- Row= 6 -Col= 3 -- Value=FB
                  "01000011", -- when "01100100", -- Row= 6 -Col= 4 -- Value=43
                  "01001101", -- when "01100101", -- Row= 6 -Col= 5 -- Value=4D
                  "00110011", -- when "01100110", -- Row= 6 -Col= 6 -- Value=33
                  "10000101", -- when "01100111", -- Row= 6 -Col= 7 -- Value=85
                  "01000101", -- when "01101000", -- Row= 6 -Col= 8 -- Value=45
                  "11111001", -- when "01101001", -- Row= 6 -Col= 9 -- Value=F9
                  "00000010", -- when "01101010", -- Row= 6 -Col= 10 -- Value=2
                  "01111111", -- when "01101011", -- Row= 6 -Col= 11 -- Value=7F
                  "01010000", -- when "01101100", -- Row= 6 -Col= 12 -- Value=50
                  "00111100", -- when "01101101", -- Row= 6 -Col= 13 -- Value=3C
                  "10011111", -- when "01101110", -- Row= 6 -Col= 14 -- Value=9F
                  "10101000", -- when "01101111", -- Row= 6 -Col= 15 -- Value=A8
                  "01010001", -- when "01110000", -- Row= 7 -Col= 0 -- Value=51
                  "10100011", -- when "01110001", -- Row= 7 -Col= 1 -- Value=A3
                  "01000000", -- when "01110010", -- Row= 7 -Col= 2 -- Value=40
                  "10001111", -- when "01110011", -- Row= 7 -Col= 3 -- Value=8F
                  "10010010", -- when "01110100", -- Row= 7 -Col= 4 -- Value=92
                  "10011101", -- when "01110101", -- Row= 7 -Col= 5 -- Value=9D
                  "00111000", -- when "01110110", -- Row= 7 -Col= 6 -- Value=38
                  "11110101", -- when "01110111", -- Row= 7 -Col= 7 -- Value=F5
                  "10111100", -- when "01111000", -- Row= 7 -Col= 8 -- Value=BC
                  "10110110", -- when "01111001", -- Row= 7 -Col= 9 -- Value=B6
                  "11011010", -- when "01111010", -- Row= 7 -Col= 10 -- Value=DA
                  "00100001", -- when "01111011", -- Row= 7 -Col= 11 -- Value=21
                  "00010000", -- when "01111100", -- Row= 7 -Col= 12 -- Value=10
                  "11111111", -- when "01111101", -- Row= 7 -Col= 13 -- Value=FF
                  "11110011", -- when "01111110", -- Row= 7 -Col= 14 -- Value=F3
                  "11010010", -- when "01111111", -- Row= 7 -Col= 15 -- Value=D2
                  "11001101", -- when "10000000", -- Row= 8 -Col= 0 -- Value=CD
                  "00001100", -- when "10000001", -- Row= 8 -Col= 1 -- Value=C
                  "00010011", -- when "10000010", -- Row= 8 -Col= 2 -- Value=13
                  "11101100", -- when "10000011", -- Row= 8 -Col= 3 -- Value=EC
                  "01011111", -- when "10000100", -- Row= 8 -Col= 4 -- Value=5F
                  "10010111", -- when "10000101", -- Row= 8 -Col= 5 -- Value=97
                  "01000100", -- when "10000110", -- Row= 8 -Col= 6 -- Value=44
                  "00010111", -- when "10000111", -- Row= 8 -Col= 7 -- Value=17
                  "11000100", -- when "10001000", -- Row= 8 -Col= 8 -- Value=C4
                  "10100111", -- when "10001001", -- Row= 8 -Col= 9 -- Value=A7
                  "01111110", -- when "10001010", -- Row= 8 -Col= 10 -- Value=7E
                  "00111101", -- when "10001011", -- Row= 8 -Col= 11 -- Value=3D
                  "01100100", -- when "10001100", -- Row= 8 -Col= 12 -- Value=64
                  "01011101", -- when "10001101", -- Row= 8 -Col= 13 -- Value=5D
                  "00011001", -- when "10001110", -- Row= 8 -Col= 14 -- Value=19
                  "01110011", -- when "10001111", -- Row= 8 -Col= 15 -- Value=73
                  "01100000", -- when "10010000", -- Row= 9 -Col= 0 -- Value=60
                  "10000001", -- when "10010001", -- Row= 9 -Col= 1 -- Value=81
                  "01001111", -- when "10010010", -- Row= 9 -Col= 2 -- Value=4F
                  "11011100", -- when "10010011", -- Row= 9 -Col= 3 -- Value=DC
                  "00100010", -- when "10010100", -- Row= 9 -Col= 4 -- Value=22
                  "00101010", -- when "10010101", -- Row= 9 -Col= 5 -- Value=2A
                  "10010000", -- when "10010110", -- Row= 9 -Col= 6 -- Value=90
                  "10001000", -- when "10010111", -- Row= 9 -Col= 7 -- Value=88
                  "01000110", -- when "10011000", -- Row= 9 -Col= 8 -- Value=46
                  "11101110", -- when "10011001", -- Row= 9 -Col= 9 -- Value=EE
                  "10111000", -- when "10011010", -- Row= 9 -Col= 10 -- Value=B8
                  "00010100", -- when "10011011", -- Row= 9 -Col= 11 -- Value=14
                  "11011110", -- when "10011100", -- Row= 9 -Col= 12 -- Value=DE
                  "01011110", -- when "10011101", -- Row= 9 -Col= 13 -- Value=5E
                  "00001011", -- when "10011110", -- Row= 9 -Col= 14 -- Value=B
                  "11011011", -- when "10011111", -- Row= 9 -Col= 15 -- Value=DB
                  "11100000", -- when "10100000", -- Row= 10 -Col= 0 -- Value=E0
                  "00110010", -- when "10100001", -- Row= 10 -Col= 1 -- Value=32
                  "00111010", -- when "10100010", -- Row= 10 -Col= 2 -- Value=3A
                  "00001010", -- when "10100011", -- Row= 10 -Col= 3 -- Value=A
                  "01001001", -- when "10100100", -- Row= 10 -Col= 4 -- Value=49
                  "00000110", -- when "10100101", -- Row= 10 -Col= 5 -- Value=6
                  "00100100", -- when "10100110", -- Row= 10 -Col= 6 -- Value=24
                  "01011100", -- when "10100111", -- Row= 10 -Col= 7 -- Value=5C
                  "11000010", -- when "10101000", -- Row= 10 -Col= 8 -- Value=C2
                  "11010011", -- when "10101001", -- Row= 10 -Col= 9 -- Value=D3
                  "10101100", -- when "10101010", -- Row= 10 -Col= 10 -- Value=AC
                  "01100010", -- when "10101011", -- Row= 10 -Col= 11 -- Value=62
                  "10010001", -- when "10101100", -- Row= 10 -Col= 12 -- Value=91
                  "10010101", -- when "10101101", -- Row= 10 -Col= 13 -- Value=95
                  "11100100", -- when "10101110", -- Row= 10 -Col= 14 -- Value=E4
                  "01111001", -- when "10101111", -- Row= 10 -Col= 15 -- Value=79
                  "11100111", -- when "10110000", -- Row= 11 -Col= 0 -- Value=E7
                  "11001000", -- when "10110001", -- Row= 11 -Col= 1 -- Value=C8
                  "00110111", -- when "10110010", -- Row= 11 -Col= 2 -- Value=37
                  "01101101", -- when "10110011", -- Row= 11 -Col= 3 -- Value=6D
                  "10001101", -- when "10110100", -- Row= 11 -Col= 4 -- Value=8D
                  "11010101", -- when "10110101", -- Row= 11 -Col= 5 -- Value=D5
                  "01001110", -- when "10110110", -- Row= 11 -Col= 6 -- Value=4E
                  "10101001", -- when "10110111", -- Row= 11 -Col= 7 -- Value=A9
                  "01101100", -- when "10111000", -- Row= 11 -Col= 8 -- Value=6C
                  "01010110", -- when "10111001", -- Row= 11 -Col= 9 -- Value=56
                  "11110100", -- when "10111010", -- Row= 11 -Col= 10 -- Value=F4
                  "11101010", -- when "10111011", -- Row= 11 -Col= 11 -- Value=EA
                  "01100101", -- when "10111100", -- Row= 11 -Col= 12 -- Value=65
                  "01111010", -- when "10111101", -- Row= 11 -Col= 13 -- Value=7A
                  "10101110", -- when "10111110", -- Row= 11 -Col= 14 -- Value=AE
                  "00001000", -- when "10111111", -- Row= 11 -Col= 15 -- Value=8
                  "10111010", -- when "11000000", -- Row= 12 -Col= 0 -- Value=BA
                  "01111000", -- when "11000001", -- Row= 12 -Col= 1 -- Value=78
                  "00100101", -- when "11000010", -- Row= 12 -Col= 2 -- Value=25
                  "00101110", -- when "11000011", -- Row= 12 -Col= 3 -- Value=2E
                  "00011100", -- when "11000100", -- Row= 12 -Col= 4 -- Value=1C
                  "10100110", -- when "11000101", -- Row= 12 -Col= 5 -- Value=A6
                  "10110100", -- when "11000110", -- Row= 12 -Col= 6 -- Value=B4
                  "11000110", -- when "11000111", -- Row= 12 -Col= 7 -- Value=C6
                  "11101000", -- when "11001000", -- Row= 12 -Col= 8 -- Value=E8
                  "11011101", -- when "11001001", -- Row= 12 -Col= 9 -- Value=DD
                  "01110100", -- when "11001010", -- Row= 12 -Col= 10 -- Value=74
                  "00011111", -- when "11001011", -- Row= 12 -Col= 11 -- Value=1F
                  "01001011", -- when "11001100", -- Row= 12 -Col= 12 -- Value=4B
                  "10111101", -- when "11001101", -- Row= 12 -Col= 13 -- Value=BD
                  "10001011", -- when "11001110", -- Row= 12 -Col= 14 -- Value=8B
                  "10001010", -- when "11001111", -- Row= 12 -Col= 15 -- Value=8A
                  "01110000", -- when "11010000", -- Row= 13 -Col= 0 -- Value=70
                  "00111110", -- when "11010001", -- Row= 13 -Col= 1 -- Value=3E
                  "10110101", -- when "11010010", -- Row= 13 -Col= 2 -- Value=B5
                  "01100110", -- when "11010011", -- Row= 13 -Col= 3 -- Value=66
                  "01001000", -- when "11010100", -- Row= 13 -Col= 4 -- Value=48
                  "00000011", -- when "11010101", -- Row= 13 -Col= 5 -- Value=3
                  "11110110", -- when "11010110", -- Row= 13 -Col= 6 -- Value=F6
                  "00001110", -- when "11010111", -- Row= 13 -Col= 7 -- Value=E
                  "01100001", -- when "11011000", -- Row= 13 -Col= 8 -- Value=61
                  "00110101", -- when "11011001", -- Row= 13 -Col= 9 -- Value=35
                  "01010111", -- when "11011010", -- Row= 13 -Col= 10 -- Value=57
                  "10111001", -- when "11011011", -- Row= 13 -Col= 11 -- Value=B9
                  "10000110", -- when "11011100", -- Row= 13 -Col= 12 -- Value=86
                  "11000001", -- when "11011101", -- Row= 13 -Col= 13 -- Value=C1
                  "00011101", -- when "11011110", -- Row= 13 -Col= 14 -- Value=1D
                  "10011110", -- when "11011111", -- Row= 13 -Col= 15 -- Value=9E
                  "11100001", -- when "11100000", -- Row= 14 -Col= 0 -- Value=E1
                  "11111000", -- when "11100001", -- Row= 14 -Col= 1 -- Value=F8
                  "10011000", -- when "11100010", -- Row= 14 -Col= 2 -- Value=98
                  "00010001", -- when "11100011", -- Row= 14 -Col= 3 -- Value=11
                  "01101001", -- when "11100100", -- Row= 14 -Col= 4 -- Value=69
                  "11011001", -- when "11100101", -- Row= 14 -Col= 5 -- Value=D9
                  "10001110", -- when "11100110", -- Row= 14 -Col= 6 -- Value=8E
                  "10010100", -- when "11100111", -- Row= 14 -Col= 7 -- Value=94
                  "10011011", -- when "11101000", -- Row= 14 -Col= 8 -- Value=9B
                  "00011110", -- when "11101001", -- Row= 14 -Col= 9 -- Value=1E
                  "10000111", -- when "11101010", -- Row= 14 -Col= 10 -- Value=87
                  "11101001", -- when "11101011", -- Row= 14 -Col= 11 -- Value=E9
                  "11001110", -- when "11101100", -- Row= 14 -Col= 12 -- Value=CE
                  "01010101", -- when "11101101", -- Row= 14 -Col= 13 -- Value=55
                  "00101000", -- when "11101110", -- Row= 14 -Col= 14 -- Value=28
                  "11011111", -- when "11101111", -- Row= 14 -Col= 15 -- Value=DF
                  "10001100", -- when "11110000", -- Row= 15 -Col= 0 -- Value=8C
                  "10100001", -- when "11110001", -- Row= 15 -Col= 1 -- Value=A1
                  "10001001", -- when "11110010", -- Row= 15 -Col= 2 -- Value=89
                  "00001101", -- when "11110011", -- Row= 15 -Col= 3 -- Value=D
                  "10111111", -- when "11110100", -- Row= 15 -Col= 4 -- Value=BF
                  "11100110", -- when "11110101", -- Row= 15 -Col= 5 -- Value=E6
                  "01000010", -- when "11110110", -- Row= 15 -Col= 6 -- Value=42
                  "01101000", -- when "11110111", -- Row= 15 -Col= 7 -- Value=68
                  "01000001", -- when "11111000", -- Row= 15 -Col= 8 -- Value=41
                  "10011001", -- when "11111001", -- Row= 15 -Col= 9 -- Value=99
                  "00101101", -- when "11111010", -- Row= 15 -Col= 10 -- Value=2D
                  "00001111", -- when "11111011", -- Row= 15 -Col= 11 -- Value=F
                  "10110000", -- when "11111100", -- Row= 15 -Col= 12 -- Value=B0
                  "01010100", -- when "11111101", -- Row= 15 -Col= 13 -- Value=54
                  "10111011", -- when "11111110", -- Row= 15 -Col= 14 -- Value=BB
                  "00010110" -- when "11111111", -- Row= 15 -Col= 15 -- Value=16
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
