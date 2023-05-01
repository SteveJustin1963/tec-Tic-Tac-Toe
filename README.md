# Tic-Tac-Toe / Naughts and Crosses  
  
Now in MINT code...
- you vs the computer
- computer can have best or next legal move or a mix of both
- 


```
>1 2 3
>4 5 6
>7 8 9

>2

>1 X 3
>4 O 6
>7 8 9

>1

>X X O
>4 O 6
>7 8 9
```

## sudo 
```
board = [0,0,0,0,0,0,0,0,0] # Initialize the board with all 0's
player = 1 # Player 1 starts the game

for i in range(9):
  move = get_player_move() # Get the move from the current player
  board[move-1] = player # Update the board with the player's move
  if has_winner(board): # Check if the current player has won
    print("Player", player, "wins!")
    break
  player = 3 - player # Switch to the other player

print("Draw.")

# Function to get the player's move
def get_player_move():
  while True:
    move = int(input("Enter your move (1-9): "))
    if board[move-1] == 0:
      return move
    print("Space already occupied, try again.")

# Function to check if there is a winner
def has_winner(board):
  # Check rows
  for i in range(3):
    if board[i*3] == board[i*3+1] == board[i*3+2] != 0:
      return True
  # Check columns
  for i in range(3):
    if board[i] == board[i+3] == board[i+6] != 0:
      return True
  # Check diagonals
  if board[0] == board[4] == board[8] != 0 or board[2] == board[4] == board[6] != 0:
    return True
  return False
```
## forth code
```
: board 9 cells 0 ;
: player 1 ;

: get-player-move ( -- move )
  begin
    key ( move )
    dup board [ move 1- ] @ 0= if drop exit then
    cr ." Space already occupied, try again."
  again ;

: has-winner ( board -- flag )
  board 3 /mod ( row )
  0 board 3 * + board 3 * + board [
  board 3 * 1+ board 3 * 1+ board [
  board 3 * 2+ board 3 * 2+ board [ =
  if drop true exit then

  0 board 3 + board 6 + board [
  board 1+ 3 + board 4 + board [
  board 2+ 3 + board 5 + board [ =
  if drop true exit then

  board 4 board [ board 8 board [ =
  if drop true exit then
  board 4 board [ board 6 board [ =
  if drop true exit then
  false ;

: play ( -- )
  9 0 do
    player @ 1 = if
      get-player-move ( move )
      10 player @ emit
    else
      ( computer move )
    then
    player @ board move 1- swap !
    board has-winner if
      ." Player " . ." wins!" cr
      exit
    then
    3 player @ - player !
  loop
  cr ." Draw." ;

```
```
: board 9 cells 0 ; - This line declares a variable "board" with 9 cells and sets all cells to 0.
: player 1 ; - This line declares a variable "player" and sets it to 1.

: get-player-move ( -- move ) - This defines a Forth word "get-player-move" that takes no input and returns a value "move".
begin - This starts a loop that continues until the "exit" word is called.
key ( move ) - This reads a key press and returns it as the value "move".
dup board [ move 1- ] @ 0= if drop exit then - This checks if the cell in the "board" variable at the index "move-1" is equal to 0. If it is, the loop exits. If not, it continues.
cr ." Space already occupied, try again." - This outputs a message indicating that the space is already occupied and prompts the player to try again.
again ; - This ends the loop.

: has-winner ( board -- flag ) - This defines a Forth word "has-winner" that takes a variable "board" as input and returns a flag indicating whether there is a winner.
board 3 /mod ( row ) - This computes the row of the cell in the "board" variable.
0 board 3 * + board 3 * + board [ - This checks the first row of the "board" variable.
board 3 * 1+ board 3 * 1+ board [ - This checks the second row of the "board" variable.
board 3 * 2+ board 3 * 2+ board [ = - This checks the third row of the "board" variable.
if drop true exit then - If all three cells in a row are equal, the function returns true and exits.

0 board 3 + board 6 + board [ - This checks the first column of the "board" variable.
board 1+ 3 + board 4 + board [ - This checks the second column of the "board" variable.
board 2+ 3 + board 5 + board [ = - This checks the third column of the "board" variable.
if drop true exit then - If all three cells in a column are equal, the function returns true and exits.

board 4 board [ board 8 board [ = - This checks the first diagonal of the "board" variable.
if drop true exit then - If all three cells in the diagonal are equal, the function returns true and exits.
board 4 board [ board 6 board [ = - This checks the second diagonal of the "board" variable.
if drop true exit then - If all three cells in the diagonal are equal, the function returns true and exits.
false ; - If there is no winner, the function returns false.

: play ( -- ) - This defines a Forth word "play" that takes no input and returns no output.
9 0 do - This starts a loop that will run 9 times.
player @ 1 = if - This checks if the "player" variable is equal to 1.
get-player-move ( move ) - If "player" is equal to 1, the "get-player-move" word is called.
10 player @ emit - This outputs the value of "player" and the value of "move".
else - If "player" is not equal to 1, the computer's move is computed.
( computer move ) -

the code for the computer's move is not provided in this code snippet.
then - This ends the "if" statement.
player @ board move 1- swap ! - This updates the "board" variable with the current player's move.
board has-winner if - This checks if there is a winner after the current move.
." Player " . ." wins!" cr - If there is a winner, a message is output indicating which player won.
exit - The "play" word is exited.
then - This ends the "if" statement.
3 player @ - player ! - This updates the "player" variable to the next player's turn.
loop - This ends the loop.
cr ." Draw." ; - If the loop has completed, a message indicating a draw is output.
```


