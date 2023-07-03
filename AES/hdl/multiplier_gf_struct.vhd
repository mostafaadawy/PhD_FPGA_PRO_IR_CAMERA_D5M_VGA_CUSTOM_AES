-- hds header_start
--
-- VHDL Entity AES_Sound_1.Multiplier_GF.symbol
--
-- Created:
--          by - Mostafa.UNKNOWN (MOSTAFA_PC)
--          at - 15:33:15 02/26/2017
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY Multiplier_GF IS
   PORT( 
      Multiplicand : IN     std_logic_vector (0 TO 7);
      Multplier    : IN     std_logic_vector (0 TO 7);
      M_OUT        : OUT    std_logic_vector (0 TO 7)
   );

-- Declarations

END Multiplier_GF ;

-- hds interface_end
--
-- VHDL Architecture AES_Sound_1.Multiplier_GF.struct
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


ARCHITECTURE struct OF Multiplier_GF IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL Internal_8 : std_logic_vector(0 TO 7);
   SIGNAL lshiftop10 : std_logic_vector(0 TO 7);
   SIGNAL lshiftop14 : std_logic_vector(0 TO 7);
   SIGNAL lshiftop17 : std_logic_vector(0 TO 7);
   SIGNAL lshiftop19 : std_logic_vector(0 TO 7);
   SIGNAL lshiftop20 : std_logic_vector(0 TO 7);
   SIGNAL lshiftop5  : std_logic_vector(0 TO 7);
   SIGNAL out0       : std_logic_vector(0 TO 7);
   SIGNAL out1       : std_logic_vector(0 TO 7);
   SIGNAL out2       : std_logic_vector(0 TO 7);
   SIGNAL out3       : std_logic_vector(0 TO 7);
   SIGNAL out4       : std_logic_vector(0 TO 7);
   SIGNAL out5       : std_logic_vector(0 TO 7);
   SIGNAL out6       : std_logic_vector(0 TO 7);
   SIGNAL out7       : std_logic_vector(0 TO 7);


   -- Component Declarations
   COMPONENT MCol_Left_Shift
   PORT (
      lshiftip : IN     std_logic_vector (0 TO 7);
      lshiftop : OUT    std_logic_vector (0 TO 7)
   );
   END COMPONENT;
   COMPONENT M_Selector
   PORT (
      internal1 : IN     std_logic_vector (0 TO 7);
      internal2 : IN     std_logic_vector (0 TO 7);
      internal3 : IN     std_logic_vector (0 TO 7);
      internal4 : IN     std_logic_vector (0 TO 7);
      internal5 : IN     std_logic_vector (0 TO 7);
      internal6 : IN     std_logic_vector (0 TO 7);
      internal7 : IN     std_logic_vector (0 TO 7);
      internal8 : IN     std_logic_vector (0 TO 7);
      m_out     : OUT    std_logic_vector (0 TO 7)
   );
   END COMPONENT;
   COMPONENT Mux_Sel_GND
   PORT (
      in0  : IN     std_logic_vector (0 TO 7);
      sel  : IN     std_logic ;
      out0 : OUT    std_logic_vector (0 TO 7)
   );
   END COMPONENT;



BEGIN
   -- Instance port mappings.
   I21 : MCol_Left_Shift
      PORT MAP (
         lshiftip => Multiplicand,
         lshiftop => lshiftop5
      );
   I22 : MCol_Left_Shift
      PORT MAP (
         lshiftip => lshiftop5,
         lshiftop => lshiftop10
      );
   I23 : MCol_Left_Shift
      PORT MAP (
         lshiftip => lshiftop10,
         lshiftop => lshiftop14
      );
   I24 : MCol_Left_Shift
      PORT MAP (
         lshiftip => lshiftop14,
         lshiftop => lshiftop17
      );
   I25 : MCol_Left_Shift
      PORT MAP (
         lshiftip => lshiftop17,
         lshiftop => lshiftop19
      );
   I26 : MCol_Left_Shift
      PORT MAP (
         lshiftip => lshiftop19,
         lshiftop => lshiftop20
      );
   I27 : MCol_Left_Shift
      PORT MAP (
         lshiftip => lshiftop20,
         lshiftop => Internal_8
      );
   I28 : M_Selector
      PORT MAP (
         Internal1 => out0,
         Internal2 => out1,
         Internal3 => out2,
         Internal4 => out3,
         Internal5 => out4,
         Internal6 => out5,
         Internal7 => out6,
         Internal8 => out7,
         M_OUT     => M_OUT
      );
   I32 : Mux_Sel_GND
      PORT MAP (
         in0  => Internal_8,
         sel  => Multplier(0),
         out0 => out7
      );
   I34 : Mux_Sel_GND
      PORT MAP (
         in0  => lshiftop20,
         sel  => Multplier(1),
         out0 => out6
      );
   I35 : Mux_Sel_GND
      PORT MAP (
         in0  => lshiftop14,
         sel  => Multplier(4),
         out0 => out3
      );
   I36 : Mux_Sel_GND
      PORT MAP (
         in0  => lshiftop17,
         sel  => Multplier(3),
         out0 => out4
      );
   I37 : Mux_Sel_GND
      PORT MAP (
         in0  => lshiftop19,
         sel  => Multplier(2),
         out0 => out5
      );
   I38 : Mux_Sel_GND
      PORT MAP (
         in0  => Multiplicand,
         sel  => Multplier(7),
         out0 => out0
      );
   I39 : Mux_Sel_GND
      PORT MAP (
         in0  => lshiftop5,
         sel  => Multplier(6),
         out0 => out1
      );
   I40 : Mux_Sel_GND
      PORT MAP (
         in0  => lshiftop10,
         sel  => Multplier(5),
         out0 => out2
      );

END struct;