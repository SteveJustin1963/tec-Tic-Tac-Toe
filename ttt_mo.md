```
:I 0 0 0 0 0 0 0 0 0 [ ] b ! ;

:B 
  /N `  --------- ` /N
  b 0 ? 1 = ( ` | X` ) /E ( b 0 ? 2 = ( ` | O` ) /E ( ` | 1` ) )
  b 1 ? 1 = ( ` | X` ) /E ( b 1 ? 2 = ( ` | O` ) /E ( ` | 2` ) )
  b 2 ? 1 = ( ` | X` ) /E ( b 2 ? 2 = ( ` | O` ) /E ( ` | 3` ) )
  ` |` /N `  ---------` /N
  b 3 ? 1 = ( ` | X` ) /E ( b 3 ? 2 = ( ` | O` ) /E ( ` | 4` ) )
  b 4 ? 1 = ( ` | X` ) /E ( b 4 ? 2 = ( ` | O` ) /E ( ` | 5` ) )
  b 5 ? 1 = ( ` | X` ) /E ( b 5 ? 2 = ( ` | O` ) /E ( ` | 6` ) )
  ` |` /N `  ---------` /N
  b 6 ? 1 = ( ` | X` ) /E ( b 6 ? 2 = ( ` | O` ) /E ( ` | 7` ) )
  b 7 ? 1 = ( ` | X` ) /E ( b 7 ? 2 = ( ` | O` ) /E ( ` | 8` ) )
  b 8 ? 1 = ( ` | X` ) /E ( b 8 ? 2 = ( ` | O` ) /E ( ` | 9` ) )
  ` |` /N `  ---------` /N /N
;

:E b $ ? 0 = ;

:M 1 - " b $ ?! ;

:W
  p !
  b 0 ? p = b 1 ? p = & b 2 ? p = & ( 1 w ! ) /E ( 0 w ! )
  b 3 ? p = b 4 ? p = & b 5 ? p = & ( 1 w ! )
  b 6 ? p = b 7 ? p = & b 8 ? p = & ( 1 w ! )
  b 0 ? p = b 3 ? p = & b 6 ? p = & ( 1 w ! )
  b 1 ? p = b 4 ? p = & b 7 ? p = & ( 1 w ! )
  b 2 ? p = b 5 ? p = & b 8 ? p = & ( 1 w ! )
  b 0 ? p = b 4 ? p = & b 8 ? p = & ( 1 w ! )
  b 2 ? p = b 4 ? p = & b 6 ? p = & ( 1 w ! )
;

:C 
  0 c !
  9 ( b /i ? 0 = ( c 1 + c ! ) )
  c
;

:V
  p !
  0 v !
  9 (
    b /i ? 0 = (
      /i p b /i ?!
      p W w (
        /i 1 + v !
      )
      /i 0 b /i ?!
    )
  )
  v
;

:A
  2 V ' 0 > ( ` Checkmate, human.` /N ) /E (
    1 V ' 0 > ( ` Nice try, but I'm onto you.` /N ) /E (
      b 4 ? 0 = ( 5 ` The center is mine!` /N ) /E (
        b 0 ? 0 = ( 1 ` Corner strategy engaged.` /N ) /E (
          b 2 ? 0 = ( 3 ` This corner looks cozy.` /N ) /E (
            b 6 ? 0 = ( 7 ` Another corner for me.` /N ) /E (
              b 8 ? 0 = ( 9 ` Corner secured.` /N ) /E (
                b 1 ? 0 = ( 2 ` I'll take this.` /N ) /E (
                  b 3 ? 0 = ( 4 ` This'll do.` /N ) /E (
                    b 5 ? 0 = ( 6 ` Meh, whatever.` /N ) /E (
                      b 7 ? 0 = ( 8 ` Last resort it is.` /N ) /E (
                        5 ` How did we get here?` /N
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
;

:G
  I
  ` ` /N
  `=================================` /N
  ` TIC-TAC-TOE: You vs Snarky AI` /N  
  `=================================` /N
  ` You are X, I am O. Try to win!` /N
  `=================================` /N

  9 (
    B
    
    C 0 = ( 
      ` It's a draw. I'll allow it.` /N
      /U /W
    )
    
    ` Your move (1-9): ` /KS
    
    ' " 48 - m !
    
    m 1 < m 9 > | (
      ` Invalid! Must be 1-9, genius.` /N
    ) /E (
      m E (
        m 1 M
        
        1 W w (
          B
          ` Impossible! You actually won!` /N
          ` This game is clearly broken.` /N
          /U /W
        )
        
        C 0 > (
          ` ` /N ` My turn...` /N
          A 2 M
          
          2 W w (
            B
            ` Victory is mine! As expected.` /N
            ` Better luck next time, human.` /N
            /U /W
          )
        )
      ) /E (
        ` That spot is taken! Pay attention!` /N
      )
    )
  )
  
  ` ` /N `=================================` /N
  ` Game Over. Type 'G' to play again!` /N
  `=================================` /N /N
;

` ` /N
`=======================================` /N
` MINT TIC-TAC-TOE - LOADED!` /N
`=======================================` /N
` Type: G  to start the game` /N
`       B  to see the board` /N  
`       I  to reset the board` /N
`=======================================` /N /N
```


```
// ============================================================================
// TIC-TAC-TOE - Human vs Snarky AI
// ============================================================================
// Board positions:  1 2 3
//                   4 5 6  
//                   7 8 9
// 
// Board values: 0=empty, 1=player(X), 2=CPU(O)
// ============================================================================

// Initialize board to all zeros
:I 0 0 0 0 0 0 0 0 0 [ ] b ! ;

// Print the board
:B 
  /N `  --------- ` /N
  b 0 ? 1 = ( ` | X` ) /E ( b 0 ? 2 = ( ` | O` ) /E ( ` | 1` ) )
  b 1 ? 1 = ( ` | X` ) /E ( b 1 ? 2 = ( ` | O` ) /E ( ` | 2` ) )
  b 2 ? 1 = ( ` | X` ) /E ( b 2 ? 2 = ( ` | O` ) /E ( ` | 3` ) )
  ` |` /N `  ---------` /N
  b 3 ? 1 = ( ` | X` ) /E ( b 3 ? 2 = ( ` | O` ) /E ( ` | 4` ) )
  b 4 ? 1 = ( ` | X` ) /E ( b 4 ? 2 = ( ` | O` ) /E ( ` | 5` ) )
  b 5 ? 1 = ( ` | X` ) /E ( b 5 ? 2 = ( ` | O` ) /E ( ` | 6` ) )
  ` |` /N `  ---------` /N
  b 6 ? 1 = ( ` | X` ) /E ( b 6 ? 2 = ( ` | O` ) /E ( ` | 7` ) )
  b 7 ? 1 = ( ` | X` ) /E ( b 7 ? 2 = ( ` | O` ) /E ( ` | 8` ) )
  b 8 ? 1 = ( ` | X` ) /E ( b 8 ? 2 = ( ` | O` ) /E ( ` | 9` ) )
  ` |` /N `  ---------` /N /N
;

// Check if position p is empty (returns 1 if empty, 0 if taken)
:E b $ ? 0 = ;

// Place move: position player -- (modifies board)
:M 1 - " b $ ?! ;

// Check win for player p (stores result in w: 0=no win, 1=win)
:W
  p !
  // Row 1
  b 0 ? p = b 1 ? p = & b 2 ? p = & ( 1 w ! ) /E ( 0 w ! )
  // Row 2  
  b 3 ? p = b 4 ? p = & b 5 ? p = & ( 1 w ! )
  // Row 3
  b 6 ? p = b 7 ? p = & b 8 ? p = & ( 1 w ! )
  // Col 1
  b 0 ? p = b 3 ? p = & b 6 ? p = & ( 1 w ! )
  // Col 2
  b 1 ? p = b 4 ? p = & b 7 ? p = & ( 1 w ! )
  // Col 3
  b 2 ? p = b 5 ? p = & b 8 ? p = & ( 1 w ! )
  // Diagonal 1
  b 0 ? p = b 4 ? p = & b 8 ? p = & ( 1 w ! )
  // Diagonal 2
  b 2 ? p = b 4 ? p = & b 6 ? p = & ( 1 w ! )
;

// Count empty squares
:C 
  0 c !
  9 ( b /i ? 0 = ( c 1 + c ! ) )
  c
;

// Check if can win in one move - returns position+1 or 0
:V
  p !
  0 v !
  // Check each position
  9 (
    b /i ? 0 = (
      // Try this move
      /i p b /i ?!
      // Check if wins
      p W w (
        // Found winning move
        /i 1 + v !
      )
      // Undo move
      /i 0 b /i ?!
    )
  )
  v
;

// CPU AI - Returns best move position (1-9)
:A
  // 1. Check if CPU can win
  2 V ' 0 > ( ` Checkmate, human.` /N ) /E (
    // 2. Block player from winning
    1 V ' 0 > ( ` Nice try, but I'm onto you.` /N ) /E (
      // 3. Take center if available
      b 4 ? 0 = ( 5 ` The center is mine!` /N ) /E (
        // 4. Take a corner
        b 0 ? 0 = ( 1 ` Corner strategy engaged.` /N ) /E (
          b 2 ? 0 = ( 3 ` This corner looks cozy.` /N ) /E (
            b 6 ? 0 = ( 7 ` Another corner for me.` /N ) /E (
              b 8 ? 0 = ( 9 ` Corner secured.` /N ) /E (
                // 5. Take any side
                b 1 ? 0 = ( 2 ` I'll take this.` /N ) /E (
                  b 3 ? 0 = ( 4 ` This'll do.` /N ) /E (
                    b 5 ? 0 = ( 6 ` Meh, whatever.` /N ) /E (
                      b 7 ? 0 = ( 8 ` Last resort it is.` /N ) /E (
                        5 ` How did we get here?` /N
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
;

// Main game
:G
  I  // Initialize board
  ` ` /N
  `=================================` /N
  ` TIC-TAC-TOE: You vs Snarky AI` /N  
  `=================================` /N
  ` You are X, I am O. Try to win!` /N
  `=================================` /N

  // Game loop - max 9 moves
  9 (
    // Show board
    B
    
    // Check if board is full
    C 0 = ( 
      ` It's a draw. I'll allow it.` /N
      /U /W  // Break
    )
    
    // Player turn
    ` Your move (1-9): ` /KS
    
    // Convert input to number (read length then last digit)
    ' " 48 - m !  // Get digit and store in m
    
    // Validate move
    m 1 < m 9 > | (
      ` Invalid! Must be 1-9, genius.` /N
    ) /E (
      m E (
        // Valid move
        m 1 M
        
        // Check player win
        1 W w (
          B
          ` Impossible! You actually won!` /N
          ` This game is clearly broken.` /N
          /U /W  // Break
        )
        
        // CPU turn
        C 0 > (
          ` ` /N ` My turn...` /N
          A 2 M
          
          // Check CPU win  
          2 W w (
            B
            ` Victory is mine! As expected.` /N
            ` Better luck next time, human.` /N
            /U /W  // Break
          )
        )
      ) /E (
        ` That spot is taken! Pay attention!` /N
      )
    )
  )
  
  ` ` /N `=================================` /N
  ` Game Over. Type 'G' to play again!` /N
  `=================================` /N /N
;

// Start message
` ` /N
`=======================================` /N
` MINT TIC-TAC-TOE - LOADED!` /N
`=======================================` /N
` Type: G  to start the game` /N
`       B  to see the board` /N  
`       I  to reset the board` /N
`=======================================` /N /N

```

