[ 1 2 3 4 5 6 7 8 9 ] b !  // Initialize the game board
/T p ! /F c !             // Player marker is true, computer marker is false

:P                        // Function to print the game board
  0 ( b i ? , b i = /F ( `  ` ) /E ( p = /T ( `X` ) /E ( c = /T ( `O` ) ) ) . )
;

:G                        // Function to get the player's move
  `Your move (1-9): ` . /K n ! 
  n 1 < n 9 > (`Invalid move, try again.`,/G) // Check if move is valid
  n 1 - b n ! p b n !     // Update the board with the player's move
;

:C                        // Function to check for a winner or a tie
  0 3 6 ( b i b i 1 + = b i 2 + = and ) ( `Player wins!` , . /T ) 
  0 1 2 ( b i b i 3 + = b i 6 + = and ) ( `Player wins!` , . /T )
  0 4 8 ( b i b i 4 + = ) ( `Player wins!` , 4 4 4 ( b i b i 4 - = ) ( `Player wins!` , . /T ) )
  0 8 ( b i 0 > ) ( `It's a tie!` , . /F )
  . /F
;

:M                        // Function to get the computer's move
  0 8 ( b i 0 > ( i ) ) ( 1- )
  b n ! c b n ! `Computer moves.`
;

:S                        // Main game loop
  `TIC TAC TOE` . /N
  P                       // Print the initial board
  /U (
    G                     // Get the player's move
    C                     // Check for a winner
    P                     // Print the board
    M                     // Get the computer's move
    C                     // Check for a winner
    P                     // Print the board
  )
;

S                         // Start the game
