```
[ 1 2 3 4 5 6 7 8 9 ] b !      // Initialize the game board with cell numbers

1 p !                          // Player marker is 1
2 c !                          // Computer marker is 2

: P                            // Function to print the game board
  9 (
    b /i ? n !
    n 1 >= n 9 <= and (        // If cell is unmarked (contains a number)
      n .
    ) /E (
      n p = ( `X` . ) /E (     // If cell contains player's marker
      n c = ( `O` . )          // If cell contains computer's marker
      )
    )
    /i 1 + t !
    t 3 % 0 = (
      /N                       // Newline after every 3 cells
    ) /E (
      `|` .                    // Separator between cells
    )
  )
;
 /N

: G                            // Function to get the player's move
  `Your move (1-9): ` . /K n !
  n 48 - n !                   // Convert ASCII code to number
  n 1 >= n 9 <= and (          // Check if n is between 1 and 9
    n 1 - i !                  // Adjust index to 0-based
    b i ? n = (                // Check if cell is unmarked
      p b i !                  // Place player's marker
    ) /E (
      `Position occupied, try again.` . /N
      G                        // Retry input
    )
  ) /E (
    `Invalid move, try again.` . /N
    G                          // Retry input
  )
;
 /N

: M                            // Function for computer's move
  9 (
    b /i ? n !
    n 1 >= n 9 <= and (        // If cell is unmarked
      c b /i !                 // Place computer's marker
      `Computer moves to position ` /i 1 + . /N
      /U /W                    // Exit loop after moving
    )
  )
;
 /N

: C                            // Function to check for a winner or a tie
  // Winning combinations flattened into a single array
  [ 0 1 2 3 4 5 6 7 8
    0 3 6 1 4 7 2 5 8
    0 4 8 2 4 6 ] w !

  8 (                          // Loop through each winning combination
    w /i 3 * + ? a !
    w /i 3 * 1 + + ? b !
    w /i 3 * 2 + + ? c !
    b a ? m !
    b b ? n !
    b c ? o !
    m n = 0 > n o = 0 > and m 1 >= m 2 <= and (
      m p = ( `Player wins!` . /T /U /W ) /E (
      m c = ( `Computer wins!` . /T /U /W )
      )
    )
  )
  // Check for tie
  9 (
    b /i ? n !
    n 1 >= n 9 <= or (         // If any cell is unmarked
      /U /W                    // Exit function; game is not a tie yet
    )
  )
  `It's a tie!` . /T /U /W     // If loop completes, it's a tie
  /F                           // No winner yet; continue game
;
 /N

: S                            // Main game loop
  `TIC TAC TOE` . /N
  P                            // Print the initial board
  /U (                         // Start an unlimited loop
    G                          // Player's move
    P                          // Print the board
    C /T = ( /U /W )           // If game over, exit loop
    M                          // Computer's move
    P                          // Print the board
    C /T = ( /U /W )           // If game over, exit loop
  )
  `Game over.` . /N
;
 /N

S                              // Start the game

```


//////////////////////////
```
[ 0 0 0 0 0 0 0 0 0 ] b !      // Initialize the game board

/T p ! /F c !                  // Player marker is 1, computer marker is 2 (adjusted in code)

/N

:P                             // Function to print the game board
  9 (
    b /i ? n !
    n 0 = (
      /i 1 + .                 // Print cell number
    ) /E (
      n 1 = ( `X` . ) /E (
      n 2 = ( `O` . )
    ))
    /i 2 % 0 = (
      /N
    ) /E (
      `|` .                    // Separator
    )
  )
;

/N

:G                             // Function to get the player's move
  `Your move (1-9): ` . /K n !
  n 48 - n !                   // Convert ASCII code to number
  n 1 >= n 9 <= and /T = (
    n 1 - i !
    b i ? 0 = (
      1 b i !                  // Player's move
    ) /E (
      `Position occupied, try again.` . /N
      G
    )
  ) /E (
    `Invalid move, try again.` . /N
    G
  )
;

/N

:M                             // Function for computer's move
  9 (
    b /i ? 0 = (
      2 b /i !                 // Computer's move
      `Computer moves to position ` /i 1 + . /N
      /U /W
    )
  )
;

/N

:C                             // Function to check for a winner or a tie
  (
    // Check rows
    b 0 ? b 1 ? = b 1 ? b 2 ? = and b 0 ? 0 > and (
      b 0 ? 1 = ( `Player wins!` . /T ) /E ( `Computer wins!` . /T )
    )
    // Similarly check columns and diagonals...
  ) /T = ( /T ) /E (
    // Check for tie
    9 ( b /i ? 0 > and ) /F = ( `It's a tie!` . /T ) /E ( /F )
  )
;

/N

:S                             // Main game loop
  `TIC TAC TOE` . /N
  P                            // Print the initial board
  /U (
    G                          // Player's move
    P                          // Print the board
    C /T = ( /U /W )           // Check for win or tie
    M                          // Computer's move
    P                          // Print the board
    C /T = ( /U /W )           // Check for win or tie
  )
;

/N

S                              // Start the game

```

/////////////////////
```
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

```

