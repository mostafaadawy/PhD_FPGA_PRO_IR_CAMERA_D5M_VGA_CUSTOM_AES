-- VHDL Entity AES.custom_top.symbol
--
-- Created:
--          by - Mostafa.UNKNOWN (MOSTAFA_PC)
--          at - 12:24:53 02/27/2017
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2007.1 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY custom_top IS
   PORT( 
      En_key          : IN     std_logic;
      In_Plain_Data   : IN     std_logic_vector (0 TO 127);
      clk             : IN     std_logic;
      en              : IN     std_logic;
      in_Cipher_Data  : IN     std_logic_vector (0 TO 135);
      rst             : IN     std_logic;
      Out_Cipher_Data : OUT    std_logic_vector (0 TO 135);
      Out_Plain_Data  : OUT    std_logic_vector (0 TO 127);
      cipher_rdy      : OUT    std_logic;
      key_rdy         : OUT    std_logic;
      plain_rdy       : OUT    std_logic;
      en_encryption   : IN     std_logic;
      en_decryption   : IN     std_logic
   );

-- Declarations

END custom_top ;

--
-- VHDL Architecture AES.custom_top.struct
--
-- Created:
--          by - Mostafa.UNKNOWN (MOSTAFA_PC)
--          at - 12:24:53 02/27/2017
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2007.1 (Build 19)
--
--  hds interface_end
-- 
--  VHDL Architecture AES_Sound_1.custom_top.struct
-- 
--  Created:
--           by - Mostafa.UNKNOWN (MOSTAFA_PC)
--           at - 08:27:31 02/27/2017
-- 
--  Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
-- 
-- 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY AES;

ARCHITECTURE struct OF custom_top IS

   -- Architecture declarations

   -- Internal signal declarations
   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL Chipher_D_Rdy : std_logic;
   SIGNAL Plain_D_Rdy   : std_logic;
   SIGNAL Rdy           : std_logic;
   SIGNAL Rdy1          : std_logic;
   SIGNAL Rdy2          : std_logic;


   -- Component Declarations
   COMPONENT AES_combining
   PORT (
      EN_Dec          : IN     std_logic;
      EN_Enc          : IN     std_logic;
      En_key          : IN     std_logic;
      In_Plain_Data   : IN     std_logic_vector (0 TO 127);
      clk             : IN     std_logic;
      in_Cipher_Data  : IN     std_logic_vector (0 TO 135);
      rst             : IN     std_logic;
      Chipher_D_Rdy   : OUT    std_logic;
      Out_Cipher_Data : OUT    std_logic_vector (0 TO 135);
      Out_Plain_Data  : OUT    std_logic_vector (0 TO 127);
      Plain_D_Rdy     : OUT    std_logic;
      key_rdy         : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT expander
   PORT (
      Chipher_D_Rdy : IN     std_logic;
      clk           : IN     std_logic;
      en            : IN     std_logic;
      cipher_rdy    : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT lim_intr
   PORT (
      Clk : IN     std_logic;
      En  : IN     std_logic;
      Rst : IN     std_logic;
      Rdy : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AES_combining USE ENTITY AES.AES_combining;
   FOR ALL : expander USE ENTITY AES.expander;
   FOR ALL : lim_intr USE ENTITY AES.lim_intr;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   --  Instance port mappings.
   -- 
   I0 : AES_combining
      PORT MAP (
         EN_Dec          => Rdy,
         EN_Enc          => Rdy1,
         En_key          => Rdy2,
         In_Plain_Data   => In_Plain_Data,
         clk             => clk,
         in_Cipher_Data  => in_Cipher_Data,
         rst             => rst,
         Chipher_D_Rdy   => Chipher_D_Rdy,
         Out_Cipher_Data => Out_Cipher_Data,
         Out_Plain_Data  => Out_Plain_Data,
         Plain_D_Rdy     => Plain_D_Rdy,
         key_rdy         => key_rdy
      );
   I3 : expander
      PORT MAP (
         Chipher_D_Rdy => Chipher_D_Rdy,
         clk           => clk,
         en            => en,
         cipher_rdy    => cipher_rdy
      );
   I4 : expander
      PORT MAP (
         Chipher_D_Rdy => Plain_D_Rdy,
         clk           => clk,
         en            => en,
         cipher_rdy    => plain_rdy
      );
   I1 : lim_intr
      PORT MAP (
         Clk => clk,
         En  => en_decryption,
         Rst => rst,
         Rdy => Rdy
      );
   I2 : lim_intr
      PORT MAP (
         Clk => clk,
         En  => en_encryption,
         Rst => rst,
         Rdy => Rdy1
      );
   I5 : lim_intr
      PORT MAP (
         Clk => clk,
         En  => En_key,
         Rst => rst,
         Rdy => Rdy2
      );

END struct;
