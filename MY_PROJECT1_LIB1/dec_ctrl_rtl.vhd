--
-- VHDL Architecture my_project1_lib.dec_ctrl.rtl
--
-- Created:
--          by - Mostafa.UNKNOWN (MOSTAFA_PC)
--          at - 09:23:15 02/26/2017
--
-- using Mentor Graphics HDL Designer(TM) 2007.1 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY dec_ctrl IS
   PORT( 
      chipherd_in   : IN     std_logic_vector ( 135 DOWNTO 0 );
      clk           : IN     std_logic;
      decipher_en   : IN     std_logic;
      from_aes      : IN     std_logic_vector ( 127 DOWNTO 0 );
      idec          : IN     std_logic;
      intr_from_aes : IN     std_logic;
      ion           : IN     std_logic;
      intr_to_aes   : OUT    std_logic;
      load          : OUT    std_logic;
      reg_out       : OUT    std_logic_vector (127 DOWNTO 0);
      shift_intr    : OUT    std_logic;
      to_aes        : OUT    std_logic_vector ( 135 DOWNTO 0 )
   );

-- Declarations

END dec_ctrl ;

--
ARCHITECTURE rtl OF dec_ctrl IS
signal tmp : std_logic_vector(127 downto 0);
signal cnt : unsigned(3 downto 0);
BEGIN
  process(clk, idec,ion,from_aes,intr_from_aes,decipher_en,chipherd_in)
    begin
      if (rising_edge(clk)) then
        if( ion = '1') then
          
          if(idec = '1') then
              if(decipher_en = '1') then
                to_aes <= chipherd_in;
                intr_to_aes <= '1';
              else
                intr_to_aes <= '0';
              end if;
                
                
              if(intr_from_aes = '1') then
                    tmp <= from_aes;
                    cnt <= "0100";
                    load <= '1';
                    shift_intr <= '0';
              elsif(cnt >= 1) then
                     cnt <= cnt-1;
                     shift_intr <= '1';
                     load <= '0';
              else
                     shift_intr <= '0';
                     load <= '0';
              end if; 
                          
          else
              if(decipher_en = '1') then
                    tmp <= chipherd_in(127 downto 0);
                    cnt <= "0100";
                    load <= '1';
                    shift_intr <= '0';
              elsif(cnt >= 1) then
                    cnt <= cnt-1;
                    shift_intr <= '1';
                    load <= '0';
              else
                    shift_intr <= '0';
                    load <= '0';
              end if;    
          end if;
          

        else
          tmp <= (others=>'0');
          cnt <= (others=>'0');
          load <= '1';
          shift_intr <= '0';
          to_aes <= (others=>'0');
          intr_to_aes <='0';
        end if;
      end if;
    end process;
        reg_out <= tmp;
END ARCHITECTURE rtl;

