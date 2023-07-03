-- hds header_start
--
-- VHDL Architecture ECC.ir_rx_ctrl.rtl
--
-- Created:
--          by - Mostafa.UNKNOWN (MOSTAFA_PC)
--          at - 06:23:56 02/23/2017
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY ir_rx_ctrl IS
   PORT( 
      clk         : IN     std_logic;
      coded_rx_ir : IN     std_logic_vector (31 DOWNTO 0);
      oenc        : OUT    std_logic; --a button on IR
      odec        : OUT    std_logic;  --b
      oturn_off   : OUT    std_logic;
      oturn_on    : OUT    std_logic
   );

-- Declarations

END ir_rx_ctrl ;

-- hds interface_end
ARCHITECTURE rtl OF ir_rx_ctrl IS
signal save_state : std_logic;
BEGIN
process(clk, coded_rx_ir)
begin
  if (rising_edge(clk)) then
    if (coded_rx_ir = "11101101000100100110101110000110")and (save_state = '0')then -- bits 15:0	fixed for ir "0110101110000110" bit 31:24 is inverse code 23:16 is the code for example on-off 0x12		  
      oturn_on <= '1';
      save_state <= '1';
      oturn_off <='0';
    elsif (coded_rx_ir = "11110000000011110110101110000110") and (save_state = '1') then --a 23:16 0x0f
      oenc <= '1';
    elsif (coded_rx_ir = "11101100000100110110101110000110") and (save_state = '1')then --b	23:16 0x13
      odec <= '1';
    elsif (coded_rx_ir = "11101000000101110110101110000110") and (save_state = '1')then --return	23:16 0x17
      oenc <= '0';
      odec <= '0';
    elsif (coded_rx_ir /= "11101101000100100110101110000110") then
      oturn_on <= '0';
      save_state <= '0';
      oenc <= '0';
      odec <= '0';
      oturn_off <='1';
    end if;
  end if;
end process;
END rtl;