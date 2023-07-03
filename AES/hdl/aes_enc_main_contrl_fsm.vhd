-- hds header_start
--
-- VHDL Entity AES_Sound_1.AES_Enc_main_contrl.symbol
--
-- Created:
--          by - Mostafa.UNKNOWN (MOSTAFA_PC)
--          at - 08:27:31 02/27/2017
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY AES_Enc_main_contrl IS
   PORT( 
      Data_rdy    : IN     std_logic;
      En_data     : IN     std_logic;
      Key_rdy     : IN     std_logic;
      clk         : IN     std_logic;
      rst         : IN     std_logic;
      s_intial    : IN     std_logic_vector (0 TO 7);
      En_data_reg : OUT    std_logic;
      En_set      : OUT    std_logic;
      en_sen_seed : OUT    std_logic;
      gen_en      : OUT    std_logic;
      gen_seed    : OUT    std_logic_vector (0 TO 7)
   );

-- Declarations

END AES_Enc_main_contrl ;

-- hds interface_end
--
-- VHDL Architecture AES_Sound_1.AES_Enc_main_contrl.fsm
--
-- Created:
--          by - Mostafa.UNKNOWN (MOSTAFA_PC)
--          at - 08:27:31 02/27/2017
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE fsm OF AES_Enc_main_contrl IS

   -- Architecture Declarations
   signal cnt_gen : unsigned(0 to 7);
   signal temp :std_logic_vector(0 to 7);

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
      s9,
      s10
   );

   -- State vector declaration
   ATTRIBUTE state_vector : string;
   ATTRIBUTE state_vector OF fsm : ARCHITECTURE IS "current_state" ;


   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE ;
   SIGNAL next_state : STATE_TYPE ;

   -- Declare any pre-registered internal signals
   SIGNAL gen_seed_int : std_logic_vector (0 TO 7) ;

BEGIN

   ----------------------------------------------------------------------------
   clocked : PROCESS(
      clk,
      rst
   )
   ----------------------------------------------------------------------------
   BEGIN
      IF (rst = '0') THEN
         current_state <= s0;
         -- Reset Values
         gen_seed <= (others=>'0');
         cnt_gen <= (others=>'0');
         temp <= "01011101";
      ELSIF (rising_edge(clk)) THEN
         current_state <= next_state;
         -- Registered output assignments
         gen_seed <= gen_seed_int;

         -- Default Assignment To Internals

         -- Combined Actions for internal signals only
         CASE current_state IS
         WHEN s0 =>
            cnt_gen <= (others => '0');
            temp <="01011101";
         WHEN s4 =>
            cnt_gen <= cnt_gen+1;
            temp <= s_intial;
         WHEN s7 =>
            cnt_gen <= (others => '0');
         WHEN OTHERS =>
            NULL;
         END CASE;

      END IF;

   END PROCESS clocked;

   ----------------------------------------------------------------------------
   nextstate : PROCESS (
      Data_rdy,
      En_data,
      Key_rdy,
      cnt_gen,
      current_state
   )
   ----------------------------------------------------------------------------
   BEGIN
      CASE current_state IS
      WHEN s0 =>
         IF (Key_rdy = '1') THEN
            next_state <= s7;
         ELSE
            next_state <= s0;
         END IF;
      WHEN s1 =>
            next_state <= s8;
      WHEN s2 =>
            next_state <= s3;
      WHEN s3 =>
            next_state <= s4;
      WHEN s4 =>
            next_state <= s6;
      WHEN s5 =>
         IF (cnt_gen = 255) THEN
            next_state <= s7;
         ELSE
            next_state <= s9;
         END IF;
      WHEN s6 =>
         IF (Data_rdy = '1') THEN
            next_state <= s5;
         ELSE
            next_state <= s6;
         END IF;
      WHEN s7 =>
            next_state <= s10;
      WHEN s8 =>
         IF (En_data = '1') THEN
            next_state <= s2;
         ELSE
            next_state <= s8;
         END IF;
      WHEN s9 =>
         IF (En_data = '1') THEN
            next_state <= s2;
         ELSE
            next_state <= s9;
         END IF;
      WHEN s10 =>
            next_state <= s1;
      WHEN OTHERS =>
         next_state <= s0;
      END CASE;

   END PROCESS nextstate;

   ----------------------------------------------------------------------------
   output : PROCESS (
      current_state,
      temp
   )
   ----------------------------------------------------------------------------
   BEGIN
      -- Default Assignment
      En_data_reg <= '0';
      En_set <= '0';
      en_sen_seed <= '0';
      gen_en <= '0';
      -- Default Assignment To Internals

      -- Combined Actions
      CASE current_state IS
      WHEN s1 =>
         gen_en <= '1';
      WHEN s2 =>
         En_data_reg <= '1';
      WHEN s4 =>
         en_sen_seed <= '1';
      WHEN s5 =>
         gen_en <= '1';
      WHEN s7 =>
         gen_seed_int <= temp;
         En_set <= '1';
      WHEN s8 =>
         --leave for gen_mix roms
      WHEN s10 =>
         En_set <= '1';
      WHEN OTHERS =>
         NULL;
      END CASE;

   END PROCESS output;

   -- Concurrent Statements

END fsm;