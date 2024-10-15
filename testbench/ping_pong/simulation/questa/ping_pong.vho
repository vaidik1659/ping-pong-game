-- Copyright (C) 2022  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 22.1std.0 Build 915 10/25/2022 SC Lite Edition"

-- DATE "04/02/2023 02:40:58"

-- 
-- Device: Altera 5CSXFC6D6F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ping_pong IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	paddle_up : IN std_logic;
	paddle_down : IN std_logic;
	ball_x : BUFFER std_logic_vector(7 DOWNTO 0);
	ball_y : BUFFER std_logic_vector(7 DOWNTO 0);
	ball_dx : BUFFER std_logic_vector(2 DOWNTO 0);
	ball_dy : BUFFER std_logic_vector(2 DOWNTO 0);
	score : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END ping_pong;

-- Design Ports Information
-- reset	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_x[0]	=>  Location: PIN_AJ27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_x[1]	=>  Location: PIN_AK29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_x[2]	=>  Location: PIN_AG25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_x[3]	=>  Location: PIN_AE23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_x[4]	=>  Location: PIN_AH25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_x[5]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_x[6]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_x[7]	=>  Location: PIN_AK28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_y[0]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_y[1]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_y[2]	=>  Location: PIN_W20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_y[3]	=>  Location: PIN_AJ29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_y[4]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_y[5]	=>  Location: PIN_AH28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_y[6]	=>  Location: PIN_AD25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_y[7]	=>  Location: PIN_AG27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- score[0]	=>  Location: PIN_AC23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- score[1]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- score[2]	=>  Location: PIN_AF26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- score[3]	=>  Location: PIN_AF25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- score[4]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- score[5]	=>  Location: PIN_AC22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- score[6]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- score[7]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_dx[0]	=>  Location: PIN_AD20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_dx[1]	=>  Location: PIN_AK27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_dx[2]	=>  Location: PIN_AD21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_dy[0]	=>  Location: PIN_AH29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_dy[1]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ball_dy[2]	=>  Location: PIN_AG26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- paddle_down	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- paddle_up	=>  Location: PIN_AH27,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ping_pong IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_paddle_up : std_logic;
SIGNAL ww_paddle_down : std_logic;
SIGNAL ww_ball_x : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_ball_y : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_ball_dx : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_ball_dy : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_score : std_logic_vector(7 DOWNTO 0);
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \ball_dx[0]~input_o\ : std_logic;
SIGNAL \ball_dx[1]~input_o\ : std_logic;
SIGNAL \ball_dx[2]~input_o\ : std_logic;
SIGNAL \ball_dy[0]~input_o\ : std_logic;
SIGNAL \ball_dy[1]~input_o\ : std_logic;
SIGNAL \ball_dy[2]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \paddle_up~input_o\ : std_logic;
SIGNAL \paddle_down~input_o\ : std_logic;
SIGNAL \Add1~13_sumout\ : std_logic;
SIGNAL \paddle_y~0_combout\ : std_logic;
SIGNAL \Add1~14\ : std_logic;
SIGNAL \Add1~9_sumout\ : std_logic;
SIGNAL \Add1~10\ : std_logic;
SIGNAL \Add1~5_sumout\ : std_logic;
SIGNAL \paddle_y[2]~2_combout\ : std_logic;
SIGNAL \Add1~6\ : std_logic;
SIGNAL \Add1~1_sumout\ : std_logic;
SIGNAL \paddle_y[3]~1_combout\ : std_logic;
SIGNAL \Add1~2\ : std_logic;
SIGNAL \Add1~17_sumout\ : std_logic;
SIGNAL \paddle_y[4]~3_combout\ : std_logic;
SIGNAL \Add3~18\ : std_logic;
SIGNAL \Add3~21_sumout\ : std_logic;
SIGNAL \ball_y_internal[5]~1_combout\ : std_logic;
SIGNAL \Add3~22\ : std_logic;
SIGNAL \Add3~25_sumout\ : std_logic;
SIGNAL \ball_y_internal[6]~2_combout\ : std_logic;
SIGNAL \ball_y_internal[6]~DUPLICATE_q\ : std_logic;
SIGNAL \Add3~26\ : std_logic;
SIGNAL \Add3~29_sumout\ : std_logic;
SIGNAL \ball_y_internal[7]~DUPLICATE_q\ : std_logic;
SIGNAL \ball_dy[1]~reg0_q\ : std_logic;
SIGNAL \ball_dy~7_combout\ : std_logic;
SIGNAL \ball_dy[1]~reg0DUPLICATE_q\ : std_logic;
SIGNAL \ball_dy~6_combout\ : std_logic;
SIGNAL \ball_dy[0]~reg0_q\ : std_logic;
SIGNAL \Add3~1_sumout\ : std_logic;
SIGNAL \Add3~2\ : std_logic;
SIGNAL \Add3~5_sumout\ : std_logic;
SIGNAL \Add3~6\ : std_logic;
SIGNAL \Add3~9_sumout\ : std_logic;
SIGNAL \ball_y_internal[2]~0_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \ball_dy~8_combout\ : std_logic;
SIGNAL \ball_dy[2]~reg0_q\ : std_logic;
SIGNAL \Add3~10\ : std_logic;
SIGNAL \Add3~13_sumout\ : std_logic;
SIGNAL \Add3~14\ : std_logic;
SIGNAL \Add3~17_sumout\ : std_logic;
SIGNAL \Add1~18\ : std_logic;
SIGNAL \Add1~21_sumout\ : std_logic;
SIGNAL \Add1~22\ : std_logic;
SIGNAL \Add1~29_sumout\ : std_logic;
SIGNAL \paddle_y[6]~4_combout\ : std_logic;
SIGNAL \Add1~30\ : std_logic;
SIGNAL \Add1~25_sumout\ : std_logic;
SIGNAL \ball_y_internal[5]~DUPLICATE_q\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \LessThan2~1_combout\ : std_logic;
SIGNAL \LessThan3~2_combout\ : std_logic;
SIGNAL \LessThan3~3_combout\ : std_logic;
SIGNAL \LessThan3~4_combout\ : std_logic;
SIGNAL \LessThan3~5_combout\ : std_logic;
SIGNAL \LessThan3~0_combout\ : std_logic;
SIGNAL \LessThan3~1_combout\ : std_logic;
SIGNAL \ball_dx~8_combout\ : std_logic;
SIGNAL \ball_dx[2]~reg0_q\ : std_logic;
SIGNAL \ball_dx~7_combout\ : std_logic;
SIGNAL \ball_dx[1]~reg0_q\ : std_logic;
SIGNAL \Add2~1_sumout\ : std_logic;
SIGNAL \Add2~2\ : std_logic;
SIGNAL \Add2~5_sumout\ : std_logic;
SIGNAL \Add2~6\ : std_logic;
SIGNAL \Add2~9_sumout\ : std_logic;
SIGNAL \Add2~10\ : std_logic;
SIGNAL \Add2~13_sumout\ : std_logic;
SIGNAL \Add2~14\ : std_logic;
SIGNAL \Add2~17_sumout\ : std_logic;
SIGNAL \Add2~18\ : std_logic;
SIGNAL \Add2~21_sumout\ : std_logic;
SIGNAL \ball_x_internal[5]~0_combout\ : std_logic;
SIGNAL \ball_x_internal[5]~DUPLICATE_q\ : std_logic;
SIGNAL \Add2~22\ : std_logic;
SIGNAL \Add2~25_sumout\ : std_logic;
SIGNAL \Add2~26\ : std_logic;
SIGNAL \Add2~29_sumout\ : std_logic;
SIGNAL \ball_x_internal[7]~1_combout\ : std_logic;
SIGNAL \ball_x_internal[7]~DUPLICATE_q\ : std_logic;
SIGNAL \Add2~30\ : std_logic;
SIGNAL \Add2~33_sumout\ : std_logic;
SIGNAL \process_1~0_combout\ : std_logic;
SIGNAL \process_1~2_combout\ : std_logic;
SIGNAL \process_1~1_combout\ : std_logic;
SIGNAL \process_1~3_combout\ : std_logic;
SIGNAL \ball_dx~6_combout\ : std_logic;
SIGNAL \ball_dx[0]~reg0_q\ : std_logic;
SIGNAL \ball_y_internal[0]~DUPLICATE_q\ : std_logic;
SIGNAL \Add5~1_sumout\ : std_logic;
SIGNAL \process_1~4_combout\ : std_logic;
SIGNAL \Add5~2\ : std_logic;
SIGNAL \Add5~5_sumout\ : std_logic;
SIGNAL \Add5~6\ : std_logic;
SIGNAL \Add5~9_sumout\ : std_logic;
SIGNAL \Add5~10\ : std_logic;
SIGNAL \Add5~13_sumout\ : std_logic;
SIGNAL \Add5~14\ : std_logic;
SIGNAL \Add5~17_sumout\ : std_logic;
SIGNAL \Add5~18\ : std_logic;
SIGNAL \Add5~21_sumout\ : std_logic;
SIGNAL \Add5~22\ : std_logic;
SIGNAL \Add5~25_sumout\ : std_logic;
SIGNAL ball_x_internal : std_logic_vector(8 DOWNTO 0);
SIGNAL ball_y_internal : std_logic_vector(7 DOWNTO 0);
SIGNAL score_internal : std_logic_vector(6 DOWNTO 0);
SIGNAL paddle_y : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_ball_dy[1]~reg0DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_ball_y_internal[7]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_ball_y_internal[6]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_ball_y_internal[5]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_ball_x_internal[7]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_ball_x_internal[5]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_paddle_up~input_o\ : std_logic;
SIGNAL \ALT_INV_paddle_down~input_o\ : std_logic;
SIGNAL \ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \ALT_INV_ball_dy[2]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_ball_dy[1]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_ball_dy[0]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_ball_dx[2]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_ball_dx[1]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_ball_dx[0]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_process_1~3_combout\ : std_logic;
SIGNAL \ALT_INV_process_1~2_combout\ : std_logic;
SIGNAL \ALT_INV_process_1~1_combout\ : std_logic;
SIGNAL \ALT_INV_process_1~0_combout\ : std_logic;
SIGNAL ALT_INV_ball_x_internal : std_logic_vector(8 DOWNTO 0);
SIGNAL \ALT_INV_LessThan2~1_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan2~0_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan3~5_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan3~4_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan3~3_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan3~2_combout\ : std_logic;
SIGNAL ALT_INV_paddle_y : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_LessThan3~1_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan3~0_combout\ : std_logic;
SIGNAL ALT_INV_score_internal : std_logic_vector(6 DOWNTO 0);
SIGNAL ALT_INV_ball_y_internal : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_Add1~29_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~1_sumout\ : std_logic;
SIGNAL \ALT_INV_Add3~25_sumout\ : std_logic;
SIGNAL \ALT_INV_Add3~21_sumout\ : std_logic;
SIGNAL \ALT_INV_Add3~9_sumout\ : std_logic;
SIGNAL \ALT_INV_Add2~29_sumout\ : std_logic;
SIGNAL \ALT_INV_Add2~21_sumout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_paddle_up <= paddle_up;
ww_paddle_down <= paddle_down;
ball_x <= ww_ball_x;
ball_y <= ww_ball_y;
ball_dx <= ww_ball_dx;
ball_dy <= ww_ball_dy;
score <= ww_score;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_ball_dy[1]~reg0DUPLICATE_q\ <= NOT \ball_dy[1]~reg0DUPLICATE_q\;
\ALT_INV_ball_y_internal[7]~DUPLICATE_q\ <= NOT \ball_y_internal[7]~DUPLICATE_q\;
\ALT_INV_ball_y_internal[6]~DUPLICATE_q\ <= NOT \ball_y_internal[6]~DUPLICATE_q\;
\ALT_INV_ball_y_internal[5]~DUPLICATE_q\ <= NOT \ball_y_internal[5]~DUPLICATE_q\;
\ALT_INV_ball_x_internal[7]~DUPLICATE_q\ <= NOT \ball_x_internal[7]~DUPLICATE_q\;
\ALT_INV_ball_x_internal[5]~DUPLICATE_q\ <= NOT \ball_x_internal[5]~DUPLICATE_q\;
\ALT_INV_paddle_up~input_o\ <= NOT \paddle_up~input_o\;
\ALT_INV_paddle_down~input_o\ <= NOT \paddle_down~input_o\;
\ALT_INV_LessThan1~0_combout\ <= NOT \LessThan1~0_combout\;
\ALT_INV_ball_dy[2]~reg0_q\ <= NOT \ball_dy[2]~reg0_q\;
\ALT_INV_ball_dy[1]~reg0_q\ <= NOT \ball_dy[1]~reg0_q\;
\ALT_INV_ball_dy[0]~reg0_q\ <= NOT \ball_dy[0]~reg0_q\;
\ALT_INV_ball_dx[2]~reg0_q\ <= NOT \ball_dx[2]~reg0_q\;
\ALT_INV_ball_dx[1]~reg0_q\ <= NOT \ball_dx[1]~reg0_q\;
\ALT_INV_ball_dx[0]~reg0_q\ <= NOT \ball_dx[0]~reg0_q\;
\ALT_INV_process_1~3_combout\ <= NOT \process_1~3_combout\;
\ALT_INV_process_1~2_combout\ <= NOT \process_1~2_combout\;
\ALT_INV_process_1~1_combout\ <= NOT \process_1~1_combout\;
\ALT_INV_process_1~0_combout\ <= NOT \process_1~0_combout\;
ALT_INV_ball_x_internal(8) <= NOT ball_x_internal(8);
\ALT_INV_LessThan2~1_combout\ <= NOT \LessThan2~1_combout\;
\ALT_INV_LessThan2~0_combout\ <= NOT \LessThan2~0_combout\;
\ALT_INV_LessThan3~5_combout\ <= NOT \LessThan3~5_combout\;
\ALT_INV_LessThan3~4_combout\ <= NOT \LessThan3~4_combout\;
\ALT_INV_LessThan3~3_combout\ <= NOT \LessThan3~3_combout\;
\ALT_INV_LessThan3~2_combout\ <= NOT \LessThan3~2_combout\;
ALT_INV_paddle_y(6) <= NOT paddle_y(6);
ALT_INV_paddle_y(7) <= NOT paddle_y(7);
ALT_INV_paddle_y(5) <= NOT paddle_y(5);
ALT_INV_paddle_y(4) <= NOT paddle_y(4);
\ALT_INV_LessThan3~1_combout\ <= NOT \LessThan3~1_combout\;
\ALT_INV_LessThan3~0_combout\ <= NOT \LessThan3~0_combout\;
ALT_INV_paddle_y(0) <= NOT paddle_y(0);
ALT_INV_paddle_y(1) <= NOT paddle_y(1);
ALT_INV_paddle_y(2) <= NOT paddle_y(2);
ALT_INV_paddle_y(3) <= NOT paddle_y(3);
ALT_INV_score_internal(6) <= NOT score_internal(6);
ALT_INV_score_internal(5) <= NOT score_internal(5);
ALT_INV_score_internal(4) <= NOT score_internal(4);
ALT_INV_score_internal(3) <= NOT score_internal(3);
ALT_INV_score_internal(2) <= NOT score_internal(2);
ALT_INV_score_internal(1) <= NOT score_internal(1);
ALT_INV_score_internal(0) <= NOT score_internal(0);
ALT_INV_ball_y_internal(7) <= NOT ball_y_internal(7);
ALT_INV_ball_y_internal(6) <= NOT ball_y_internal(6);
ALT_INV_ball_y_internal(5) <= NOT ball_y_internal(5);
ALT_INV_ball_y_internal(4) <= NOT ball_y_internal(4);
ALT_INV_ball_y_internal(3) <= NOT ball_y_internal(3);
ALT_INV_ball_y_internal(2) <= NOT ball_y_internal(2);
ALT_INV_ball_y_internal(1) <= NOT ball_y_internal(1);
ALT_INV_ball_y_internal(0) <= NOT ball_y_internal(0);
ALT_INV_ball_x_internal(7) <= NOT ball_x_internal(7);
ALT_INV_ball_x_internal(6) <= NOT ball_x_internal(6);
ALT_INV_ball_x_internal(5) <= NOT ball_x_internal(5);
ALT_INV_ball_x_internal(4) <= NOT ball_x_internal(4);
ALT_INV_ball_x_internal(3) <= NOT ball_x_internal(3);
ALT_INV_ball_x_internal(2) <= NOT ball_x_internal(2);
ALT_INV_ball_x_internal(1) <= NOT ball_x_internal(1);
ALT_INV_ball_x_internal(0) <= NOT ball_x_internal(0);
\ALT_INV_Add1~29_sumout\ <= NOT \Add1~29_sumout\;
\ALT_INV_Add1~17_sumout\ <= NOT \Add1~17_sumout\;
\ALT_INV_Add1~5_sumout\ <= NOT \Add1~5_sumout\;
\ALT_INV_Add1~1_sumout\ <= NOT \Add1~1_sumout\;
\ALT_INV_Add3~25_sumout\ <= NOT \Add3~25_sumout\;
\ALT_INV_Add3~21_sumout\ <= NOT \Add3~21_sumout\;
\ALT_INV_Add3~9_sumout\ <= NOT \Add3~9_sumout\;
\ALT_INV_Add2~29_sumout\ <= NOT \Add2~29_sumout\;
\ALT_INV_Add2~21_sumout\ <= NOT \Add2~21_sumout\;

