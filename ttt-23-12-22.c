#include <stdio.h>
#include <stdlib.h>

#define X 'X'
#define O 'O'
#define BLANK ' '

char board[9] = {BLANK, BLANK, BLANK, BLANK, BLANK, BLANK, BLANK, BLANK, BLANK};

void update_board(char board[9], int position, char symbol) {
  /* Updates the tic-tac-toe board with the given symbol at the given position. */
  board[position] = symbol;
}

char check_win(char board[9]) {
  /*
  Checks if the given tic-tac-toe board has a winner.
  Returns X, O, or BLANK if there is no winner.
  */

  // Check for horizontal wins
  for (int i = 0; i < 9; i += 3) {
    if (board[i] == board[i+1] && board[i+1] == board[i+2] && board[i] != BLANK) {
      return board[i];
    }
  }

  // Check for vertical wins
  for (int i = 0; i < 3; i++) {
    if (board[i] == board[i+3] && board[i+3] == board[i+6] && board[i] != BLANK) {
      return board[i];
    }
  }

  // Check for diagonal wins
  if (board[0] == board[4] && board[4] == board[8] && board[0] != BLANK) {
    return board[0];
  }
  if (board[2] == board[4] && board[4] == board[6] && board[2] != BLANK) {
    return board[2];
  }

  return BLANK;
}

int check_draw(char board[9]) {
  /*
  Checks if the given tic-tac-toe board is a draw.
  Returns 1 if the board is a draw, 0 otherwise.
  */
  for (int i = 0; i < 9; i++) {
    if (board[i] == BLANK) {
      return 0;
    }
  }
  return 1;
}

int computer_choice(char board[9]) {
  /* Returns a valid position choice for the computer on the given tic-tac-toe board. */
  // Choose the first available position
  for (int i = 0; i < 9; i++) {
    if (board[i] == BLANK) {
      return i;
    }
  }
  return -1;  // No available positions
}

int main(void) {
  char player_symbol = X;
  char computer_symbol = O;

  while (1) {
    // Print the current board
    printf(" %c | %c | %c \n", board[0], board[1], board[2]);
    printf("---------\n");
    printf(" %c | %c | %c \n", board[3
], board[4], board[5]);
    printf("---------\n");
    printf(" %c | %c | %c \n\n", board[6], board[7], board[8]);

    // Get player's choice
    int position;
    printf("Choose a position (1-9): ");
    scanf("%d", &position);
    position--; // Adjust for array indexing

    // Make sure this position is valid
    if (position >= 0 && position <= 8 && board[position] == BLANK) {
      update_board(board, position, player_symbol);
    } else {
      printf("Invalid position\n");
      continue;
    }

    // Check for a winner
    char winner = check_win(board);
    if (winner != BLANK) {
      printf("Player %c wins!\n\n", winner);
      break;
    }

    // Check for a draw
    int draw = check_draw(board);
    if (draw) {
      printf("Draw!\n\n");
      break;
    }
    
    
    // Get computer's choice
    position = computer_choice(board);
    if (position != -1) {
      update_board(board, position, computer_symbol);
    } else {
      printf("Draw!\n\n");
      break;
    }

    // Check for a winner
    winner = check_win(board);
    if (winner != BLANK) {
      printf("Player %c wins!\n\n", winner);
      break;
    }
  }
  
  return 0;
}
