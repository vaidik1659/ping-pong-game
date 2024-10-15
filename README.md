# ping-pong-game
Ping Pong game built with VHDL VGA on Quartus Prime using the DE-10 Standard board

## Game Setup

1. Open the Quartus project file in **Quartus Prime**.
2. The project is already compiled.
3. Connect a VGA cable to the monitor and attach it to the DE-10 Standard FPGA board.
4. In Quartus, go to **Tools** > **Programmer**.
5. Select the second file in the list and hit the **Start** button to upload the design to the FPGA board.
6. Once programmed, you can start playing the game on the monitor.

## Controls

- **Reset**: Use **SW(9)** to reset the game.
- **Control paddle up and down**: Use **KEY0** and **KEY1** for paddle movement.
- **Color map selection**: Change the color of the game using **SW(3:0)**.

## Notes

- A **clock divider** was added to drive **LEDR(9)** on the board with a signal of approximately **1 Hz**. This signal is derived from the 50 MHz clock.
- An **Intel FPGA PLL IP** was added to act as a buffer and repeater for the 50 MHz clock signal received from the on-board crystal quartz oscillator.

