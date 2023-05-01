# Tic-Tac-Toe / Naughts and Crosses  
  
Now in MINT code...
- you vs the computer, c vs c
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



