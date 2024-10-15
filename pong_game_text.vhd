library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

entity pong_game_text is
   port(
      clk, reset: in std_logic;
      pixel_x, pixel_y: in std_logic_vector(9 downto 0);
      digit0, digit1: in std_logic_vector(3 downto 0);
      ball: in std_logic_vector(1 downto 0);
      text_on: out std_logic_vector(3 downto 0);
      text_rgb: out std_logic_vector(2 downto 0)
   );
end pong_game_text;


architecture arch of pong_game_text is
   signal pix_x, pix_y: unsigned(9 downto 0);
   signal rom_addr: std_logic_vector(10 downto 0);
   signal character_addr, character_addr_s, character_addr_l, character_addr_r,
          character_addr_o: std_logic_vector(6 downto 0);
   signal row_addr, row_addr_s, row_addr_l,row_addr_r,
          row_addr_o: std_logic_vector(3 downto 0);
   signal bit_addr, bit_addr_s, bit_addr_l,bit_addr_r,
          bit_addr_o: std_logic_vector(2 downto 0);
   signal font_word: std_logic_vector(7 downto 0);
   signal font_bit: std_logic;
   signal score_on, logo_on, rule_on, over_on: std_logic;
   signal rule_rom_addr: unsigned(5 downto 0);
   type rule_rom_type is array (0 to 63) of
       std_logic_vector (6 downto 0);
   -- rull text ROM definition
   constant RULE_ROM: rule_rom_type :=
(
      -- row 1
      "1010000", -- P
      "1110010", -- r
      "1100101", -- e
      "1110011", -- s
      "1110011", -- s
      "0000000", -- null
      "1110000", -- p
      "1100001", -- a
      "1100100", -- d
      "1100100", -- d
      "1101100", -- l
      "1100101", -- e
      "0000000", -- null
      "0000000", --null
      "0000000", -- null
      "0000000", --null
      -- row 2
     
      "1100010", -- b
      "1110101", -- u
      "1110100", -- t
      "1110100", -- t
      "1101111", -- o
      "1101110", -- n
      "1110011", -- s
      "0000000", -- null  
      "1110100", -- t
      "1101111", -- o
      "0000000", -- null
      "1110011", -- s
      "1110100", -- t
      "1100001", -- a
      "1110010", -- r
		"1110100", -- t
      -- row 3
      "0000000", -- 
      "0000000", -- 
      "0000000", -- 
      "0000000", -- 
      "0000000", -- 
      "0000000", -- 
      "0000000", --  
      "0000000", -- 
      "0000000", -- 
      "0000000", -- 
      "0000000", -- 
      "0000000", -- 
      "0000000", -- 
      "0000000", -- 
      "0000000", --
      "0000000", --
      -- row 4
      "0000000", -- 
      "0000000", -- 
      "0000000", --
      "0000000", -- 
      "0000000", -- 
      "0000000", -- 
      "0000000", --
      "0000000", -- 
      "0000000", -- 
      "0000000", -- 
      "0000000", -- 
      "0000000", -- 
      "0000000", --
      "0000000", --
      "0000000", --
      "0000000"  --
   );
   
