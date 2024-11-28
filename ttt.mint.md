```
// Tec-1 MINT 2.0
// https://github.com/SteveJustin1963/tec-MINT


[ 1 2 3 4 5 6 7 8 9 ] b !
1 p ! 2 c !

:P
  9 (
    b /i ? n !
    n 1 >= n 9 <= /T /F /E (
      n .
    ) /E (
      n p = /T ( `X` . ) /F (
      n c = /T ( `O` . )
      )
    )
    /i 1 + t !
    t 3 % 0 = /T ( /N ) /E (
      `|` .
    )
  )
  /N
;

:G
  `Your move (1-9): ` . /K n !
  n 48 - n !
  n 1 >= n 9 <= /T /F /E (
    n 1 - i !
    b i ? n = /T (
      p b i !
    ) /E (
      `Position occupied, try again.` . /N
      G
    )
  ) /E (
    `Invalid move, try again.` . /N
    G
  )
  /N
;

:M
  9 (
    b /i ? n !
    n 1 >= n 9 <= /T /F /E (
      c b /i !
      `Computer moves to position ` /i 1 + . /N
      /U /W
    )
  )
  /N
;

:C
  [ 0 1 2 3 4 5 6 7 8
    0 3 6 1 4 7 2 5 8
    0 4 8 2 4 6 ] w !
  8 (
    w /i 3 * + ? a !
    w /i 3 * 1 + + ? b !
    w /i 3 * 2 + + ? c !
    b a ? m !
    b b ? n !
    b c ? o !
    m n = /F > n o = /F > and m 1 >= m 2 <= /T /F /E (
      m p = /T ( `Player wins!` . /T /U /W ) /F (
      m c = /T ( `Computer wins!` . /T /U /W )
      )
    )
  )
  9 (
    b /i ? n !
    n 1 >= n 9 <= /F /T /E (
      /U /W
    )
  )
  `It's a tie!` . /T /U /W
  /F
  /N
;

:S
  `TIC TAC TOE` . /N
  P
  /U (
    G
    P
    C /T = ( /U /W )
    M
    P
    C /T = ( /U /W )
  )
  `Game over.` . /N
;

S
```
//////////////////////////////////////////////////////////////////////////////

```
[ 1 2 3 4 5 6 7 8 9 ] b !      // Initialize the game board with cell numbers
1 p ! 2 c !                    // Player marker is 1, computer marker is 2

:P                            // Function to print the game board
  9 (
    b /i ? n !
    n 1 >= n 9 <= /T /F /E (   // If cell is unmarked (contains a number)
      n .
    ) /E (
      n p = /T ( `X` . ) /F (  // If cell contains player's marker
      n c = /T ( `O` . )       // If cell contains computer's marker
      )
    )
    /i 1 + t !
    t 3 % 0 = /T ( /N ) /E (
      `|` .                    // Separator between cells
    )
  )
  /N
;

:G                            // Function to get the player's move
  `Your move (1-9): ` . /K n !
  n 48 - n !                   // Convert ASCII code to number
  n 1 >= n 9 <= /T /F /E (     // Check if n is between 1 and 9
    n 1 - i !                  // Adjust index to 0-based
    b i ? n = /T (            // Check if cell is unmarked
      p b i !                  // Place player's marker
    ) /E (
      `Position occupied, try again.` . /N
      G                        // Retry input
    )
  ) /E (
    `Invalid move, try again.` . /N
    G                          // Retry input
  )
  /N
;

:M                            // Function for computer's move
  9 (
    b /i ? n !
    n 1 >= n 9 <= /T /F /E (   // If cell is unmarked
      c b /i !                 // Place computer's marker
      `Computer moves to position ` /i 1 + . /N
      /U /W                    // Exit loop after moving
    )
  )
  /N
;

:C                            // Function to check for a winner or a tie
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
    m n = /F > n o = /F > and m 1 >= m 2 <= /T /F /E (
      m p = /T ( `Player wins!` . /T /U /W ) /F (
      m c = /T ( `Computer wins!` . /T /U /W )
      )
    )
  )
  // Check for tie
  9 (
    b /i ? n !
    n 1 >= n 9 <= /F /T /E (   // If any cell is unmarked
      /U /W                    // Exit function; game is not a tie yet
    )
  )
  `It's a tie!` . /T /U /W     // If loop completes, it's a tie
  /F                           // No winner yet; continue game
  /N
;

:S                            // Main game loop
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

S                              // Start the game
```
///////////////////////////////////////////////////////////////////

// 28.11.24

// Init board and players
[1 2 3 4 5 6 7 8 9]b! 1p! 2c!

// Print board
:P
9(
b/i?n!
n3>(n.)
/E(np=(X.)/E(O.))
/i1+3%0=(/N)
/E(`|`.)
)/N;

// Get player move
:G
`Move 1-9:`./Kn!
n48-1-i!
bi?9>(pb i!/E(G));

// Computer move
:M
9(b/i?9>(cb/i!/U/W));

// Check win
:C
[0 1 2 3 4 5 6 7 8 0 3 6 1 4 7 2 5 8 0 4 8 2 4 6]w!
8(
w/i3*+?a!
w/i3*1++?b!
w/i3*2++?c!
ba?bb?=bc?=&(
ba?p=(`WIN`./T/U/W)
/E(ba?c=(`LOSE`./T/U/W))
))
9(b/i?9>/T(/U/W))
`TIE`./T/U/W/F/N;

// Main game
:S
P/U(GP C/T=(/U/W)MP C/T=(/U/W));

S

///////////////////////////////////////////////////