-- Location: IOOBUF_X80_Y0_N36
\ball_x[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ball_x_internal(0),
	devoe => ww_devoe,
	o => ww_ball_x(0));

-- Location: IOOBUF_X82_Y0_N93
\ball_x[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ball_x_internal(1),
	devoe => ww_devoe,
	o => ww_ball_x(1));

-- Location: IOOBUF_X78_Y0_N36
\ball_x[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ball_x_internal(2),
	devoe => ww_devoe,
	o => ww_ball_x(2));

-- Location: IOOBUF_X78_Y0_N19
\ball_x[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ball_x_internal(3),
	devoe => ww_devoe,
	o => ww_ball_x(3));

-- Location: IOOBUF_X78_Y0_N53
\ball_x[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ball_x_internal(4),
	devoe => ww_devoe,
	o => ww_ball_x(4));

-- Location: IOOBUF_X80_Y0_N19
\ball_x[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_ball_x_internal[5]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_ball_x(5));

-- Location: IOOBUF_X84_Y0_N19
\ball_x[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ball_x_internal(6),
	devoe => ww_devoe,
	o => ww_ball_x(6));

-- Location: IOOBUF_X82_Y0_N76
\ball_x[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_ball_x_internal(7),
	devoe => ww_devoe,
	o => ww_ball_x(7));

