 

#include <stdio.h>

int main() {
  // start with an empty 3x3 grid
  char grid[3][3] = {
    {' ', ' ', ' '},
    {' ', ' ', ' '},
    {' ', ' ', ' '}
  };

  // player 1 chooses a position on the grid
  grid[0][0] = 'X';

  // player 2 chooses a position on the grid
  grid[1][1] = 'O';

  // if player 1 has three 'X' symbols in a row, player 1 wins
  if (grid[0][0] == 'X' && grid[0][1] == 'X' && grid[0][2] == 'X') {
    printf("Player 1 wins!\n");
  }

  // if player 2 has three 'O' symbols in a row, player 2 wins
  if (grid[1][0] == 'O' && grid[1][1] == 'O' && grid[1][2] == 'O') {
    printf("Player 2 wins!\n");
  }

  // if all the cells on the grid are filled and neither player has won, the game ends in a draw
  if (grid[0][0] != ' ' && grid[0][1] != ' ' && grid[0][2] != ' ' && 
      grid[1][0] != ' ' && grid[1][1] != ' ' && grid[1][2] != ' ' &&
      grid[2][0] != ' ' && grid[2][1] != ' ' && grid[2][2] != ' ') {
    printf("The game ends in a draw.\n");
  }

  return 0;
}
