: TicTacToe
  0 0 0 0 0 0 0 0 0 \! \! \! \! \! \! \! \! \!  \# set the board to all zeros
  0 a! \# set the current player to 0
  \# print the board
  Board
  \# get the player's move
  PlayerMove
  \# check for a win
  CheckWin
  \# switch the current player
  a@ 1 = a!
  \# if the game is not over, loop back to the beginning
  a@ 9 < \# check if the board is full
  TicTacToe \# if not full, play again
;

: Board
  0 \O \# print the top row
  1 \O
  2 \O
  3 \O
  4 \O
  5 \O
  6 \O
  7 \O
  8 \O
  \N
  9 \O
  10 \O
  11 \O
  12 \O
  13 \O
  14 \O
  15 \O
  16 \O
  17 \O
  \N
  18 \O
  19 \O
  20 \O
  21 \O
  22 \O
  23 \O
  24 \O
  25 \O
  26 \O
;

: PlayerMove
  a@ 0 = \# if it's player 0's turn
  \# get player 0's move
  GetMove
  \# if it's player 1's turn
  \# get player 1's move
  GetMove
;

: GetMove
  \# print a message asking for the player's move
  "Enter your move (0-8): " \P
  \# get the player's move
  \K \# read a character from input
  48 - \# subtract 48 to get the actual number
  a@ 0 = \# if it's player 0's turn
  2 \# set the board value to 2
  a@ 1 = \# if it's player 1's turn
  3 \# set the board value to 3
  \# store the value in the board
  \!
;

: CheckWin
  0 1 2 @ @ @ = \# check for a win in the top row
  Win \# if there is a win, display the message
  3 4 5 @ @ @ = \# check for a win in the middle row
  Win
  6 7 8 @ @ @ = \# check for a win in the bottom row
  Win
  0 3 6 @ @ @ = \# check for a win in the left column
  Win
  1 4 7 @ @ @ = \# check for a win in the middle column
  Win
  2 5 8 @ @ @ = \# check for a win in the right column
  Win
  0 4 8 @ @ @ = \# check for a win in the diagonal
  Win
  2 4 6 @ @ @ = \# check for a win in the other diagonal
  Win
;

: Win
  a@ 0 = \# if player 0 won
  "Player 0 wins!" \P \N \# print the message
  a@ 1 = \# if player 1 won
  "Player 1 wins
