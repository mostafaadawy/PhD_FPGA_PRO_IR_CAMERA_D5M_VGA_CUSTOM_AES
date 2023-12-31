-- hds header_start
--
-- VHDL Entity AES_Sound_1.Rnd_inv.symbol
--
-- Created:
--          by - Mostafa.UNKNOWN (MOSTAFA_PC)
--          at - 15:33:23 02/26/2017
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY Rnd_inv IS
   PORT( 
      Key       : IN     std_logic_vector (0 TO 127);
      Mult      : IN     std_logic_vector (0 TO 31);
      RND_Input : IN     std_logic_vector (0 TO 127);
      Sel       : IN     std_logic_vector (0 TO 63);
      clk       : IN     std_logic;
      RND_OUT   : OUT    std_logic_vector (0 TO 127)
   );

-- Declarations

END Rnd_inv ;

-- hds interface_end
--
-- VHDL Architecture AES_Sound_1.Rnd_inv.struct
--
-- Created:
--          by - Mostafa.UNKNOWN (MOSTAFA_PC)
--          at - 15:33:24 02/26/2017
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF Rnd_inv IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL Data1     : std_logic_vector(0 TO 7);
   SIGNAL Data10    : std_logic_vector(0 TO 7);
   SIGNAL Data11    : std_logic_vector(0 TO 7);
   SIGNAL Data12    : std_logic_vector(0 TO 7);
   SIGNAL Data13    : std_logic_vector(0 TO 7);
   SIGNAL Data14    : std_logic_vector(0 TO 7);
   SIGNAL Data15    : std_logic_vector(0 TO 7);
   SIGNAL Data16    : std_logic_vector(0 TO 7);
   SIGNAL Data2     : std_logic_vector(0 TO 7);
   SIGNAL Data3     : std_logic_vector(0 TO 7);
   SIGNAL Data4     : std_logic_vector(0 TO 7);
   SIGNAL Data5     : std_logic_vector(0 TO 7);
   SIGNAL Data6     : std_logic_vector(0 TO 7);
   SIGNAL Data7     : std_logic_vector(0 TO 7);
   SIGNAL Data8     : std_logic_vector(0 TO 7);
   SIGNAL Data9     : std_logic_vector(0 TO 7);
   SIGNAL Sub_in1   : std_logic_vector(0 TO 7);
   SIGNAL Sub_in10  : std_logic_vector(0 TO 7);
   SIGNAL Sub_in11  : std_logic_vector(0 TO 7);
   SIGNAL Sub_in12  : std_logic_vector(0 TO 7);
   SIGNAL Sub_in13  : std_logic_vector(0 TO 7);
   SIGNAL Sub_in14  : std_logic_vector(0 TO 7);
   SIGNAL Sub_in15  : std_logic_vector(0 TO 7);
   SIGNAL Sub_in16  : std_logic_vector(0 TO 7);
   SIGNAL Sub_in2   : std_logic_vector(0 TO 7);
   SIGNAL Sub_in3   : std_logic_vector(0 TO 7);
   SIGNAL Sub_in4   : std_logic_vector(0 TO 7);
   SIGNAL Sub_in5   : std_logic_vector(0 TO 7);
   SIGNAL Sub_in6   : std_logic_vector(0 TO 7);
   SIGNAL Sub_in7   : std_logic_vector(0 TO 7);
   SIGNAL Sub_in8   : std_logic_vector(0 TO 7);
   SIGNAL Sub_in9   : std_logic_vector(0 TO 7);
   SIGNAL Sub_out1  : std_logic_vector(0 TO 7);
   SIGNAL Sub_out10 : std_logic_vector(0 TO 7);
   SIGNAL Sub_out11 : std_logic_vector(0 TO 7);
   SIGNAL Sub_out12 : std_logic_vector(0 TO 7);
   SIGNAL Sub_out13 : std_logic_vector(0 TO 7);
   SIGNAL Sub_out14 : std_logic_vector(0 TO 7);
   SIGNAL Sub_out15 : std_logic_vector(0 TO 7);
   SIGNAL Sub_out16 : std_logic_vector(0 TO 7);
   SIGNAL Sub_out2  : std_logic_vector(0 TO 7);
   SIGNAL Sub_out3  : std_logic_vector(0 TO 7);
   SIGNAL Sub_out4  : std_logic_vector(0 TO 7);
   SIGNAL Sub_out5  : std_logic_vector(0 TO 7);
   SIGNAL Sub_out6  : std_logic_vector(0 TO 7);
   SIGNAL Sub_out7  : std_logic_vector(0 TO 7);
   SIGNAL Sub_out8  : std_logic_vector(0 TO 7);
   SIGNAL Sub_out9  : std_logic_vector(0 TO 7);


   -- Component Declarations
   COMPONENT Inv_Substituation
   PORT (
      Inv_Sub_IN1   : IN     std_logic_vector (0 TO 7);
      Inv_Sub_IN10  : IN     std_logic_vector (0 TO 7);
      Inv_Sub_IN11  : IN     std_logic_vector (0 TO 7);
      Inv_Sub_IN12  : IN     std_logic_vector (0 TO 7);
      Inv_Sub_IN13  : IN     std_logic_vector (0 TO 7);
      Inv_Sub_IN14  : IN     std_logic_vector (0 TO 7);
      Inv_Sub_IN15  : IN     std_logic_vector (0 TO 7);
      Inv_Sub_IN16  : IN     std_logic_vector (0 TO 7);
      Inv_Sub_IN2   : IN     std_logic_vector (0 TO 7);
      Inv_Sub_IN3   : IN     std_logic_vector (0 TO 7);
      Inv_Sub_IN4   : IN     std_logic_vector (0 TO 7);
      Inv_Sub_IN5   : IN     std_logic_vector (0 TO 7);
      Inv_Sub_IN6   : IN     std_logic_vector (0 TO 7);
      Inv_Sub_IN7   : IN     std_logic_vector (0 TO 7);
      Inv_Sub_IN8   : IN     std_logic_vector (0 TO 7);
      Inv_Sub_IN9   : IN     std_logic_vector (0 TO 7);
      clk           : IN     std_logic ;
      Inv_Sub_OUT1  : OUT    std_logic_vector (0 TO 7);
      Inv_Sub_OUT10 : OUT    std_logic_vector (0 TO 7);
      Inv_Sub_OUT11 : OUT    std_logic_vector (0 TO 7);
      Inv_Sub_OUT12 : OUT    std_logic_vector (0 TO 7);
      Inv_Sub_OUT13 : OUT    std_logic_vector (0 TO 7);
      Inv_Sub_OUT14 : OUT    std_logic_vector (0 TO 7);
      Inv_Sub_OUT15 : OUT    std_logic_vector (0 TO 7);
      Inv_Sub_OUT16 : OUT    std_logic_vector (0 TO 7);
      Inv_Sub_OUT2  : OUT    std_logic_vector (0 TO 7);
      Inv_Sub_OUT3  : OUT    std_logic_vector (0 TO 7);
      Inv_Sub_OUT4  : OUT    std_logic_vector (0 TO 7);
      Inv_Sub_OUT5  : OUT    std_logic_vector (0 TO 7);
      Inv_Sub_OUT6  : OUT    std_logic_vector (0 TO 7);
      Inv_Sub_OUT7  : OUT    std_logic_vector (0 TO 7);
      Inv_Sub_OUT8  : OUT    std_logic_vector (0 TO 7);
      Inv_Sub_OUT9  : OUT    std_logic_vector (0 TO 7)
   );
   END COMPONENT;
   COMPONENT SH_Inv_SH
   PORT (
      in1         : IN     std_logic_vector (0 TO 7);
      in10        : IN     std_logic_vector (0 TO 7);
      in11        : IN     std_logic_vector (0 TO 7);
      in12        : IN     std_logic_vector (0 TO 7);
      in13        : IN     std_logic_vector (0 TO 7);
      in14        : IN     std_logic_vector (0 TO 7);
      in15        : IN     std_logic_vector (0 TO 7);
      in16        : IN     std_logic_vector (0 TO 7);
      in2         : IN     std_logic_vector (0 TO 7);
      in3         : IN     std_logic_vector (0 TO 7);
      in4         : IN     std_logic_vector (0 TO 7);
      in5         : IN     std_logic_vector (0 TO 7);
      in6         : IN     std_logic_vector (0 TO 7);
      in7         : IN     std_logic_vector (0 TO 7);
      in8         : IN     std_logic_vector (0 TO 7);
      in9         : IN     std_logic_vector (0 TO 7);
      sel1        : IN     std_logic_vector (0 TO 3);
      sel10       : IN     std_logic_vector (0 TO 3);
      sel11       : IN     std_logic_vector (0 TO 3);
      sel12       : IN     std_logic_vector (0 TO 3);
      sel13       : IN     std_logic_vector (0 TO 3);
      sel14       : IN     std_logic_vector (0 TO 3);
      sel15       : IN     std_logic_vector (0 TO 3);
      sel16       : IN     std_logic_vector (0 TO 3);
      sel2        : IN     std_logic_vector (0 TO 3);
      sel3        : IN     std_logic_vector (0 TO 3);
      sel4        : IN     std_logic_vector (0 TO 3);
      sel5        : IN     std_logic_vector (0 TO 3);
      sel6        : IN     std_logic_vector (0 TO 3);
      sel7        : IN     std_logic_vector (0 TO 3);
      sel8        : IN     std_logic_vector (0 TO 3);
      sel9        : IN     std_logic_vector (0 TO 3);
      shift_out10 : OUT    std_logic_vector (0 TO 7);
      shift_out11 : OUT    std_logic_vector (0 TO 7);
      shift_out12 : OUT    std_logic_vector (0 TO 7);
      shift_out13 : OUT    std_logic_vector (0 TO 7);
      shift_out14 : OUT    std_logic_vector (0 TO 7);
      shift_out15 : OUT    std_logic_vector (0 TO 7);
      shift_out16 : OUT    std_logic_vector (0 TO 7);
      shift_out7  : OUT    std_logic_vector (0 TO 7);
      shift_out8  : OUT    std_logic_vector (0 TO 7);
      shift_out9  : OUT    std_logic_vector (0 TO 7);
      shit_out1   : OUT    std_logic_vector (0 TO 7);
      shit_out2   : OUT    std_logic_vector (0 TO 7);
      shit_out3   : OUT    std_logic_vector (0 TO 7);
      shit_out4   : OUT    std_logic_vector (0 TO 7);
      shit_out5   : OUT    std_logic_vector (0 TO 7);
      shit_out6   : OUT    std_logic_vector (0 TO 7)
   );
   END COMPONENT;
   COMPONENT Top_MIxCol
   PORT (
      Data1      : IN     std_logic_vector (0 TO 7);
      Data10     : IN     std_logic_vector (0 TO 7);
      Data11     : IN     std_logic_vector (0 TO 7);
      Data12     : IN     std_logic_vector (0 TO 7);
      Data13     : IN     std_logic_vector (0 TO 7);
      Data14     : IN     std_logic_vector (0 TO 7);
      Data15     : IN     std_logic_vector (0 TO 7);
      Data16     : IN     std_logic_vector (0 TO 7);
      Data2      : IN     std_logic_vector (0 TO 7);
      Data3      : IN     std_logic_vector (0 TO 7);
      Data4      : IN     std_logic_vector (0 TO 7);
      Data5      : IN     std_logic_vector (0 TO 7);
      Data6      : IN     std_logic_vector (0 TO 7);
      Data7      : IN     std_logic_vector (0 TO 7);
      Data8      : IN     std_logic_vector (0 TO 7);
      Data9      : IN     std_logic_vector (0 TO 7);
      Mult1      : IN     std_logic_vector (0 TO 7);
      Mult2      : IN     std_logic_vector (0 TO 7);
      Mult3      : IN     std_logic_vector (0 TO 7);
      Mult4      : IN     std_logic_vector (0 TO 7);
      word_out1  : OUT    std_logic_vector (0 TO 7);
      word_out10 : OUT    std_logic_vector (0 TO 7);
      word_out11 : OUT    std_logic_vector (0 TO 7);
      word_out12 : OUT    std_logic_vector (0 TO 7);
      word_out13 : OUT    std_logic_vector (0 TO 7);
      word_out14 : OUT    std_logic_vector (0 TO 7);
      word_out15 : OUT    std_logic_vector (0 TO 7);
      word_out16 : OUT    std_logic_vector (0 TO 7);
      word_out2  : OUT    std_logic_vector (0 TO 7);
      word_out3  : OUT    std_logic_vector (0 TO 7);
      word_out4  : OUT    std_logic_vector (0 TO 7);
      word_out5  : OUT    std_logic_vector (0 TO 7);
      word_out6  : OUT    std_logic_vector (0 TO 7);
      word_out7  : OUT    std_logic_vector (0 TO 7);
      word_out8  : OUT    std_logic_vector (0 TO 7);
      word_out9  : OUT    std_logic_vector (0 TO 7)
   );
   END COMPONENT;
   COMPONENT xor_byte
   PORT (
      in0  : IN     std_logic_vector (0 TO 7);
      in1  : IN     std_logic_vector (0 TO 7);
      out0 : OUT    std_logic_vector (0 TO 7)
   );
   END COMPONENT;



