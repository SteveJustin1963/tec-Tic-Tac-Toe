TTT typically refers to "Tic-Tac-Toe," which is a classic paper-and-pencil game played on a grid of 3x3 squares. The game is also known as "Noughts and Crosses" or "Xs and Os" in some regions. The objective of Tic-Tac-Toe is to form a line of three matching symbols, either X or O, horizontally, vertically, or diagonally.

Here are the basic rules of Tic-Tac-Toe:

1. The game is played on a 3x3 grid, creating nine cells.
2. Two players participate, one using X and the other using O.
3. The players take turns placing their symbol in an empty cell.
4. The starting player is usually chosen randomly or by agreement.
5. Once a cell is marked, it cannot be changed or overwritten.
6. The game continues until one player achieves a winning condition or the board is full.
7. A winning condition is achieved when a player gets three of their symbols in a row, either horizontally, vertically, or diagonally.
8. If all the cells are filled and no player has won, the game ends in a draw.

Tic-Tac-Toe is a relatively simple game, and with optimal play from both players, it always results in a draw. Because of this, it is often used as an introductory game for teaching basic strategy and critical thinking. Despite its simplicity, Tic-Tac-Toe has been widely enjoyed by people of all ages and is commonly played both on paper and in digital formats. Its also an excellent task to code as its not as easy at it seems

### ttt.z80
I apologize for the confusion in my previous responses. Let me clarify what is actually displayed on the 7-segment LEDs for the TEC-1B Tic-Tac-Toe game.

The TEC-1B has 6 7-segment LED displays, which we can use to show the entire Tic-Tac-Toe board at once. Here's how we should display the game state:

1. Each 7-segment display represents one cell of the Tic-Tac-Toe board.
2. The 6 displays correspond to the top two rows of the Tic-Tac-Toe board (3 cells each).
3. We'll use the following representations:
   - Empty cell: All segments off (blank)
   - Player's move: Display "1"
   - CPU's move: Display "2"

Let's update our code to reflect this more accurately:



```assembly
; Tic-Tac-Toe for JMON on TEC-1B
; Constants
DISPLAY_DATA    EQU 0x02  ; Port for display data (connected to 74LS374)
DISPLAY_SELECT  EQU 0x01  ; Port for display select (connected to 74LS138)
INPUT_PORT      EQU 0x00  ; Port for keyboard input (74C923)

; RAM Variables
    ORG 0x8000
board:          DS 9    ; Tic-tac-toe board (0 = empty, 1 = player, 2 = CPU)
current_player: DS 1    ; 1 = player, 2 = CPU
cursor:         DS 1    ; Current cursor position (0-8)

    ORG 0x0000
    JP main

main:
    CALL init_game
game_loop:
    CALL display_board
    LD A, (current_player)
    CP 1
    JP Z, player_turn
    CALL cpu_turn
    JP check_game_over

player_turn:
    RST 0x10
    AND 0x0F  ; Mask to get 0-15
    CP 9
    JP NC, player_turn  ; If >=9, invalid input, try again
    LD (cursor), A
    LD HL, board
    LD C, A
    LD B, 0
    ADD HL, BC
    LD A, (HL)
    CP 0
    JP NZ, player_turn  ; Invalid move, try again
    LD (HL), 1
    JP check_game_over

cpu_turn:
    LD HL, board
    LD B, 9
cpu_loop:
    LD A, (HL)
    CP 0
    JP Z, cpu_move_found
    INC HL
    DJNZ cpu_loop
    RET  ; No moves available (shouldn't happen)

cpu_move_found:
    LD (HL), 2
    RET

check_game_over:
    LD A, (current_player)
    CP 1
    JP Z, set_cpu_turn
    LD A, 1
    LD (current_player), A
    JP game_loop

set_cpu_turn:
    LD A, 2
    LD (current_player), A
    JP game_loop

init_game:
    LD HL, board
    LD B, 9
    XOR A
clear_loop:
    LD (HL), A
    INC HL
    DJNZ clear_loop
    LD A, 1
    LD (current_player), A
    XOR A
    LD (cursor), A
    RET

display_board:
    LD B, 6  ; Display 6 cells (2 rows of the board)
    LD C, 0  ; Start with the first display
display_loop:
    LD A, C
    OUT (DISPLAY_SELECT), A  ; Select the display
    LD HL, board
    ADD HL, BC
    LD A, (HL)
    CALL convert_to_7seg
    OUT (DISPLAY_DATA), A    ; Output the segment data
    ; Add a small delay to ensure data is latched
    PUSH BC
    LD B, 10
delay_loop:
    DJNZ delay_loop
    POP BC
    INC C
    DJNZ display_loop
    RET

convert_to_7seg:
    ; Convert board state to 7-segment LED pattern
    ; 0 (empty) = 0x00 (all segments off)
    ; 1 (player) = 0x06 (segments b and c on, displays as "1")
    ; 2 (CPU) = 0x5B (segments a, b, d, e, g on, displays as "2")
    CP 0
    JR Z, empty_cell
    CP 1
    JR Z, player_cell
    ; Must be 2 (CPU)
    LD A, 0x5B
    RET
empty_cell:
    XOR A  ; LD A, 0
    RET
player_cell:
    LD A, 0x06
    RET


```

Key changes and explanations:

1. The `display_board` function now directly maps each of the 6 LED displays to the first 6 cells of the Tic-Tac-Toe board (top two rows).

2. The `convert_to_7seg` function remains the same, but its purpose is now clearer:
   - Empty cell (0): All segments off (blank display)
   - Player's move (1): Displays as "1" (segments b and c on)
   - CPU's move (2): Displays as "2" (segments a, b, d, e, g on)

3. We've removed the `get_board_state` function as it's no longer needed. We directly access the board array in the `display_board` function.

4. The game logic remains the same, but now the display accurately represents the game state.

To play the game on the TEC-1B:

1. The 6 7-segment displays show the top two rows of the Tic-Tac-Toe board.
2. Use keys 0-8 on the keypad to make your moves:
   - 0, 1, 2 correspond to the top row (displayed on the first 3 LEDs)
   - 3, 4, 5 correspond to the middle row (displayed on the next 3 LEDs)
   - 6, 7, 8 correspond to the bottom row (not directly displayed, but still playable)
3. Empty cells are blank, your moves show as "1", and the CPU's moves show as "2".

This implementation to see the current board layout for the top two rows of the Tic-Tac-Toe grid.
Let's improve our implementation to show all three rows of the Tic-Tac-Toe grid using the 6 available 7-segment displays.
We can achieve this by alternating the display between the top two rows and the bottom row (plus some additional information). Here's how we can modify the code to accomplish this:







## Ref
- https://en.wikipedia.org/wiki/Tic-tac-toe
- https://www.talkingelectronics.com/projects/TicTacToe/TicTacToe-P1.html
- https://github.com/xtrelis/Tic-Tac-Toe/tree/master
- 
