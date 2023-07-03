-- hds header_start
--
-- VHDL Entity AES_Sound_1.lim_intr.symbol
--
-- Created:
--          by - Mostafa.UNKNOWN (MOSTAFA_PC)
--          at - 15:33:19 02/26/2017
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY lim_intr IS
   PORT( 
      Clk : IN     std_logic;
      En  : IN     std_logic;
      Rst : IN     std_logic;
      Rdy : OUT    std_logic
   );

-- Declarations

END lim_intr ;

-- hds interface_end
--
-- VHDL Architecture AES_Sound_1.lim_intr.fsm
--
-- Created:
--          by - Mostafa.UNKNOWN (MOSTAFA_PC)
--          at - 15:33:19 02/26/2017
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE fsm OF lim_intr IS

   -- Architecture Declarations
   TYPE STATE_TYPE IS (
      s0,
      s1,
      s2
   );

   -- State vector declaration
   ATTRIBUTE state_vector : string;
   ATTRIBUTE state_vector OF fsm : ARCHITECTURE IS "current_state" ;


   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE ;
   SIGNAL next_state : STATE_TYPE ;

BEGIN

   ----------------------------------------------------------------------------
   clocked : PROCESS(
      Clk,
      Rst
   )
   ----------------------------------------------------------------------------
   BEGIN
      IF (Rst = '0') THEN
         current_state <= s0;
         -- Reset Values
      ELSIF (rising_edge(Clk)) THEN
         current_state <= next_state;
         -- Default Assignment To Internals

      END IF;

   END PROCESS clocked;

   ----------------------------------------------------------------------------
   nextstate : PROCESS (
      En,
      current_state
   )
   ----------------------------------------------------------------------------
   BEGIN
      CASE current_state IS
      WHEN s0 =>
         IF (En = '1') THEN
            next_state <= s1;
         ELSE
            next_state <= s0;
         END IF;
      WHEN s1 =>
            next_state <= s2;
      WHEN s2 =>
         IF (En = '0') THEN
            next_state <= s0;
         ELSE
            next_state <= s2;
         END IF;
      WHEN OTHERS =>
         next_state <= s0;
      END CASE;

   END PROCESS nextstate;

   ----------------------------------------------------------------------------
   output : PROCESS (
      current_state
   )
   ----------------------------------------------------------------------------
   BEGIN
      -- Default Assignment
      Rdy <= '0';
      -- Default Assignment To Internals

      -- Combined Actions
      CASE current_state IS
      WHEN s1 =>
         Rdy <= '1';
      WHEN OTHERS =>
         NULL;
      END CASE;

   END PROCESS output;

   -- Concurrent Statements

END fsm;