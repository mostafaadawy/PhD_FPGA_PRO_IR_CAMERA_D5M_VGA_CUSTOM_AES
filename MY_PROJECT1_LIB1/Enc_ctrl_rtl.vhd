LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Enc_ctrl_top IS
   PORT( 
      clk           : IN     std_logic;
      frame         : IN     std_logic_vector (127 DOWNTO 0);
      frame_intr    : IN     std_logic;
      from_aes      : IN     std_logic_vector ( 135 DOWNTO 0 );
      ienc          : IN     std_logic;
      intr_from_aes : IN     std_logic;
      ion           : IN     std_logic;
      chiper_intr   : OUT    std_logic;
      ciphered_out  : OUT    std_logic_vector ( 135 DOWNTO 0 );
      intr_to_aes   : OUT    std_logic;
      to_aes        : OUT    std_logic_vector (127 DOWNTO 0)
   );

-- Declarations

END Enc_ctrl_top ;

--
ARCHITECTURE rtl OF Enc_ctrl_top IS
signal tmp : std_logic_vector(135 downto 0);
BEGIN
  process(clk, intr_from_aes, from_aes, frame_intr, frame,ienc,ion)
    begin
      if (rising_edge(clk)) then
          if(ion = '1') then
            
              if (ienc = '1') then
                  if (intr_from_aes = '1') then
                    chiper_intr <= '1';
                    tmp <= from_aes;
                  else
                    chiper_intr <= '0';
                  end if;  
                  
                  if (frame_intr = '1') then
                    intr_to_aes <= '1';
                    to_aes <= frame;
                   else
                    intr_to_aes <= '0';
                  end if;               
                
              else
                  if (frame_intr = '1') then
                    chiper_intr <= '1';
                    tmp <= "00000000"&frame;
                  else
                    chiper_intr <= '0';
                  end if;
              end if;

          else
            tmp <= (others=>'0');
            chiper_intr <= '0';
            intr_to_aes <= '0';
            to_aes <= (others=>'0');
          end if;
      end if;
    end process;
        ciphered_out <= tmp;
END ARCHITECTURE rtl;