BEGIN
   -- Instance port mappings.
   I1 : Inv_Substituation
      PORT MAP (
         Inv_Sub_IN1   => RND_Input(0 TO 7),
         Inv_Sub_IN10  => RND_Input(72 TO 79),
         Inv_Sub_IN11  => RND_Input(80 TO 87),
         Inv_Sub_IN12  => RND_Input(88 TO 95),
         Inv_Sub_IN13  => RND_Input(96 TO 103),
         Inv_Sub_IN14  => RND_Input(104 TO 111),
         Inv_Sub_IN15  => RND_Input(112 TO 119),
         Inv_Sub_IN16  => RND_Input(120 TO 127),
         Inv_Sub_IN2   => RND_Input(8 TO 15),
         Inv_Sub_IN3   => RND_Input(16 TO 23),
         Inv_Sub_IN4   => RND_Input(24 TO 31),
         Inv_Sub_IN5   => RND_Input(32 TO 39),
         Inv_Sub_IN6   => RND_Input(40 TO 47),
         Inv_Sub_IN7   => RND_Input(48 TO 55),
         Inv_Sub_IN8   => RND_Input(56 TO 63),
         Inv_Sub_IN9   => RND_Input(64 TO 71),
         clk           => clk,
         Inv_Sub_OUT1  => Sub_in1,
         Inv_Sub_OUT10 => Sub_in10,
         Inv_Sub_OUT11 => Sub_in11,
         Inv_Sub_OUT12 => Sub_in12,
         Inv_Sub_OUT13 => Sub_in13,
         Inv_Sub_OUT14 => Sub_in14,
         Inv_Sub_OUT15 => Sub_in15,
         Inv_Sub_OUT16 => Sub_in16,
         Inv_Sub_OUT2  => Sub_in2,
         Inv_Sub_OUT3  => Sub_in3,
         Inv_Sub_OUT4  => Sub_in4,
         Inv_Sub_OUT5  => Sub_in5,
         Inv_Sub_OUT6  => Sub_in6,
         Inv_Sub_OUT7  => Sub_in7,
         Inv_Sub_OUT8  => Sub_in8,
         Inv_Sub_OUT9  => Sub_in9
      );
   I3 : SH_Inv_SH
      PORT MAP (
         in1         => Sub_in1,
         in10        => Sub_in10,
         in11        => Sub_in11,
         in12        => Sub_in12,
         in13        => Sub_in13,
         in14        => Sub_in14,
         in15        => Sub_in15,
         in16        => Sub_in16,
         in2         => Sub_in2,
         in3         => Sub_in3,
         in4         => Sub_in4,
         in5         => Sub_in5,
         in6         => Sub_in6,
         in7         => Sub_in7,
         in8         => Sub_in8,
         in9         => Sub_in9,
         sel1        => Sel(0 TO 3),
         sel10       => Sel(36 TO 39),
         sel11       => Sel(40 TO 43),
         sel12       => Sel(44 TO 47),
         sel13       => Sel(48 TO 51),
         sel14       => Sel(52 TO 55),
         sel15       => Sel(56 TO 59),
         sel16       => Sel(60 TO 63),
         sel2        => Sel(4 TO 7),
         sel3        => Sel(8 TO 11),
         sel4        => Sel(12 TO 15),
         sel5        => Sel(16 TO 19),
         sel6        => Sel(20 TO 23),
         sel7        => Sel(24 TO 27),
         sel8        => Sel(28 TO 31),
         sel9        => Sel(32 TO 35),
         shift_out10 => Sub_out10,
         shift_out11 => Sub_out11,
         shift_out12 => Sub_out12,
         shift_out13 => Sub_out13,
         shift_out14 => Sub_out14,
         shift_out15 => Sub_out15,
         shift_out16 => Sub_out16,
         shift_out7  => Sub_out7,
         shift_out8  => Sub_out8,
         shift_out9  => Sub_out9,
         shit_out1   => Sub_out1,
         shit_out2   => Sub_out2,
         shit_out3   => Sub_out3,
         shit_out4   => Sub_out4,
         shit_out5   => Sub_out5,
         shit_out6   => Sub_out6
      );
   I20 : Top_MIxCol
      PORT MAP (
         Data1      => Data1,
         Data10     => Data10,
         Data11     => Data11,
         Data12     => Data12,
         Data13     => Data13,
         Data14     => Data14,
         Data15     => Data15,
         Data16     => Data16,
         Data2      => Data2,
         Data3      => Data3,
         Data4      => Data4,
         Data5      => Data5,
         Data6      => Data6,
         Data7      => Data7,
         Data8      => Data8,
         Data9      => Data9,
         Mult1      => Mult(0 TO 7),
         Mult2      => Mult(8 TO 15),
         Mult3      => Mult(16 TO 23),
         Mult4      => Mult(24 TO 31),
         word_out1  => RND_OUT(0 TO 7),
         word_out10 => RND_OUT(72 TO 79),
         word_out11 => RND_OUT(80 TO 87),
         word_out12 => RND_OUT(88 TO 95),
         word_out13 => RND_OUT(96 TO 103),
         word_out14 => RND_OUT(104 TO 111),
         word_out15 => RND_OUT(112 TO 119),
         word_out16 => RND_OUT(120 TO 127),
         word_out2  => RND_OUT(8 TO 15),
         word_out3  => RND_OUT(16 TO 23),
         word_out4  => RND_OUT(24 TO 31),
         word_out5  => RND_OUT(32 TO 39),
         word_out6  => RND_OUT(40 TO 47),
         word_out7  => RND_OUT(48 TO 55),
         word_out8  => RND_OUT(56 TO 63),
         word_out9  => RND_OUT(64 TO 71)
      );
   I4 : xor_byte
      PORT MAP (
         in0  => Sub_out1,
         in1  => Key(0 TO 7),
         out0 => Data1
      );
   I5 : xor_byte
      PORT MAP (
         in0  => Sub_out2,
         in1  => Key(8 TO 15),
         out0 => Data2
      );
   I6 : xor_byte
      PORT MAP (
         in0  => Sub_out3,
         in1  => Key(16 TO 23),
         out0 => Data3
      );
   I7 : xor_byte
      PORT MAP (
         in0  => Sub_out4,
         in1  => Key(24 TO 31),
         out0 => Data4
      );
   I8 : xor_byte
      PORT MAP (
         in0  => Sub_out5,
         in1  => Key(32 TO 39),
         out0 => Data5
      );
   I9 : xor_byte
      PORT MAP (
         in0  => Sub_out6,
         in1  => Key(40 TO 47),
         out0 => Data6
      );
   I10 : xor_byte
      PORT MAP (
         in0  => Sub_out7,
         in1  => Key(48 TO 55),
         out0 => Data7
      );
   I11 : xor_byte
      PORT MAP (
         in0  => Sub_out8,
         in1  => Key(56 TO 63),
         out0 => Data8
      );
   I12 : xor_byte
      PORT MAP (
         in0  => Sub_out9,
         in1  => Key(64 TO 71),
         out0 => Data9
      );
   I13 : xor_byte
      PORT MAP (
         in0  => Sub_out10,
         in1  => Key(72 TO 79),
         out0 => Data10
      );
   I14 : xor_byte
      PORT MAP (
         in0  => Sub_out11,
         in1  => Key(80 TO 87),
         out0 => Data11
      );
   I15 : xor_byte
      PORT MAP (
         in0  => Sub_out12,
         in1  => Key(88 TO 95),
         out0 => Data12
      );
   I16 : xor_byte
      PORT MAP (
         in0  => Sub_out13,
         in1  => Key(96 TO 103),
         out0 => Data13
      );
   I17 : xor_byte
      PORT MAP (
         in0  => Sub_out14,
         in1  => Key(104 TO 111),
         out0 => Data14
      );
   I18 : xor_byte
      PORT MAP (
         in0  => Sub_out15,
         in1  => Key(112 TO 119),
         out0 => Data15
      );
   I19 : xor_byte
      PORT MAP (
         in0  => Sub_out16,
         in1  => Key(120 TO 127),
         out0 => Data16
      );

END struct;