begin
   pix_x <= unsigned(pixel_x);
   pix_y <= unsigned(pixel_y);
   -- instantiate font rom
   font_unit: entity work.font_rom
      port map(clk=>clk, addr=>rom_addr, data=>font_word);

   ---------------------------------------------
   -- score region
   --  - display two-digitit score, ball on top left
   --  - scale to 16-by-32 font
   --  - line 1, 16 characters: "Score:DD Ball:D"
   ---------------------------------------------
 score_on <=
      '1' when pix_y(9 downto 5)=0 and
               pix_x(9 downto 4)<16 else
      '0';
   row_addr_s <= std_logic_vector(pix_y(4 downto 1));
   bit_addr_s <= std_logic_vector(pix_x(3 downto 1));
   with pix_x(7 downto 4) select
     character_addr_s <=
        "1010011" when "1000", -- S
        "1100011" when "1001", -- c 
        "1101111" when "1010", -- o 
        "1110010" when "1011", -- r 
        "1100101" when "1100", -- e 
        "0111010" when "1101", -- : 
        "011" & digit1 when "1110", -- digit 10
        "011" & digit0 when "1111", -- digit 1
        "0000000" when "0110",
        "0000000" when "0111",
        "1000010" when "0000", -- B 
        "1100001" when "0001", -- a 
        "1101100" when "0010", -- l 
        "1101100" when "0011", -- l 
        "0111010" when "0100", -- :
        "01100" & ball when "0101";



   ---------------------------------------------
   -- logo region:

   ---------------------------------------------
   logo_on <=
      '1' when pix_y(9 downto 6) = 4 and
         ( 3<= pix_x(9 downto 5) and pix_x(9 downto 5) <= 13) else
      '0';
   row_addr_l <= std_logic_vector(pix_y(5 downto 2));
   bit_addr_l <= std_logic_vector(pix_x(4 downto 2));
  with pix_x(8 downto 5) select
  character_addr_l <=
     "1010000" when "0101", -- P x50
     "1001111" when "0110", -- O x4f
     "1001110" when "0111", -- N x4e
     "1000111" when "1000", -- G x47
     "0000000" when "1001", -- space
	  
	  "1000111" when "1010", -- G x47
     "1000001" when "1011", -- A
     "1001101" when "1100", -- M
     "1000101" when "1101", -- E
	 
	 
    "0000000" when others; -- space
   ---------------------------------------------
   -- rule region
   
   ---------------------------------------------
   rule_on <= '1' when pix_x(9 downto 7) = "010" and
                       pix_y(9 downto 6)=  "0010"  else
              '0';
   row_addr_r <= std_logic_vector(pix_y(3 downto 0));
   bit_addr_r <= std_logic_vector(pix_x(2 downto 0));
   rule_rom_addr <= pix_y(5 downto 4) & pix_x(6 downto 3);
   character_addr_r <= RULE_ROM(to_integer(rule_rom_addr));
   ---------------------------------------------
   -- game over region
   ---------------------------------------------
   over_on <=
      '1' when pix_y(9 downto 6)=3 and
         5<= pix_x(9 downto 5) and pix_x(9 downto 5)<=13 else
      '0';
   row_addr_o <= std_logic_vector(pix_y(5 downto 2));
   bit_addr_o <= std_logic_vector(pix_x(4 downto 2));
   with pix_x(8 downto 5) select
     character_addr_o <=
        "1000111" when "0101", -- G x47
        "1100001" when "0110", -- a x61
        "1101101" when "0111", -- m x6d
        "1100101" when "1000", -- e x65
        "0000000" when "1001", --
        "1001111" when "1010", -- O x4f
        "1110110" when "1011", -- v x76
        "1100101" when "1100", -- e x65
        "1110010" when others; -- r x72
   ---------------------------------------------
   -- mux for font ROM addresses and rgb
   ---------------------------------------------
   process(score_on,logo_on,rule_on,pix_x,pix_y,font_bit,
           character_addr_s,character_addr_l,character_addr_r,character_addr_o,
           row_addr_s,row_addr_l,row_addr_r,row_addr_o,
           bit_addr_s,bit_addr_l,bit_addr_r,bit_addr_o)
   begin
      text_rgb <= "110";  --
      if score_on='1' then
         character_addr <= character_addr_s;
         row_addr <= row_addr_s;
         bit_addr <= bit_addr_s;
         if font_bit='1' then
            text_rgb <= "001";
         end if;
      elsif rule_on='1' then
         character_addr <= character_addr_r;
         row_addr <= row_addr_r;
         bit_addr <= bit_addr_r;
         if font_bit='1' then
            text_rgb <= "001";
         end if;
      elsif logo_on='1' then
         character_addr <= character_addr_l;
         row_addr <= row_addr_l;
         bit_addr <= bit_addr_l;
         if font_bit='1' then
            text_rgb <= "011";
         end if;
      else -- game over
         character_addr <= character_addr_o;
         row_addr <= row_addr_o;
         bit_addr <= bit_addr_o;
         if font_bit='1' then
            text_rgb <= "001";
         end if;
      end if;
   end process;
   text_on <= score_on & logo_on & rule_on & over_on;
   ---------------------------------------------
   -- font rom interface
   ---------------------------------------------
   rom_addr <= character_addr & row_addr;
   font_bit <= font_word(to_integer(unsigned(not bit_addr)));
end arch;