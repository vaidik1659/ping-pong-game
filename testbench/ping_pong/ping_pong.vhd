library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ping_pong is
    port (
        clk : in std_logic;
        reset : in std_logic;
        paddle_up : in std_logic;
        paddle_down : in std_logic;
        ball_x : out std_logic_vector(7 downto 0);
        ball_y : out std_logic_vector(7 downto 0);
        ball_dx : inout std_logic_vector(2 downto 0);
        ball_dy : inout std_logic_vector(2 downto 0);
        score : out std_logic_vector(7 downto 0)
    );
end ping_pong;

architecture Behavioral of ping_pong is
    -- Constants declaration
    constant PADDLE_HEIGHT : integer := 16;
    constant PADDLE_WIDTH : integer := 4;
    constant BALL_SIZE : integer := 4;
    constant SCREEN_HEIGHT : integer := 200;
    constant SCREEN_WIDTH : integer := 320;
   
	-- Signals declaration
    signal paddle_y : integer range 0 to SCREEN_HEIGHT - PADDLE_HEIGHT := (SCREEN_HEIGHT - PADDLE_HEIGHT) / 2;
    signal ball_x_internal : integer range 0 to SCREEN_WIDTH - BALL_SIZE := SCREEN_WIDTH / 2;
    signal ball_y_internal : integer range 0 to SCREEN_HEIGHT - BALL_SIZE := SCREEN_HEIGHT / 2;
    signal score_internal : integer range 0 to 99 := 0;
begin
    -- paddle position update
    process (clk)
    begin
        if rising_edge(clk) then
            if paddle_up = '1' and paddle_down = '0' then
                paddle_y <= paddle_y - 1;
            elsif paddle_up = '0' and paddle_down = '1' then
                paddle_y <= paddle_y + 1;
            end if;
        end if;
    end process;
    
    -- ball position update
	 -- check for collision with walls and paddle

	 process (clk)
begin
    if rising_edge(clk) then
       
		 --  ball position update
        ball_x_internal <= ball_x_internal + to_integer(unsigned(ball_dx));
        ball_y_internal <= ball_y_internal + to_integer(unsigned(ball_dy));

        -- Check collision with walls (top or bottom)
        if ball_y_internal < 0 or ball_y_internal >= SCREEN_HEIGHT - BALL_SIZE then
            ball_dy <= not ball_dy;
        end if;

        -- Check collision with paddle
        if ball_x_internal = PADDLE_WIDTH and ball_y_internal >= paddle_y and ball_y_internal < paddle_y + PADDLE_HEIGHT then
            ball_dx <= not ball_dx;
            score_internal <= score_internal + 1;
        end if;

        -- Score update
        if ball_x_internal < 0 then
            ball_x_internal <= SCREEN_WIDTH / 2;
            ball_y_internal <= SCREEN_HEIGHT / 2;
            ball_dx <= not ball_dx;
            score_internal <= score_internal - 1;
        end if;
    end if;
end process;

-- Output signals declaration
    ball_x <= std_logic_vector(to_unsigned(ball_x_internal, ball_x'length));
    ball_y <= std_logic_vector(to_unsigned(ball_y_internal, ball_y'length));
    score <= std_logic_vector(to_unsigned(score_internal, score'length));
    
end Behavioral;
