
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY expander IS
   PORT( 
      Chipher_D_Rdy : IN     std_logic;
      clk           : IN     std_logic;
      en            : IN     std_logic;
      cipher_rdy    : OUT    std_logic
   );

-- Declarations

END expander ;

-- hds interface_end
ARCHITECTURE rtl OF expander IS
signal cnt : unsigned(3 downto 0);
signal tmp : std_logic;
BEGIN
process(clk,en,Chipher_D_Rdy)
begin
		if (rising_edge(clk))then
				if(en ='0') then
				tmp <= '0';
				cnt <= (others=>'0');
				else
					if(Chipher_D_Rdy = '1')then
					   	tmp <= '1';
						cnt <= "0100";
					elsif (cnt>=1) then	
						cnt <= cnt-1;
					else
						cnt <= (others=>'0');
						tmp <= '0';
					end if;
				end if;
		end if;
end process;
cipher_rdy <= tmp;
END rtl;
