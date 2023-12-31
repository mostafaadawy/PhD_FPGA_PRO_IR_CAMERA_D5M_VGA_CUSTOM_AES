-- hds header_start
--
-- VHDL Entity AES_Sound_1.key_controller.symbol
--
-- Created:
--          by - Mostafa.UNKNOWN (MOSTAFA_PC)
--          at - 15:33:21 02/26/2017
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY key_controller IS
   PORT( 
      Clk                   : IN     std_logic;
      En                    : IN     std_logic;
      add                   : IN     std_logic_vector (0 TO 3);
      rst                   : IN     std_logic;
      En_Rcon               : OUT    std_logic;
      Sel_FB_Or_Inputrndkey : OUT    std_logic;
      Switch                : OUT    std_logic;
      W_en                  : OUT    std_logic;
      W_en1                 : OUT    std_logic;
      W_en2                 : OUT    std_logic;
      W_en3                 : OUT    std_logic;
      W_en4                 : OUT    std_logic;
      finish                : OUT    std_logic;
      int_cnt               : OUT    std_logic
   );

-- Declarations

END key_controller ;

-- hds interface_end
--
-- VHDL Architecture AES_Sound_1.key_controller.fsm
--
-- Created:
--          by - Mostafa.UNKNOWN (MOSTAFA_PC)
--          at - 15:33:21 02/26/2017
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE fsm OF key_controller IS

   -- Architecture Declarations
   TYPE STATE_TYPE IS (
      s0,
      s1,
      s2,
      s3,
      s4,
      s5,
      s6,
      s7,
      s8,
      s10,
      s9,
      s11,
      s12,
      s14,
      s17,
      s16,
      s13,
      s15,
      s18,
      s19,
      s20,
      s21
   );

   -- State vector declaration
   ATTRIBUTE state_vector : string;
   ATTRIBUTE state_vector OF fsm : ARCHITECTURE IS "current_state" ;


   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE ;
   SIGNAL next_state : STATE_TYPE ;

   -- Declare any pre-registered internal signals
   SIGNAL finish_int : std_logic  ;

BEGIN

   ----------------------------------------------------------------------------
   clocked : PROCESS(
      Clk,
      rst
   )
   ----------------------------------------------------------------------------
   BEGIN
      IF (rst = '0') THEN
         current_state <= s0;
         -- Reset Values
         finish <= '0';
      ELSIF (rising_edge(Clk)) THEN
         current_state <= next_state;
         -- Registered output assignments
         finish <= finish_int;

         -- Default Assignment To Internals

      END IF;

   END PROCESS clocked;

   ----------------------------------------------------------------------------
   nextstate : PROCESS (
      En,
      add,
      current_state
   )
   ----------------------------------------------------------------------------
   BEGIN
      CASE current_state IS
      WHEN s0 =>
         IF (En = '1') THEN
            next_state <= s19;
         ELSE
            next_state <= s0;
         END IF;
      WHEN s1 =>
            next_state <= s18;
      WHEN s2 =>
            next_state <= s12;
      WHEN s3 =>
            next_state <= s4;
      WHEN s4 =>
            next_state <= s5;
      WHEN s5 =>
            next_state <= s6;
      WHEN s6 =>
            next_state <= s7;
      WHEN s7 =>
            next_state <= s8;
      WHEN s8 =>
         IF (add < "1010") THEN
            next_state <= s9;
         ELSIF (add = "1010") THEN
            next_state <= s17;
         ELSE
            next_state <= s8;
         END IF;
      WHEN s10 =>
         IF (En = '1') THEN
            next_state <= s20;
         ELSE
            next_state <= s10;
         END IF;
      WHEN s9 =>
            next_state <= s11;
      WHEN s11 =>
            next_state <= s13;
      WHEN s12 =>
            next_state <= s14;
      WHEN s14 =>
            next_state <= s21;
      WHEN s17 =>
            next_state <= s16;
      WHEN s16 =>
            next_state <= s10;
      WHEN s13 =>
            next_state <= s3;
      WHEN s15 =>
            next_state <= s1;
      WHEN s18 =>
            next_state <= s3;
      WHEN s19 =>
         IF (En = '0') THEN
            next_state <= s2;
         ELSE
            next_state <= s19;
         END IF;
      WHEN s20 =>
         IF (En = '0') THEN
            next_state <= s2;
         ELSE
            next_state <= s20;
         END IF;
      WHEN s21 =>
            next_state <= s15;
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
      En_Rcon <= '0';
      Sel_FB_Or_Inputrndkey <= '0';
      Switch <= '0';
      W_en <= '0';
      W_en1 <= '0';
      W_en2 <= '0';
      W_en3 <= '0';
      W_en4 <= '0';
      int_cnt <= '0';
      -- Default Assignment To Internals

      -- Combined Actions
      CASE current_state IS
      WHEN s0 =>
         int_cnt <= '0';
         finish_int <= '0';
         Sel_FB_Or_Inputrndkey <= '0';
      WHEN s1 =>
         W_en1 <= '1';
         W_en2 <= '1';
         W_en3 <= '1';
         W_en4 <= '1';
         En_Rcon <= '1';
         Sel_FB_Or_Inputrndkey <= '1';
      WHEN s2 =>
         finish_int <= '0';
      WHEN s3 =>
         --leave for sbox
         int_cnt <= '1';
      WHEN s4 =>
         Switch <= '1'; -- enable feed back
         W_en1 <= '1';
      WHEN s5 =>
         Switch <= '1';
         W_en2 <= '1';
      WHEN s6 =>
         Switch <= '1';
         W_en3 <= '1';
      WHEN s7 =>
         Switch <= '1'; 
         W_en4 <= '1';
      WHEN s10 =>
         finish_int <= '1';
      WHEN s9 =>
         W_en <= '1';
      WHEN s12 =>
         Sel_FB_Or_Inputrndkey <= '1';
      WHEN s14 =>
         W_en <= '1';
         Sel_FB_Or_Inputrndkey <= '1';
      WHEN s17 =>
         W_en <= '1';
      WHEN s13 =>
         W_en1 <= '1';
         W_en2 <= '1';
         W_en3 <= '1';
         W_en4 <= '1';
         En_Rcon <= '1';
      WHEN s15 =>
         Sel_FB_Or_Inputrndkey <= '0';
      WHEN s18 =>
         Sel_FB_Or_Inputrndkey <= '0';
      WHEN s21 =>
         Sel_FB_Or_Inputrndkey <= '1';
      WHEN OTHERS =>
         NULL;
      END CASE;

   END PROCESS output;

   -- Concurrent Statements

END fsm;
