```
[0 0 0 0 0 0 0 0 0] $ b!
[0 1 2 3 4 5 6 7 8 0 3 6 1 4 7 2 5 8 0 4 8 2 4 6] $ l!

:W;
  p!
  0 w!
  8 (
    l@ \i 3 * ? b@ swap ? p@ swap = 
    l@ \i 3 * 1 + ? b@ swap ? p@ swap = & 
    l@ \i 3 * 2 + ? b@ swap ? p@ swap = & 
    ( 1 w! )
    w@ \B
  )
  w@
;

:P;
  \N `TIC-TAC-TOE (1-9)` \N
  3 (
    \j 1 + . 32 \C
    3 (
      b@ \j 3 * \i + ? 
      " 1 $ = ( ' 88 \C )
      " 2 $ = ( ' 79 \C )
      0 swap = (
        ' 
        \j 3 * \i + 1 + .
      )
      32 \C 32 \C
    )
    \N
  )
  \N
;

:H;
  /U (
    \N `Your move (1-9): `
    /K c!
    c@ 49 $ <  c@ 57 $ >  |  x!
    x@ ( `Invalid` \N )
    x@ 0 = (
      c@ 48 $ - 1 - t!
      b@ t@ ?
      " 0 swap = (
        '  1 b@ t@ ?!
        m@ 1 + m!
        /T
      )
      /E ( ' \N `Occupied` \N )
    )
  )
;

:C;
  b@ 4 ?
  " 0 swap = 
  ' y!
  y@ ( 2 b@ 4 ?!  m@ 1 + m! )
  y@ 0 = (
    9 (
      b@ \i ?
      " 0 swap = (
        ' 
        2 b@ \i ?!  m@ 1 + m!
        1 \B
      )
      /E ( ' )
    )
  )
;

:T;
  /U (
    9 ( 0 b@ \i ?! ) 0 m!
    /U (
      P;
      H;
      1 W;
      " 1 $ = ( ' \N `YOU WIN` \N /T ) /E ( ' )
      m@ 9 $ = ( \N `DRAW` \N /T )
      C;
      P;
      2 W;
      " 1 $ = ( ' \N `CPU WINS` \N /T ) /E ( ' )
      m@ 9 $ = ( \N `DRAW` \N /T )
    )
    \N `Play again (Y/N)? `
    /K c!
    c@ 89 $ = c@ 121 $ = | 
    0 swap = \B
  )
;
```

```
\ ----- allocate and initialise arrays -----
[0 0 0 0 0 0 0 0 0] $ b!            \ b points to the 9‑cell board (0‑based)
[0 1 2 3 4 5 6 7 8   0 3 6 1 4 7 2 5 8   0 4 8 2 4 6] $ l!   \ l points to win‑lines

\ ----- W: check win for player (p) -----
:W;                                      \ usage: n W; (n=1 or 2), returns 1 if win else 0
  p!                                     \ save player value in variable p
  0 w!                                   \ clear win flag
  8 (                                     \ loop over the 8 win‑lines
    l@ \i 3 * ?      b@ swap ?  p@ swap =    \ test first cell == p
    l@ \i 3 * 1 + ?  b@ swap ?  p@ swap = &  \ test second cell == p and AND with previous
    l@ \i 3 * 2 + ?  b@ swap ?  p@ swap = &  \ test third cell == p and AND again
    ( 1 w! )                              \ if all three equal p, set w = 1
    w@ \B                                 \ break outer loop if w != 0
  )
  w@                                     \ leave win flag on stack
;

\ ----- P: print board -----
:P;
  \N `TIC-TAC-TOE (1-9)` \N
  3 (                                  \ for each row
    \j 1 + . 32 \C                     \ print row number (1..3) and a space
    3 (                                \ for each column
      b@ \j 3 * \i + ?                 \ fetch cell value v
      " 1 $ = ( ' 88 \C )              \ if v==1, drop v and emit 'X' (88)
      " 2 $ = ( ' 79 \C )              \ if v==2, drop v and emit 'O' (79)
      0 swap = (                       \ else if v==0
        '                               \ drop v
        \j 3 * \i + 1 + .               \ print empty cell index (1..9)
      )
      32 \C 32 \C                      \ print two spaces
    )
    \N                                 \ newline after each row
  )
  \N
;

\ ----- H: human move -----
:H;
  /U (                                   \ repeat until a valid move is made
    \N `Your move (1-9): `
    /K c!                                \ read one character into c
    c@ 49 $ <  c@ 57 $ >  |  x!          \ invalid if c<'1' OR c>'9'
    x@ ( `Invalid` \N )                  \ print error if invalid
    x@ 0 = (                             \ only proceed if valid
      c@ 48 $ - 1 - t!                   \ convert ASCII to 0‑based index (0..8)
      b@ t@ ?                            \ fetch current value at that cell
      " 0 swap = (                       \ if cell is empty
        '  1 b@ t@ ?!                    \ drop v; set board[t] = 1 (human)
        m@ 1 + m!                        \ increment moves counter
        /T                               \ break out of /U loop
      )
      /E ( ' \N `Occupied` \N )          \ else drop v and print "Occupied"
    )
  )
;

\ ----- C: CPU move (plays 'O' = 2) -----
:C;
  b@ 4 ?                                 \ check center (index 4)
  " 0 swap =                             \ test if center is empty
  ' y!                                   \ drop v; store result in y (1 if empty)
  y@ ( 2 b@ 4 ?!  m@ 1 + m! )            \ if empty, place 'O' there and inc moves
  y@ 0 = (                               \ else (center not empty)
    9 (                                  \ search first empty cell
      b@ \i ? 
      " 0 swap = (                       \ test if cell is empty
        '                                 \ drop v
        2 b@ \i ?!  m@ 1 + m!             \ place 'O' and inc moves
        1 \B                              \ break loop once move is made
      )
      /E ( ' )                           \ else: drop v
    )
  )
;

\ ----- T: main game loop -----
:T;
  /U (                                   \ outer loop: play multiple games
    9 ( 0 b@ \i ?! )  0 m!               \ clear board (set all cells to 0) and reset moves
    /U (                                 \ inner loop: a single game
      P;                                 \ show board
      H;                                 \ human move
      1 W; 
      " 1 $ = ( ' \N `YOU WIN` \N /T ) /E ( ' )  \ if human wins, announce and break
      m@ 9 $ = ( \N `DRAW` \N /T )       \ if board full, announce draw and break
      C;                                 \ CPU move
      P;                                 \ show board
      2 W; 
      " 1 $ = ( ' \N `CPU WINS` \N /T ) /E ( ' )  \ if CPU wins, announce and break
      m@ 9 $ = ( \N `DRAW` \N /T )       \ draw check again
    )
    \N `Play again (Y/N)? `
    /K c!                                \ read user's choice into c
    c@ 89 $ =    c@ 121 $ =   |          \ r = (c=='Y') OR (c=='y')
    0 swap =  \B                         \ break outer loop if r==0 (not Y/y)
  )
;


```
