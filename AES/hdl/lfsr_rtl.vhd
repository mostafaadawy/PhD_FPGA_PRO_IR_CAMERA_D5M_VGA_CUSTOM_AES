LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Lfsr IS
   PORT( 
      clk     : IN     std_logic;
      en_set  : IN     std_logic;
      en      : IN     std_logic;
	  seed_gen: IN     std_logic_vector(0 to 7); 
      sel_out : OUT    std_logic_vector (0 TO 7)
   );
END Lfsr ;
ARCHITECTURE rtl OF Lfsr IS
   SIGNAL dv_s : std_logic := '0'; 
BEGIN
   process(clk,en_set)
   variable lfsr : std_logic_vector(0 to 7);
variable feed : std_logic := '1'; 
    begin
     if en_set='1' then
       lfsr :=seed_gen;
        feed := '0' ;
      dv_s <= '0';
     elsif clk'event and clk='1' then
            if en='1' then
             feed := lfsr(1) xor lfsr(2) xor lfsr(3)xor lfsr(7);
             lfsr :=  feed & lfsr(0 to 6);
           dv_s <= '1';
         else
            feed := feed;
            lfsr := lfsr;
            dv_s <= '0';
         end if;
     end if;
	   sel_out <= lfsr;
    end process;
END rtl;