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

/////////////

 Let's improve our implementation to show all three rows of the Tic-Tac-Toe grid using the 6 available 7-segment displays.

We can achieve this by alternating the display between the top two rows and the bottom row (plus some additional information). Here's how we can modify the code to accomplish this:


 
Key changes and explanations:

1. Added a `display_mode` variable that alternates between showing the top two rows and the bottom row.

2. The `display_board` function now switches between two display modes:
   - Mode 0: Displays the top two rows of the Tic-Tac-Toe grid (6 cells)
   - Mode 1: Displays the bottom row (3 cells) plus additional information:
     * 4th display: Shows current player (1 or 2)
     * 5th display: Shows "P" to indicate "Player"
     * 6th display: Left blank for clarity

3. Added `display_row` function to handle displaying a single row of the grid.

4. The game logic remains the same, but now the display represents the full game state.

To play the game on the TEC-1B:

1. The display will alternate between showing:
   - The top two rows of the Tic-Tac-Toe board
   - The bottom row, current player, and "P" indicator

2. Use keys 0-8 on the keypad to make your moves:
   - 0, 1, 2 correspond to the top row
   - 3, 4, 5 correspond to the middle row
   - 6, 7, 8 correspond to the bottom row

3. Empty cells are blank, your moves show as "1", and the CPU's moves show as "2".

4. When the bottom row is displayed, you'll also see:
   - The current player (1 or 2) in the 4th position
   - "P" (for Player) in the 5th position
   - A blank space in the 6th position

This implementation provides a complete view of the Tic-Tac-Toe grid by alternating the display, making it possible to see all nine cells of the game board on the TEC-1B's six 7-segment displays. The additional information about the current player helps keep track of whose turn it is.
//////////////////





## Ref
- https://en.wikipedia.org/wiki/Tic-tac-toe
- https://www.talkingelectronics.com/projects/TicTacToe/TicTacToe-P1.html
- https://github.com/xtrelis/Tic-Tac-Toe/tree/master
- 
