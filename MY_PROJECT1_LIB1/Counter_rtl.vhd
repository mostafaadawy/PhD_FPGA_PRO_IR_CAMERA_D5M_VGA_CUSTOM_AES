
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Counter IS
   PORT( 
      clk        : IN     std_logic;
      ion        : IN     std_logic;
      frame_intr : OUT    std_logic
   );

-- Declarations

END Counter ;

--
ARCHITECTURE rtl OF Counter IS
signal cnt: unsigned(3 downto 0);
BEGIN
  process(clk, cnt, ion)
    begin
      if (rising_edge(clk)) then
        if(ion = '1') then
          if(cnt <3) then
          cnt <= cnt+1;
        else
          cnt <= (others=>'0');
        end if;
        else
          cnt <= (others=>'0');
        end if;
      end if;
    end process;
        frame_intr <= '1' when cnt = 3 else '0';
END ARCHITECTURE rtl;

