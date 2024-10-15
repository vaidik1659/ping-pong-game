library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pong_game_counter is
   port(
      clk, reset: in std_logic;
      d_increment, d_clear: in std_logic;
      digit0,digit1: out std_logic_vector (3 downto 0)
   );
end pong_game_counter;


architecture arch of pong_game_counter is
   signal digit0_reg, digit1_reg: unsigned(3 downto 0);
   signal digit0_next, digit1_next: unsigned(3 downto 0);
begin
   -- registers
   process (clk,reset)
   begin
      if reset='1' then
         digit1_reg <= (others=>'0');
         digit0_reg <= (others=>'0');
      elsif (clk'event and clk='1') then
         digit1_reg <= digit1_next;
         digit0_reg <= digit0_next;
      end if;
   end process;
   -- LOGIC (next state) for the decimal counter
   process(d_clear,d_increment,digit1_reg,digit0_reg)
   begin
      digit0_next <= digit0_reg;
      digit1_next <= digit1_reg;
      if (d_clear='1') then
         digit0_next <= (others=>'0');
         digit1_next <= (others=>'0');
      elsif (d_increment='1') then
         if digit0_reg=9 then
            digit0_next <= (others=>'0');
            if digit1_reg=9 then -- 10th digitit
               digit1_next <= (others=>'0');
            else
               digit1_next <= digit1_reg + 1;
            end if;
         else -- digit (0 not 9)
            digit0_next <= digit0_reg + 1;
         end if;
      end if;
   end process;
   digit0 <= std_logic_vector(digit0_reg);
   digit1 <= std_logic_vector(digit1_reg);
end arch;