-- Location: IOOBUF_X88_Y0_N37
\ball_y[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ball_y_internal[0]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_ball_y(0));

-- Location: IOOBUF_X89_Y8_N56
\ball_y[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ball_y_internal(1),
	devoe => ww_devoe,
	o => ww_ball_y(1));

-- Location: IOOBUF_X89_Y6_N5
\ball_y[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_ball_y_internal(2),
	devoe => ww_devoe,
	o => ww_ball_y(2));

-- Location: IOOBUF_X89_Y6_N39
\ball_y[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ball_y_internal(3),
	devoe => ww_devoe,
	o => ww_ball_y(3));

-- Location: IOOBUF_X89_Y4_N62
\ball_y[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ball_y_internal(4),
	devoe => ww_devoe,
	o => ww_ball_y(4));

-- Location: IOOBUF_X89_Y4_N96
\ball_y[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_ball_y_internal[5]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_ball_y(5));

-- Location: IOOBUF_X89_Y4_N45
\ball_y[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_ball_y_internal[6]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_ball_y(6));

-- Location: IOOBUF_X89_Y4_N79
\ball_y[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ball_y_internal(7),
	devoe => ww_devoe,
	o => ww_ball_y(7));

-- Location: IOOBUF_X86_Y0_N19
\score[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => score_internal(0),
	devoe => ww_devoe,
	o => ww_score(0));

-- Location: IOOBUF_X89_Y8_N22
\score[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => score_internal(1),
	devoe => ww_devoe,
	o => ww_score(1));

-- Location: IOOBUF_X86_Y0_N53
\score[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => score_internal(2),
	devoe => ww_devoe,
	o => ww_score(2));

-- Location: IOOBUF_X86_Y0_N36
\score[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => score_internal(3),
	devoe => ww_devoe,
	o => ww_score(3));

-- Location: IOOBUF_X80_Y0_N2
\score[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => score_internal(4),
	devoe => ww_devoe,
	o => ww_score(4));

-- Location: IOOBUF_X86_Y0_N2
\score[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => score_internal(5),
	devoe => ww_devoe,
	o => ww_score(5));

-- Location: IOOBUF_X89_Y8_N5
\score[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => score_internal(6),
	devoe => ww_devoe,
	o => ww_score(6));

-- Location: IOOBUF_X34_Y81_N76
\score[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_score(7));

-- Location: IOOBUF_X82_Y0_N42
\ball_dx[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ball_dx[0]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_ball_dx(0));

-- Location: IOOBUF_X80_Y0_N53
\ball_dx[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ball_dx[1]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_ball_dx(1));

-- Location: IOOBUF_X82_Y0_N59
\ball_dx[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ball_dx[2]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_ball_dx(2));

-- Location: IOOBUF_X89_Y6_N56
\ball_dy[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ball_dy[0]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_ball_dy(0));

-- Location: IOOBUF_X89_Y6_N22
\ball_dy[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ball_dy[1]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_ball_dy(1));

-- Location: IOOBUF_X84_Y0_N36
\ball_dy[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ball_dy[2]~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_ball_dy(2));

-- Location: IOIBUF_X89_Y25_N21
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X84_Y0_N52
\paddle_up~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_paddle_up,
	o => \paddle_up~input_o\);

-- Location: IOIBUF_X84_Y0_N1
\paddle_down~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_paddle_down,
	o => \paddle_down~input_o\);

