-- hds header_start
--
-- VHDL Entity AES_Sound_1.MixCol_word.symbol
--
-- Created:
--          by - Mostafa.UNKNOWN (MOSTAFA_PC)
--          at - 15:33:16 02/26/2017
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY MixCol_word IS
   PORT( 
      Data1     : IN     std_logic_vector (0 TO 7);
      Data2     : IN     std_logic_vector (0 TO 7);
      Data3     : IN     std_logic_vector (0 TO 7);
      Data4     : IN     std_logic_vector (0 TO 7);
      Mult1     : IN     std_logic_vector (0 TO 7);
      Mult2     : IN     std_logic_vector (0 TO 7);
      Mult3     : IN     std_logic_vector (0 TO 7);
      Mult4     : IN     std_logic_vector (0 TO 7);
      word_out1 : OUT    std_logic_vector (0 TO 7);
      word_out2 : OUT    std_logic_vector (0 TO 7);
      word_out3 : OUT    std_logic_vector (0 TO 7);
      word_out4 : OUT    std_logic_vector (0 TO 7)
   );

-- Declarations

END MixCol_word ;

-- hds interface_end
--
-- VHDL Architecture AES_Sound_1.MixCol_word.struct
--
-- Created:
--          by - Mostafa.UNKNOWN (MOSTAFA_PC)
--          at - 15:33:16 02/26/2017
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF MixCol_word IS

   -- Architecture declarations

   -- Internal signal declarations


   -- Component Declarations
   COMPONENT MIxCol_one
   PORT (
      Multiplicand  : IN     std_logic_vector (0 TO 7);
      Multiplicand1 : IN     std_logic_vector (0 TO 7);
      Multiplicand2 : IN     std_logic_vector (0 TO 7);
      Multiplicand3 : IN     std_logic_vector (0 TO 7);
      Multplier     : IN     std_logic_vector (0 TO 7);
      Multplier1    : IN     std_logic_vector (0 TO 7);
      Multplier2    : IN     std_logic_vector (0 TO 7);
      Multplier3    : IN     std_logic_vector (0 TO 7);
      xorop         : OUT    std_logic_vector (0 TO 7)
   );
   END COMPONENT;



BEGIN
   -- Instance port mappings.
   I0 : MIxCol_one
      PORT MAP (
         Multiplicand  => Data1,
         Multiplicand1 => Data2,
         Multiplicand2 => Data3,
         Multiplicand3 => Data4,
         Multplier     => Mult1,
         Multplier1    => Mult2,
         Multplier2    => Mult3,
         Multplier3    => Mult4,
         xorop         => word_out1
      );
   I1 : MIxCol_one
      PORT MAP (
         Multiplicand  => Data1,
         Multiplicand1 => Data2,
         Multiplicand2 => Data3,
         Multiplicand3 => Data4,
         Multplier     => Mult4,
         Multplier1    => Mult1,
         Multplier2    => Mult2,
         Multplier3    => Mult3,
         xorop         => word_out2
      );
   I2 : MIxCol_one
      PORT MAP (
         Multiplicand  => Data1,
         Multiplicand1 => Data2,
         Multiplicand2 => Data3,
         Multiplicand3 => Data4,
         Multplier     => Mult3,
         Multplier1    => Mult4,
         Multplier2    => Mult1,
         Multplier3    => Mult2,
         xorop         => word_out3
      );
   I3 : MIxCol_one
      PORT MAP (
         Multiplicand  => Data1,
         Multiplicand1 => Data2,
         Multiplicand2 => Data3,
         Multiplicand3 => Data4,
         Multplier     => Mult2,
         Multplier1    => Mult3,
         Multplier2    => Mult4,
         Multplier3    => Mult1,
         xorop         => word_out4
      );

END struct;