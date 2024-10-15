library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ping_pong_tb is
end ping_pong_tb;

architecture sim of ping_pong_tb is
    -- Component declaration
    component ping_pong
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
    end component;

    -- Constants declaration 
    constant CLK_PERIOD : time := 10 ns;

    -- Signals declaration
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal paddle_up : std_logic := '0';
    signal paddle_down : std_logic := '0';
    signal ball_x : std_logic_vector(7 downto 0);
    signal ball_y : std_logic_vector(7 downto 0);
    signal ball_dx : std_logic_vector(2 downto 0);
    signal ball_dy : std_logic_vector(2 downto 0);
    signal score : std_logic_vector(7 downto 0);

begin
     -- unit under test instantiation
    uut: ping_pong
        port map (
            clk => clk,
            reset => reset,
            paddle_up => paddle_up,
            paddle_down => paddle_down,
            ball_x => ball_x,
            ball_y => ball_y,
            ball_dx => ball_dx,
            ball_dy => ball_dy,
            score => score
        );

    -- generation of clock
    clk_process: process
    begin
        while now < 1000 ns loop
            clk <= not clk;
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Reset 
    reset_process: process
    begin
        reset <= '1';
        wait for CLK_PERIOD * 2;
        reset <= '0';
        wait for CLK_PERIOD * 2;
        reset <= '1';
        wait for CLK_PERIOD * 2;
        reset <= '0';
        wait;
    end process;

    -- Paddle control process
    paddle_process: process
    begin
        wait for CLK_PERIOD * 2;
        paddle_up <= '1';
        wait for CLK_PERIOD * 4;
        paddle_up <= '0';
        wait for CLK_PERIOD * 2;
        paddle_down <= '1';
        wait for CLK_PERIOD * 4;
        paddle_down <= '0';
        wait;
    end process;

end sim;
