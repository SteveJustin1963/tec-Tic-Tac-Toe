: clear-board \[ 0 0 0 0 0 0 0 0 0 ] board ! ;
: print-board 
  0 board@ 0= " " .
  0 board@ 1= "X" .
  0 board@ 2= "O" .
  1 board@ 3= " " .
  1 board@ 4= "X" .
  1 board@ 5= "O" .
  2 board@ 6= " " .
  2 board@ 7= "X" .
  2 board@ 8= "O" .
;
: get-move 
  "Enter a number from 0 to 8: " .
  \K .
  dup 10 < swap 9 < or if 
    drop "Invalid move. Try again." cr
    get-move
  else 
    dup board@ 0= if 
      drop "That spot is already taken. Try again." cr
      get-move
    else nip 
  then ;
: make-move player 
  get-move dup board ! player ;
: check-win 
  0 board@ 1 board@ 2 board@ = 
  3 board@ 4 board@ 5 board@ = 
  6 board@ 7 board@ 8 board@ = 
  or 
  0 board@ 3 board@ 6 board@ = 
  1 board@ 4 board@ 7 board@ = 
  2 board@ 5 board@ 8 board@ = 
  or 
  0 board@ 4 board@ 8 board@ = 
  2 board@ 4 board@ 6 board@ = 
  or ;
: game 
  clear-board
  : player-turn 1 make-move ;
  : computer-turn 2 make-move ;
  : next-turn 
    player-turn
    check-win if "You win!" . exit then
    computer-turn
    check-win if "You lose." . exit then
    next-turn ;
  next-turn ;
game


/////////////
This program defines several functions:

clear-board initializes the board to all zeros.
print-board displays the current state of the board.
get-move prompts the player for a move and validates it.
make-move takes a player number (either 1 or 2) and makes a move for that player.
check-win checks if either player has won the game.
game is the main loop of the program. It starts by clearing the board, then alternates between the player and computer making moves until the game is won or tied.
To play the game, just type game and follow the prompts.

