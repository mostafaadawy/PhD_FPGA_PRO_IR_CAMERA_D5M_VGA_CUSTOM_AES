-- VHDL Entity my_project1_lib.enc_lib.symbol
--
-- Created:
--          by - Mostafa.UNKNOWN (MOSTAFA_PC)
--          at - 13:47:23 02/27/2017
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2007.1 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY enc_lib IS
   PORT( 
      a             : IN     std_logic_vector (15 DOWNTO 0);
      b             : IN     std_logic_vector (15 DOWNTO 0);
      clk           : IN     std_logic;
      from_aes      : IN     std_logic_vector ( 135 DOWNTO 0 );
      ienc          : IN     std_logic;
      intr_from_aes : IN     std_logic;
      ioff          : IN     std_logic;
      ion           : IN     std_logic;
      chiper_intr   : OUT    std_logic;
      ciphered_out  : OUT    std_logic_vector ( 135 DOWNTO 0 );
      intr_to_aes   : OUT    std_logic;
      to_aes        : OUT    std_logic_vector (127 DOWNTO 0)
   );

-- Declarations

END enc_lib ;

--
-- VHDL Architecture my_project1_lib.enc_lib.struct
--
-- Created:
--          by - Mostafa.UNKNOWN (MOSTAFA_PC)
--          at - 13:47:24 02/27/2017
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2007.1 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

LIBRARY my_project1_lib;

ARCHITECTURE struct OF enc_lib IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL frame      : std_logic_vector(127 DOWNTO 0);
   SIGNAL frame_intr : std_logic;


   -- Component Declarations
   COMPONENT Counter
   PORT (
      clk        : IN     std_logic ;
      ion        : IN     std_logic ;
      frame_intr : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Enc_ctrl_top
   PORT (
      clk           : IN     std_logic ;
      frame         : IN     std_logic_vector (127 DOWNTO 0);
      frame_intr    : IN     std_logic ;
      from_aes      : IN     std_logic_vector ( 135 DOWNTO 0 );
      ienc          : IN     std_logic ;
      intr_from_aes : IN     std_logic ;
      ion           : IN     std_logic ;
      chiper_intr   : OUT    std_logic ;
      ciphered_out  : OUT    std_logic_vector ( 135 DOWNTO 0 );
      intr_to_aes   : OUT    std_logic ;
      to_aes        : OUT    std_logic_vector (127 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT coll_shif_reg
   PORT (
      a     : IN     std_logic_vector (15 DOWNTO 0);
      b     : IN     std_logic_vector (15 DOWNTO 0);
      clk   : IN     std_logic ;
      frame : OUT    std_logic_vector (127 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Counter USE ENTITY my_project1_lib.Counter;
   FOR ALL : Enc_ctrl_top USE ENTITY my_project1_lib.Enc_ctrl_top;
   FOR ALL : coll_shif_reg USE ENTITY my_project1_lib.coll_shif_reg;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_0 : Counter
      PORT MAP (
         clk        => clk,
         ion        => ion,
         frame_intr => frame_intr
      );
   U_2 : Enc_ctrl_top
      PORT MAP (
         clk           => clk,
         frame         => frame,
         frame_intr    => frame_intr,
         from_aes      => from_aes,
         ienc          => ienc,
         intr_from_aes => intr_from_aes,
         ion           => ion,
         chiper_intr   => chiper_intr,
         ciphered_out  => ciphered_out,
         intr_to_aes   => intr_to_aes,
         to_aes        => to_aes
      );
   U_1 : coll_shif_reg
      PORT MAP (
         a     => a,
         b     => b,
         clk   => clk,
         frame => frame
      );

END struct;
