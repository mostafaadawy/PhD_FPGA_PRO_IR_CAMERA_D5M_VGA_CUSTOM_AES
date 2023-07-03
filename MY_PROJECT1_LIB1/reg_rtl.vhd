--
-- VHDL Architecture my_project1_lib.reg.rtl
--
-- Created:
--          by - Mostafa.UNKNOWN (MOSTAFA_PC)
--          at - 13:00:16 02/26/2017
--
-- using Mentor Graphics HDL Designer(TM) 2007.1 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY reg IS
   PORT( 
      clk        : IN     std_logic;
      ienc       : IN     std_logic;
      load       : IN     std_logic;
      reg_out    : IN     std_logic_vector ( 127 DOWNTO 0 );
      shift_intr : IN     std_logic;
      dec_a      : OUT    std_logic_vector (15 DOWNTO 0);
      dec_b      : OUT    std_logic_vector (15 DOWNTO 0)
   );

-- Declarations

END reg ;

--
ARCHITECTURE rtl OF reg IS
signal tmp : std_logic_vector(127 downto 0);
signal flag : unsigned(3 downto 0);
BEGIN
  process(clk, load, shift_intr, reg_out, tmp, flag,ienc)
    begin
      if (rising_edge(clk)) then
        if (ienc = '1') then
              if (load = '1') then
                tmp <= reg_out;
                flag <= "0000";
              elsif(shift_intr = '1') then
                  if (flag = 0) then
                  flag <=flag +1;
                  elsif(flag>=1) then
                  tmp <= "00000000000000000000000000000000" & tmp(127 downto 32);
                  flag <= "0000";
                  end if;
              end if;
            else
              if (load = '1') then
                tmp <= reg_out;
              elsif(shift_intr = '1') then
                tmp <= "00000000000000000000000000000000" & tmp(127 downto 32);
              end if;
          end if;
      end if;
    end process;
        dec_a <= tmp(31 downto 16);
        dec_b <= tmp(15 downto 0);
END ARCHITECTURE rtl;