-- Location: MLABCELL_X84_Y4_N30
\Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~13_sumout\ = SUM(( paddle_y(0) ) + ( VCC ) + ( !VCC ))
-- \Add1~14\ = CARRY(( paddle_y(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_paddle_y(0),
	cin => GND,
	sumout => \Add1~13_sumout\,
	cout => \Add1~14\);

-- Location: LABCELL_X85_Y4_N9
\paddle_y~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \paddle_y~0_combout\ = !\paddle_up~input_o\ $ (!\paddle_down~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010010110100101101001011010010110100101101001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_paddle_up~input_o\,
	datac => \ALT_INV_paddle_down~input_o\,
	combout => \paddle_y~0_combout\);

-- Location: FF_X85_Y4_N59
\paddle_y[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Add1~13_sumout\,
	sload => VCC,
	ena => \paddle_y~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => paddle_y(0));

-- Location: MLABCELL_X84_Y4_N33
\Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~9_sumout\ = SUM(( paddle_y(1) ) + ( (\paddle_up~input_o\ & !\paddle_down~input_o\) ) + ( \Add1~14\ ))
-- \Add1~10\ = CARRY(( paddle_y(1) ) + ( (\paddle_up~input_o\ & !\paddle_down~input_o\) ) + ( \Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101011111010111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_paddle_up~input_o\,
	datac => \ALT_INV_paddle_down~input_o\,
	datad => ALT_INV_paddle_y(1),
	cin => \Add1~14\,
	sumout => \Add1~9_sumout\,
	cout => \Add1~10\);

-- Location: FF_X84_Y4_N34
\paddle_y[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add1~9_sumout\,
	ena => \paddle_y~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => paddle_y(1));

-- Location: MLABCELL_X84_Y4_N36
\Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~5_sumout\ = SUM(( !paddle_y(2) ) + ( (!\paddle_down~input_o\ & \paddle_up~input_o\) ) + ( \Add1~10\ ))
-- \Add1~6\ = CARRY(( !paddle_y(2) ) + ( (!\paddle_down~input_o\ & \paddle_up~input_o\) ) + ( \Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100111111001100000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_paddle_down~input_o\,
	datac => \ALT_INV_paddle_up~input_o\,
	datad => ALT_INV_paddle_y(2),
	cin => \Add1~10\,
	sumout => \Add1~5_sumout\,
	cout => \Add1~6\);

-- Location: LABCELL_X85_Y4_N15
\paddle_y[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \paddle_y[2]~2_combout\ = ( !\Add1~5_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add1~5_sumout\,
	combout => \paddle_y[2]~2_combout\);

-- Location: FF_X85_Y4_N17
\paddle_y[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \paddle_y[2]~2_combout\,
	ena => \paddle_y~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => paddle_y(2));

-- Location: MLABCELL_X84_Y4_N39
\Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~1_sumout\ = SUM(( (!\paddle_down~input_o\ & \paddle_up~input_o\) ) + ( !paddle_y(3) ) + ( \Add1~6\ ))
-- \Add1~2\ = CARRY(( (!\paddle_down~input_o\ & \paddle_up~input_o\) ) + ( !paddle_y(3) ) + ( \Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101010101010100000000000000000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_paddle_y(3),
	datab => \ALT_INV_paddle_down~input_o\,
	datad => \ALT_INV_paddle_up~input_o\,
	cin => \Add1~6\,
	sumout => \Add1~1_sumout\,
	cout => \Add1~2\);

-- Location: LABCELL_X85_Y4_N6
\paddle_y[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \paddle_y[3]~1_combout\ = ( !\Add1~1_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add1~1_sumout\,
	combout => \paddle_y[3]~1_combout\);

-- Location: FF_X85_Y4_N8
\paddle_y[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \paddle_y[3]~1_combout\,
	ena => \paddle_y~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => paddle_y(3));

-- Location: MLABCELL_X84_Y4_N42
\Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~17_sumout\ = SUM(( !paddle_y(4) ) + ( (\paddle_up~input_o\ & !\paddle_down~input_o\) ) + ( \Add1~2\ ))
-- \Add1~18\ = CARRY(( !paddle_y(4) ) + ( (\paddle_up~input_o\ & !\paddle_down~input_o\) ) + ( \Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101110111011101100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_paddle_up~input_o\,
	datab => \ALT_INV_paddle_down~input_o\,
	datac => ALT_INV_paddle_y(4),
	cin => \Add1~2\,
	sumout => \Add1~17_sumout\,
	cout => \Add1~18\);

-- Location: MLABCELL_X84_Y4_N6
\paddle_y[4]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \paddle_y[4]~3_combout\ = ( !\Add1~17_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add1~17_sumout\,
	combout => \paddle_y[4]~3_combout\);

-- Location: FF_X84_Y4_N8
\paddle_y[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \paddle_y[4]~3_combout\,
	ena => \paddle_y~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => paddle_y(4));

-- Location: LABCELL_X85_Y4_N42
\Add3~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~17_sumout\ = SUM(( ball_y_internal(4) ) + ( GND ) + ( \Add3~14\ ))
-- \Add3~18\ = CARRY(( ball_y_internal(4) ) + ( GND ) + ( \Add3~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_ball_y_internal(4),
	cin => \Add3~14\,
	sumout => \Add3~17_sumout\,
	cout => \Add3~18\);

-- Location: LABCELL_X85_Y4_N45
\Add3~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~21_sumout\ = SUM(( !ball_y_internal(5) ) + ( GND ) + ( \Add3~18\ ))
-- \Add3~22\ = CARRY(( !ball_y_internal(5) ) + ( GND ) + ( \Add3~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ball_y_internal(5),
	cin => \Add3~18\,
	sumout => \Add3~21_sumout\,
	cout => \Add3~22\);

-- Location: MLABCELL_X84_Y4_N57
\ball_y_internal[5]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ball_y_internal[5]~1_combout\ = ( !\Add3~21_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add3~21_sumout\,
	combout => \ball_y_internal[5]~1_combout\);

-- Location: FF_X84_Y4_N58
\ball_y_internal[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ball_y_internal[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ball_y_internal(5));

-- Location: LABCELL_X85_Y4_N48
\Add3~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~25_sumout\ = SUM(( !\ball_y_internal[6]~DUPLICATE_q\ ) + ( GND ) + ( \Add3~22\ ))
-- \Add3~26\ = CARRY(( !\ball_y_internal[6]~DUPLICATE_q\ ) + ( GND ) + ( \Add3~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ball_y_internal[6]~DUPLICATE_q\,
	cin => \Add3~22\,
	sumout => \Add3~25_sumout\,
	cout => \Add3~26\);

-- Location: LABCELL_X85_Y4_N18
\ball_y_internal[6]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ball_y_internal[6]~2_combout\ = ( !\Add3~25_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add3~25_sumout\,
	combout => \ball_y_internal[6]~2_combout\);

-- Location: FF_X85_Y4_N20
\ball_y_internal[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ball_y_internal[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ball_y_internal[6]~DUPLICATE_q\);

-- Location: FF_X85_Y4_N52
\ball_y_internal[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add3~29_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ball_y_internal(7));

-- Location: LABCELL_X85_Y4_N51
\Add3~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~29_sumout\ = SUM(( ball_y_internal(7) ) + ( GND ) + ( \Add3~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_ball_y_internal(7),
	cin => \Add3~26\,
	sumout => \Add3~29_sumout\);

-- Location: FF_X85_Y4_N53
\ball_y_internal[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add3~29_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ball_y_internal[7]~DUPLICATE_q\);

-- Location: FF_X87_Y4_N8
\ball_dy[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ball_dy~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ball_dy[1]~reg0_q\);

-- Location: MLABCELL_X87_Y4_N6
\ball_dy~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \ball_dy~7_combout\ = ( !\ball_dy[1]~reg0_q\ & ( \LessThan1~0_combout\ ) ) # ( \ball_dy[1]~reg0_q\ & ( !\LessThan1~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_ball_dy[1]~reg0_q\,
	dataf => \ALT_INV_LessThan1~0_combout\,
	combout => \ball_dy~7_combout\);

-- Location: FF_X87_Y4_N7
\ball_dy[1]~reg0DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ball_dy~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ball_dy[1]~reg0DUPLICATE_q\);

-- Location: LABCELL_X85_Y4_N0
\ball_dy~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ball_dy~6_combout\ = ( \LessThan1~0_combout\ & ( !\ball_dy[0]~reg0_q\ ) ) # ( !\LessThan1~0_combout\ & ( \ball_dy[0]~reg0_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_ball_dy[0]~reg0_q\,
	dataf => \ALT_INV_LessThan1~0_combout\,
	combout => \ball_dy~6_combout\);

-- Location: FF_X85_Y4_N1
\ball_dy[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ball_dy~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ball_dy[0]~reg0_q\);

-- Location: LABCELL_X85_Y4_N30
\Add3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~1_sumout\ = SUM(( ball_y_internal(0) ) + ( \ball_dy[0]~reg0_q\ ) + ( !VCC ))
-- \Add3~2\ = CARRY(( ball_y_internal(0) ) + ( \ball_dy[0]~reg0_q\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ball_dy[0]~reg0_q\,
	datad => ALT_INV_ball_y_internal(0),
	cin => GND,
	sumout => \Add3~1_sumout\,
	cout => \Add3~2\);

-- Location: FF_X85_Y4_N32
\ball_y_internal[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add3~1_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ball_y_internal(0));

-- Location: LABCELL_X85_Y4_N33
\Add3~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~5_sumout\ = SUM(( ball_y_internal(1) ) + ( \ball_dy[1]~reg0DUPLICATE_q\ ) + ( \Add3~2\ ))
-- \Add3~6\ = CARRY(( ball_y_internal(1) ) + ( \ball_dy[1]~reg0DUPLICATE_q\ ) + ( \Add3~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ball_dy[1]~reg0DUPLICATE_q\,
	datad => ALT_INV_ball_y_internal(1),
	cin => \Add3~2\,
	sumout => \Add3~5_sumout\,
	cout => \Add3~6\);

-- Location: FF_X85_Y4_N35
\ball_y_internal[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add3~5_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ball_y_internal(1));

-- Location: LABCELL_X85_Y4_N36
\Add3~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~9_sumout\ = SUM(( !ball_y_internal(2) ) + ( \ball_dy[2]~reg0_q\ ) + ( \Add3~6\ ))
-- \Add3~10\ = CARRY(( !ball_y_internal(2) ) + ( \ball_dy[2]~reg0_q\ ) + ( \Add3~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ball_dy[2]~reg0_q\,
	datad => ALT_INV_ball_y_internal(2),
	cin => \Add3~6\,
	sumout => \Add3~9_sumout\,
	cout => \Add3~10\);

-- Location: LABCELL_X85_Y4_N3
\ball_y_internal[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ball_y_internal[2]~0_combout\ = !\Add3~9_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Add3~9_sumout\,
	combout => \ball_y_internal[2]~0_combout\);

-- Location: FF_X85_Y4_N5
\ball_y_internal[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ball_y_internal[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ball_y_internal(2));

-- Location: LABCELL_X85_Y4_N24
\LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = ( ball_y_internal(2) & ( ball_y_internal(4) & ( (!\ball_y_internal[6]~DUPLICATE_q\ & \ball_y_internal[7]~DUPLICATE_q\) ) ) ) # ( !ball_y_internal(2) & ( ball_y_internal(4) & ( (!\ball_y_internal[6]~DUPLICATE_q\ & 
-- \ball_y_internal[7]~DUPLICATE_q\) ) ) ) # ( ball_y_internal(2) & ( !ball_y_internal(4) & ( (!\ball_y_internal[6]~DUPLICATE_q\ & (\ball_y_internal[7]~DUPLICATE_q\ & ((!ball_y_internal(5)) # (ball_y_internal(3))))) ) ) ) # ( !ball_y_internal(2) & ( 
-- !ball_y_internal(4) & ( (!\ball_y_internal[6]~DUPLICATE_q\ & \ball_y_internal[7]~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010100000001000001010000010100000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ball_y_internal[6]~DUPLICATE_q\,
	datab => ALT_INV_ball_y_internal(3),
	datac => \ALT_INV_ball_y_internal[7]~DUPLICATE_q\,
	datad => ALT_INV_ball_y_internal(5),
	datae => ALT_INV_ball_y_internal(2),
	dataf => ALT_INV_ball_y_internal(4),
	combout => \LessThan1~0_combout\);

-- Location: LABCELL_X85_Y4_N54
\ball_dy~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \ball_dy~8_combout\ = ( \ball_dy[2]~reg0_q\ & ( !\LessThan1~0_combout\ ) ) # ( !\ball_dy[2]~reg0_q\ & ( \LessThan1~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111100001111000000001111000011111111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_LessThan1~0_combout\,
	datae => \ALT_INV_ball_dy[2]~reg0_q\,
	combout => \ball_dy~8_combout\);

-- Location: FF_X84_Y4_N28
\ball_dy[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \ball_dy~8_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ball_dy[2]~reg0_q\);

-- Location: LABCELL_X85_Y4_N39
\Add3~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~13_sumout\ = SUM(( ball_y_internal(3) ) + ( GND ) + ( \Add3~10\ ))
-- \Add3~14\ = CARRY(( ball_y_internal(3) ) + ( GND ) + ( \Add3~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_ball_y_internal(3),
	cin => \Add3~10\,
	sumout => \Add3~13_sumout\,
	cout => \Add3~14\);

-- Location: FF_X85_Y4_N41
\ball_y_internal[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add3~13_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ball_y_internal(3));

-- Location: FF_X85_Y4_N43
\ball_y_internal[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add3~17_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ball_y_internal(4));

-- Location: MLABCELL_X84_Y4_N45
\Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~21_sumout\ = SUM(( paddle_y(5) ) + ( (\paddle_up~input_o\ & !\paddle_down~input_o\) ) + ( \Add1~18\ ))
-- \Add1~22\ = CARRY(( paddle_y(5) ) + ( (\paddle_up~input_o\ & !\paddle_down~input_o\) ) + ( \Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101110111011101100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_paddle_up~input_o\,
	datab => \ALT_INV_paddle_down~input_o\,
	datad => ALT_INV_paddle_y(5),
	cin => \Add1~18\,
	sumout => \Add1~21_sumout\,
	cout => \Add1~22\);

-- Location: FF_X84_Y4_N47
\paddle_y[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add1~21_sumout\,
	ena => \paddle_y~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => paddle_y(5));

-- Location: MLABCELL_X84_Y4_N48
\Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~29_sumout\ = SUM(( !paddle_y(6) ) + ( (!\paddle_down~input_o\ & \paddle_up~input_o\) ) + ( \Add1~22\ ))
-- \Add1~30\ = CARRY(( !paddle_y(6) ) + ( (!\paddle_down~input_o\ & \paddle_up~input_o\) ) + ( \Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100111111001100000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_paddle_down~input_o\,
	datac => \ALT_INV_paddle_up~input_o\,
	datad => ALT_INV_paddle_y(6),
	cin => \Add1~22\,
	sumout => \Add1~29_sumout\,
	cout => \Add1~30\);

-- Location: MLABCELL_X84_Y4_N21
\paddle_y[6]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \paddle_y[6]~4_combout\ = ( !\Add1~29_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add1~29_sumout\,
	combout => \paddle_y[6]~4_combout\);

-- Location: FF_X84_Y4_N23
\paddle_y[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \paddle_y[6]~4_combout\,
	ena => \paddle_y~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => paddle_y(6));

-- Location: MLABCELL_X84_Y4_N51
\Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~25_sumout\ = SUM(( paddle_y(7) ) + ( (\paddle_up~input_o\ & !\paddle_down~input_o\) ) + ( \Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101110111011101100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_paddle_up~input_o\,
	datab => \ALT_INV_paddle_down~input_o\,
	datad => ALT_INV_paddle_y(7),
	cin => \Add1~30\,
	sumout => \Add1~25_sumout\);

-- Location: FF_X84_Y4_N53
\paddle_y[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add1~25_sumout\,
	ena => \paddle_y~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => paddle_y(7));

-- Location: FF_X84_Y4_N59
\ball_y_internal[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ball_y_internal[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ball_y_internal[5]~DUPLICATE_q\);

-- Location: MLABCELL_X84_Y4_N12
\LessThan2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = ( \ball_y_internal[5]~DUPLICATE_q\ & ( \ball_y_internal[7]~DUPLICATE_q\ & ( (paddle_y(7) & (!paddle_y(5) & (!paddle_y(6) $ (\ball_y_internal[6]~DUPLICATE_q\)))) ) ) ) # ( !\ball_y_internal[5]~DUPLICATE_q\ & ( 
-- \ball_y_internal[7]~DUPLICATE_q\ & ( (paddle_y(7) & (paddle_y(5) & (!paddle_y(6) $ (\ball_y_internal[6]~DUPLICATE_q\)))) ) ) ) # ( \ball_y_internal[5]~DUPLICATE_q\ & ( !\ball_y_internal[7]~DUPLICATE_q\ & ( (!paddle_y(7) & (!paddle_y(5) & (!paddle_y(6) $ 
-- (\ball_y_internal[6]~DUPLICATE_q\)))) ) ) ) # ( !\ball_y_internal[5]~DUPLICATE_q\ & ( !\ball_y_internal[7]~DUPLICATE_q\ & ( (!paddle_y(7) & (paddle_y(5) & (!paddle_y(6) $ (\ball_y_internal[6]~DUPLICATE_q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010010000100100000000000000000000000010010000100100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_paddle_y(6),
	datab => \ALT_INV_ball_y_internal[6]~DUPLICATE_q\,
	datac => ALT_INV_paddle_y(7),
	datad => ALT_INV_paddle_y(5),
	datae => \ALT_INV_ball_y_internal[5]~DUPLICATE_q\,
	dataf => \ALT_INV_ball_y_internal[7]~DUPLICATE_q\,
	combout => \LessThan2~0_combout\);

-- Location: MLABCELL_X84_Y4_N9
\LessThan2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan2~1_combout\ = ( \LessThan2~0_combout\ & ( !paddle_y(4) $ (!ball_y_internal(4)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011110011000011001111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_paddle_y(4),
	datad => ALT_INV_ball_y_internal(4),
	dataf => \ALT_INV_LessThan2~0_combout\,
	combout => \LessThan2~1_combout\);

-- Location: MLABCELL_X84_Y4_N24
\LessThan3~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan3~2_combout\ = ( paddle_y(5) & ( \ball_y_internal[7]~DUPLICATE_q\ & ( (!paddle_y(6) & ((!paddle_y(4) & (!paddle_y(7) & \ball_y_internal[6]~DUPLICATE_q\)) # (paddle_y(4) & (paddle_y(7) & !\ball_y_internal[6]~DUPLICATE_q\)))) # (paddle_y(6) & 
-- (paddle_y(7) & (!paddle_y(4) $ (\ball_y_internal[6]~DUPLICATE_q\)))) ) ) ) # ( !paddle_y(5) & ( \ball_y_internal[7]~DUPLICATE_q\ & ( (paddle_y(7) & (!paddle_y(6) $ (\ball_y_internal[6]~DUPLICATE_q\))) ) ) ) # ( paddle_y(5) & ( 
-- !\ball_y_internal[7]~DUPLICATE_q\ & ( (!paddle_y(6) & ((!paddle_y(4) & (paddle_y(7) & \ball_y_internal[6]~DUPLICATE_q\)) # (paddle_y(4) & (!paddle_y(7) & !\ball_y_internal[6]~DUPLICATE_q\)))) # (paddle_y(6) & (!paddle_y(7) & (!paddle_y(4) $ 
-- (\ball_y_internal[6]~DUPLICATE_q\)))) ) ) ) # ( !paddle_y(5) & ( !\ball_y_internal[7]~DUPLICATE_q\ & ( (!paddle_y(7) & (!paddle_y(6) $ (\ball_y_internal[6]~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000001010000011000000001100000001010000001010000011010000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_paddle_y(6),
	datab => ALT_INV_paddle_y(4),
	datac => ALT_INV_paddle_y(7),
	datad => \ALT_INV_ball_y_internal[6]~DUPLICATE_q\,
	datae => ALT_INV_paddle_y(5),
	dataf => \ALT_INV_ball_y_internal[7]~DUPLICATE_q\,
	combout => \LessThan3~2_combout\);

-- Location: MLABCELL_X84_Y4_N18
\LessThan3~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan3~3_combout\ = ( \LessThan3~2_combout\ & ( (!ball_y_internal(4) & (!paddle_y(4) & (!ball_y_internal(5) $ (paddle_y(5))))) # (ball_y_internal(4) & (paddle_y(4) & (!ball_y_internal(5) $ (!paddle_y(5))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010000001000110001000000100011000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ball_y_internal(4),
	datab => ALT_INV_paddle_y(4),
	datac => ALT_INV_ball_y_internal(5),
	datad => ALT_INV_paddle_y(5),
	dataf => \ALT_INV_LessThan3~2_combout\,
	combout => \LessThan3~3_combout\);

-- Location: FF_X85_Y4_N19
\ball_y_internal[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ball_y_internal[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ball_y_internal(6));

-- Location: MLABCELL_X84_Y4_N0
\LessThan3~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan3~4_combout\ = ( ball_y_internal(6) & ( paddle_y(7) & ( (!paddle_y(6)) # ((!\ball_y_internal[7]~DUPLICATE_q\) # ((paddle_y(5) & !paddle_y(4)))) ) ) ) # ( !ball_y_internal(6) & ( paddle_y(7) & ( (!\ball_y_internal[7]~DUPLICATE_q\) # ((!paddle_y(6) 
-- & (paddle_y(5) & !paddle_y(4)))) ) ) ) # ( ball_y_internal(6) & ( !paddle_y(7) & ( (!\ball_y_internal[7]~DUPLICATE_q\ & ((!paddle_y(6)) # ((paddle_y(5) & !paddle_y(4))))) ) ) ) # ( !ball_y_internal(6) & ( !paddle_y(7) & ( (!paddle_y(6) & (paddle_y(5) & 
-- (!\ball_y_internal[7]~DUPLICATE_q\ & !paddle_y(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000000000101100001010000011110010111100001111101111111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_paddle_y(6),
	datab => ALT_INV_paddle_y(5),
	datac => \ALT_INV_ball_y_internal[7]~DUPLICATE_q\,
	datad => ALT_INV_paddle_y(4),
	datae => ALT_INV_ball_y_internal(6),
	dataf => ALT_INV_paddle_y(7),
	combout => \LessThan3~4_combout\);

-- Location: LABCELL_X83_Y4_N54
\LessThan3~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan3~5_combout\ = ( !\LessThan3~4_combout\ & ( \LessThan3~2_combout\ & ( (!paddle_y(5) & ((!\ball_y_internal[5]~DUPLICATE_q\) # ((paddle_y(4) & ball_y_internal(4))))) # (paddle_y(5) & ((!paddle_y(4)) # ((!\ball_y_internal[5]~DUPLICATE_q\ & 
-- ball_y_internal(4))))) ) ) ) # ( !\LessThan3~4_combout\ & ( !\LessThan3~2_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011011000110111100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_paddle_y(5),
	datab => \ALT_INV_ball_y_internal[5]~DUPLICATE_q\,
	datac => ALT_INV_paddle_y(4),
	datad => ALT_INV_ball_y_internal(4),
	datae => \ALT_INV_LessThan3~4_combout\,
	dataf => \ALT_INV_LessThan3~2_combout\,
	combout => \LessThan3~5_combout\);

-- Location: LABCELL_X85_Y4_N12
\LessThan3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan3~0_combout\ = ( paddle_y(1) & ( (!ball_y_internal(1)) # ((!ball_y_internal(0) & paddle_y(0))) ) ) # ( !paddle_y(1) & ( (!ball_y_internal(0) & (!ball_y_internal(1) & paddle_y(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000000000000001100000011110000111111001111000011111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_ball_y_internal(0),
	datac => ALT_INV_ball_y_internal(1),
	datad => ALT_INV_paddle_y(0),
	dataf => ALT_INV_paddle_y(1),
	combout => \LessThan3~0_combout\);

-- Location: MLABCELL_X84_Y4_N54
\LessThan3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan3~1_combout\ = ( \LessThan3~0_combout\ & ( (!paddle_y(3) & ((!paddle_y(2)) # ((!ball_y_internal(3)) # (ball_y_internal(2))))) # (paddle_y(3) & (!ball_y_internal(3) & ((!paddle_y(2)) # (ball_y_internal(2))))) ) ) # ( !\LessThan3~0_combout\ & ( 
-- (!paddle_y(3) & ((!ball_y_internal(3)) # ((!paddle_y(2) & ball_y_internal(2))))) # (paddle_y(3) & (!paddle_y(2) & (!ball_y_internal(3) & ball_y_internal(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000011101000101000001110100011101000111110101110100011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_paddle_y(3),
	datab => ALT_INV_paddle_y(2),
	datac => ALT_INV_ball_y_internal(3),
	datad => ALT_INV_ball_y_internal(2),
	dataf => \ALT_INV_LessThan3~0_combout\,
	combout => \LessThan3~1_combout\);

-- Location: LABCELL_X83_Y4_N9
\ball_dx~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \ball_dx~8_combout\ = ( \ball_dx[2]~reg0_q\ & ( \process_1~3_combout\ & ( (!\LessThan3~1_combout\ & (((\LessThan3~5_combout\)))) # (\LessThan3~1_combout\ & (((!\LessThan3~3_combout\ & \LessThan3~5_combout\)) # (\LessThan2~1_combout\))) ) ) ) # ( 
-- !\ball_dx[2]~reg0_q\ & ( \process_1~3_combout\ & ( (!\LessThan3~1_combout\ & (((!\LessThan3~5_combout\)))) # (\LessThan3~1_combout\ & (!\LessThan2~1_combout\ & ((!\LessThan3~5_combout\) # (\LessThan3~3_combout\)))) ) ) ) # ( \ball_dx[2]~reg0_q\ & ( 
-- !\process_1~3_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111010000000100000010111111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan2~1_combout\,
	datab => \ALT_INV_LessThan3~3_combout\,
	datac => \ALT_INV_LessThan3~1_combout\,
	datad => \ALT_INV_LessThan3~5_combout\,
	datae => \ALT_INV_ball_dx[2]~reg0_q\,
	dataf => \ALT_INV_process_1~3_combout\,
	combout => \ball_dx~8_combout\);

-- Location: FF_X83_Y4_N11
\ball_dx[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ball_dx~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ball_dx[2]~reg0_q\);

-- Location: MLABCELL_X82_Y4_N36
\ball_dx~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \ball_dx~7_combout\ = ( \ball_dx[1]~reg0_q\ & ( \LessThan2~1_combout\ & ( ((!\process_1~3_combout\) # (\LessThan3~1_combout\)) # (\LessThan3~5_combout\) ) ) ) # ( !\ball_dx[1]~reg0_q\ & ( \LessThan2~1_combout\ & ( (!\LessThan3~5_combout\ & 
-- (!\LessThan3~1_combout\ & \process_1~3_combout\)) ) ) ) # ( \ball_dx[1]~reg0_q\ & ( !\LessThan2~1_combout\ & ( (!\process_1~3_combout\) # ((\LessThan3~5_combout\ & ((!\LessThan3~3_combout\) # (!\LessThan3~1_combout\)))) ) ) ) # ( !\ball_dx[1]~reg0_q\ & ( 
-- !\LessThan2~1_combout\ & ( (\process_1~3_combout\ & ((!\LessThan3~5_combout\) # ((\LessThan3~3_combout\ & \LessThan3~1_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001101111111110011001000000000110000001111111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan3~3_combout\,
	datab => \ALT_INV_LessThan3~5_combout\,
	datac => \ALT_INV_LessThan3~1_combout\,
	datad => \ALT_INV_process_1~3_combout\,
	datae => \ALT_INV_ball_dx[1]~reg0_q\,
	dataf => \ALT_INV_LessThan2~1_combout\,
	combout => \ball_dx~7_combout\);

-- Location: FF_X82_Y4_N37
\ball_dx[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ball_dx~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ball_dx[1]~reg0_q\);

-- Location: MLABCELL_X82_Y4_N0
\Add2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~1_sumout\ = SUM(( ball_x_internal(0) ) + ( \ball_dx[0]~reg0_q\ ) + ( !VCC ))
-- \Add2~2\ = CARRY(( ball_x_internal(0) ) + ( \ball_dx[0]~reg0_q\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ball_dx[0]~reg0_q\,
	datad => ALT_INV_ball_x_internal(0),
	cin => GND,
	sumout => \Add2~1_sumout\,
	cout => \Add2~2\);

-- Location: FF_X82_Y4_N2
\ball_x_internal[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add2~1_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ball_x_internal(0));

-- Location: MLABCELL_X82_Y4_N3
\Add2~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~5_sumout\ = SUM(( ball_x_internal(1) ) + ( \ball_dx[1]~reg0_q\ ) + ( \Add2~2\ ))
-- \Add2~6\ = CARRY(( ball_x_internal(1) ) + ( \ball_dx[1]~reg0_q\ ) + ( \Add2~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ball_dx[1]~reg0_q\,
	datad => ALT_INV_ball_x_internal(1),
	cin => \Add2~2\,
	sumout => \Add2~5_sumout\,
	cout => \Add2~6\);

-- Location: FF_X82_Y4_N5
\ball_x_internal[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add2~5_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ball_x_internal(1));

-- Location: MLABCELL_X82_Y4_N6
\Add2~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~9_sumout\ = SUM(( ball_x_internal(2) ) + ( \ball_dx[2]~reg0_q\ ) + ( \Add2~6\ ))
-- \Add2~10\ = CARRY(( ball_x_internal(2) ) + ( \ball_dx[2]~reg0_q\ ) + ( \Add2~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ball_dx[2]~reg0_q\,
	datad => ALT_INV_ball_x_internal(2),
	cin => \Add2~6\,
	sumout => \Add2~9_sumout\,
	cout => \Add2~10\);

-- Location: FF_X82_Y4_N8
\ball_x_internal[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add2~9_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ball_x_internal(2));

-- Location: MLABCELL_X82_Y4_N9
\Add2~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~13_sumout\ = SUM(( ball_x_internal(3) ) + ( GND ) + ( \Add2~10\ ))
-- \Add2~14\ = CARRY(( ball_x_internal(3) ) + ( GND ) + ( \Add2~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_ball_x_internal(3),
	cin => \Add2~10\,
	sumout => \Add2~13_sumout\,
	cout => \Add2~14\);

-- Location: FF_X82_Y4_N11
\ball_x_internal[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add2~13_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ball_x_internal(3));

-- Location: MLABCELL_X82_Y4_N12
\Add2~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~17_sumout\ = SUM(( ball_x_internal(4) ) + ( GND ) + ( \Add2~14\ ))
-- \Add2~18\ = CARRY(( ball_x_internal(4) ) + ( GND ) + ( \Add2~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_ball_x_internal(4),
	cin => \Add2~14\,
	sumout => \Add2~17_sumout\,
	cout => \Add2~18\);

-- Location: FF_X82_Y4_N14
\ball_x_internal[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add2~17_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ball_x_internal(4));

-- Location: MLABCELL_X82_Y4_N15
\Add2~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~21_sumout\ = SUM(( !\ball_x_internal[5]~DUPLICATE_q\ ) + ( GND ) + ( \Add2~18\ ))
-- \Add2~22\ = CARRY(( !\ball_x_internal[5]~DUPLICATE_q\ ) + ( GND ) + ( \Add2~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ball_x_internal[5]~DUPLICATE_q\,
	cin => \Add2~18\,
	sumout => \Add2~21_sumout\,
	cout => \Add2~22\);

-- Location: MLABCELL_X82_Y4_N57
\ball_x_internal[5]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ball_x_internal[5]~0_combout\ = ( !\Add2~21_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add2~21_sumout\,
	combout => \ball_x_internal[5]~0_combout\);

-- Location: FF_X82_Y4_N59
\ball_x_internal[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ball_x_internal[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ball_x_internal[5]~DUPLICATE_q\);

-- Location: MLABCELL_X82_Y4_N18
\Add2~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~25_sumout\ = SUM(( ball_x_internal(6) ) + ( GND ) + ( \Add2~22\ ))
-- \Add2~26\ = CARRY(( ball_x_internal(6) ) + ( GND ) + ( \Add2~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_ball_x_internal(6),
	cin => \Add2~22\,
	sumout => \Add2~25_sumout\,
	cout => \Add2~26\);

-- Location: FF_X82_Y4_N19
\ball_x_internal[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add2~25_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ball_x_internal(6));

-- Location: MLABCELL_X82_Y4_N21
\Add2~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~29_sumout\ = SUM(( !\ball_x_internal[7]~DUPLICATE_q\ ) + ( GND ) + ( \Add2~26\ ))
-- \Add2~30\ = CARRY(( !\ball_x_internal[7]~DUPLICATE_q\ ) + ( GND ) + ( \Add2~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ball_x_internal[7]~DUPLICATE_q\,
	cin => \Add2~26\,
	sumout => \Add2~29_sumout\,
	cout => \Add2~30\);

-- Location: MLABCELL_X82_Y4_N51
\ball_x_internal[7]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ball_x_internal[7]~1_combout\ = ( !\Add2~29_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_Add2~29_sumout\,
	combout => \ball_x_internal[7]~1_combout\);

-- Location: FF_X82_Y4_N52
\ball_x_internal[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ball_x_internal[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ball_x_internal[7]~DUPLICATE_q\);

-- Location: MLABCELL_X82_Y4_N24
\Add2~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~33_sumout\ = SUM(( ball_x_internal(8) ) + ( GND ) + ( \Add2~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_ball_x_internal(8),
	cin => \Add2~30\,
	sumout => \Add2~33_sumout\);

-- Location: FF_X82_Y4_N25
\ball_x_internal[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add2~33_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ball_x_internal(8));

-- Location: LABCELL_X83_Y4_N18
\process_1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \process_1~0_combout\ = ( ball_y_internal(7) & ( !ball_x_internal(6) & ( (\ball_x_internal[7]~DUPLICATE_q\ & !ball_x_internal(8)) ) ) ) # ( !ball_y_internal(7) & ( !ball_x_internal(6) & ( (!paddle_y(7) & (\ball_x_internal[7]~DUPLICATE_q\ & 
-- !ball_x_internal(8))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000000011110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_paddle_y(7),
	datac => \ALT_INV_ball_x_internal[7]~DUPLICATE_q\,
	datad => ALT_INV_ball_x_internal(8),
	datae => ALT_INV_ball_y_internal(7),
	dataf => ALT_INV_ball_x_internal(6),
	combout => \process_1~0_combout\);

-- Location: LABCELL_X83_Y4_N0
\process_1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \process_1~2_combout\ = ( \ball_y_internal[6]~DUPLICATE_q\ & ( paddle_y(5) & ( (!paddle_y(6) & ((!paddle_y(7) $ (\ball_y_internal[7]~DUPLICATE_q\)))) # (paddle_y(6) & (\ball_y_internal[5]~DUPLICATE_q\ & (!paddle_y(7) $ 
-- (\ball_y_internal[7]~DUPLICATE_q\)))) ) ) ) # ( !\ball_y_internal[6]~DUPLICATE_q\ & ( paddle_y(5) & ( (!paddle_y(6) & (\ball_y_internal[5]~DUPLICATE_q\ & (!paddle_y(7) $ (\ball_y_internal[7]~DUPLICATE_q\)))) ) ) ) # ( \ball_y_internal[6]~DUPLICATE_q\ & ( 
-- !paddle_y(5) & ( (!paddle_y(6) & (!paddle_y(7) $ (\ball_y_internal[7]~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101000000000101000100000000000101011000000001011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_paddle_y(6),
	datab => \ALT_INV_ball_y_internal[5]~DUPLICATE_q\,
	datac => ALT_INV_paddle_y(7),
	datad => \ALT_INV_ball_y_internal[7]~DUPLICATE_q\,
	datae => \ALT_INV_ball_y_internal[6]~DUPLICATE_q\,
	dataf => ALT_INV_paddle_y(5),
	combout => \process_1~2_combout\);

-- Location: FF_X82_Y4_N58
\ball_x_internal[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ball_x_internal[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ball_x_internal(5));

-- Location: MLABCELL_X82_Y4_N42
\process_1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \process_1~1_combout\ = ( !ball_x_internal(1) & ( !ball_x_internal(4) & ( (!ball_x_internal(0) & (!ball_x_internal(3) & (ball_x_internal(5) & ball_x_internal(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ball_x_internal(0),
	datab => ALT_INV_ball_x_internal(3),
	datac => ALT_INV_ball_x_internal(5),
	datad => ALT_INV_ball_x_internal(2),
	datae => ALT_INV_ball_x_internal(1),
	dataf => ALT_INV_ball_x_internal(4),
	combout => \process_1~1_combout\);

-- Location: LABCELL_X83_Y4_N12
\process_1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \process_1~3_combout\ = ( \process_1~1_combout\ & ( \LessThan2~0_combout\ & ( (\process_1~0_combout\ & (!\process_1~2_combout\ & ((ball_y_internal(4)) # (paddle_y(4))))) ) ) ) # ( \process_1~1_combout\ & ( !\LessThan2~0_combout\ & ( (\process_1~0_combout\ 
-- & !\process_1~2_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010100000101000000000000000000000001000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_process_1~0_combout\,
	datab => ALT_INV_paddle_y(4),
	datac => \ALT_INV_process_1~2_combout\,
	datad => ALT_INV_ball_y_internal(4),
	datae => \ALT_INV_process_1~1_combout\,
	dataf => \ALT_INV_LessThan2~0_combout\,
	combout => \process_1~3_combout\);

-- Location: LABCELL_X83_Y4_N6
\ball_dx~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ball_dx~6_combout\ = ( \ball_dx[0]~reg0_q\ & ( \process_1~3_combout\ & ( (!\LessThan3~1_combout\ & (((\LessThan3~5_combout\)))) # (\LessThan3~1_combout\ & (((!\LessThan3~3_combout\ & \LessThan3~5_combout\)) # (\LessThan2~1_combout\))) ) ) ) # ( 
-- !\ball_dx[0]~reg0_q\ & ( \process_1~3_combout\ & ( (!\LessThan3~1_combout\ & (((!\LessThan3~5_combout\)))) # (\LessThan3~1_combout\ & (!\LessThan2~1_combout\ & ((!\LessThan3~5_combout\) # (\LessThan3~3_combout\)))) ) ) ) # ( \ball_dx[0]~reg0_q\ & ( 
-- !\process_1~3_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111110000101000100000111101011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan2~1_combout\,
	datab => \ALT_INV_LessThan3~3_combout\,
	datac => \ALT_INV_LessThan3~5_combout\,
	datad => \ALT_INV_LessThan3~1_combout\,
	datae => \ALT_INV_ball_dx[0]~reg0_q\,
	dataf => \ALT_INV_process_1~3_combout\,
	combout => \ball_dx~6_combout\);

-- Location: FF_X83_Y4_N8
\ball_dx[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ball_dx~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ball_dx[0]~reg0_q\);

-- Location: FF_X82_Y4_N53
\ball_x_internal[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ball_x_internal[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ball_x_internal(7));

-- Location: FF_X85_Y4_N31
\ball_y_internal[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add3~1_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ball_y_internal[0]~DUPLICATE_q\);

-- Location: LABCELL_X83_Y4_N30
\Add5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~1_sumout\ = SUM(( score_internal(0) ) + ( VCC ) + ( !VCC ))
-- \Add5~2\ = CARRY(( score_internal(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_score_internal(0),
	cin => GND,
	sumout => \Add5~1_sumout\,
	cout => \Add5~2\);

-- Location: LABCELL_X83_Y4_N24
\process_1~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \process_1~4_combout\ = ( \LessThan3~5_combout\ & ( \process_1~3_combout\ & ( (\LessThan3~1_combout\ & (!\LessThan2~1_combout\ & \LessThan3~3_combout\)) ) ) ) # ( !\LessThan3~5_combout\ & ( \process_1~3_combout\ & ( (!\LessThan3~1_combout\) # 
-- (!\LessThan2~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111100111111000000000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_LessThan3~1_combout\,
	datac => \ALT_INV_LessThan2~1_combout\,
	datad => \ALT_INV_LessThan3~3_combout\,
	datae => \ALT_INV_LessThan3~5_combout\,
	dataf => \ALT_INV_process_1~3_combout\,
	combout => \process_1~4_combout\);

-- Location: FF_X83_Y4_N31
\score_internal[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add5~1_sumout\,
	ena => \process_1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => score_internal(0));

-- Location: LABCELL_X83_Y4_N33
\Add5~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~5_sumout\ = SUM(( score_internal(1) ) + ( GND ) + ( \Add5~2\ ))
-- \Add5~6\ = CARRY(( score_internal(1) ) + ( GND ) + ( \Add5~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_score_internal(1),
	cin => \Add5~2\,
	sumout => \Add5~5_sumout\,
	cout => \Add5~6\);

-- Location: FF_X83_Y4_N34
\score_internal[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add5~5_sumout\,
	ena => \process_1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => score_internal(1));

-- Location: LABCELL_X83_Y4_N36
\Add5~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~9_sumout\ = SUM(( score_internal(2) ) + ( GND ) + ( \Add5~6\ ))
-- \Add5~10\ = CARRY(( score_internal(2) ) + ( GND ) + ( \Add5~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_score_internal(2),
	cin => \Add5~6\,
	sumout => \Add5~9_sumout\,
	cout => \Add5~10\);

-- Location: FF_X83_Y4_N38
\score_internal[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add5~9_sumout\,
	ena => \process_1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => score_internal(2));

-- Location: LABCELL_X83_Y4_N39
\Add5~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~13_sumout\ = SUM(( score_internal(3) ) + ( GND ) + ( \Add5~10\ ))
-- \Add5~14\ = CARRY(( score_internal(3) ) + ( GND ) + ( \Add5~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_score_internal(3),
	cin => \Add5~10\,
	sumout => \Add5~13_sumout\,
	cout => \Add5~14\);

-- Location: FF_X83_Y4_N41
\score_internal[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add5~13_sumout\,
	ena => \process_1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => score_internal(3));

-- Location: LABCELL_X83_Y4_N42
\Add5~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~17_sumout\ = SUM(( score_internal(4) ) + ( GND ) + ( \Add5~14\ ))
-- \Add5~18\ = CARRY(( score_internal(4) ) + ( GND ) + ( \Add5~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_score_internal(4),
	cin => \Add5~14\,
	sumout => \Add5~17_sumout\,
	cout => \Add5~18\);

-- Location: FF_X83_Y4_N43
\score_internal[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add5~17_sumout\,
	ena => \process_1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => score_internal(4));

-- Location: LABCELL_X83_Y4_N45
\Add5~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~21_sumout\ = SUM(( score_internal(5) ) + ( GND ) + ( \Add5~18\ ))
-- \Add5~22\ = CARRY(( score_internal(5) ) + ( GND ) + ( \Add5~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_score_internal(5),
	cin => \Add5~18\,
	sumout => \Add5~21_sumout\,
	cout => \Add5~22\);

-- Location: FF_X83_Y4_N46
\score_internal[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add5~21_sumout\,
	ena => \process_1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => score_internal(5));

-- Location: LABCELL_X83_Y4_N48
\Add5~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add5~25_sumout\ = SUM(( score_internal(6) ) + ( GND ) + ( \Add5~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_score_internal(6),
	cin => \Add5~22\,
	sumout => \Add5~25_sumout\);

-- Location: FF_X83_Y4_N49
\score_internal[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add5~25_sumout\,
	ena => \process_1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => score_internal(6));

-- Location: IOIBUF_X8_Y81_N52
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: IOIBUF_X82_Y0_N41
\ball_dx[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ball_dx(0),
	o => \ball_dx[0]~input_o\);

-- Location: IOIBUF_X80_Y0_N52
\ball_dx[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ball_dx(1),
	o => \ball_dx[1]~input_o\);

-- Location: IOIBUF_X82_Y0_N58
\ball_dx[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ball_dx(2),
	o => \ball_dx[2]~input_o\);

-- Location: IOIBUF_X89_Y6_N55
\ball_dy[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ball_dy(0),
	o => \ball_dy[0]~input_o\);

-- Location: IOIBUF_X89_Y6_N21
\ball_dy[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ball_dy(1),
	o => \ball_dy[1]~input_o\);

-- Location: IOIBUF_X84_Y0_N35
\ball_dy[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ball_dy(2),
	o => \ball_dy[2]~input_o\);

-- Location: LABCELL_X48_Y35_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


