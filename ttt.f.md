
```
\ Constants and Board Initialization
9 CONSTANT BOARD-SIZE
CREATE BOARD BOARD-SIZE ALLOT
0 BOARD BOARD-SIZE ERASE

: DISPLAY-BOARD ( -- )
    CR ." Current Board:" CR
    0 DO
        I 3 MOD 0= IF CR THEN
        BOARD I + C@ DUP 0= IF DROP ." ." ELSE EMIT THEN SPACE
    LOOP CR ;

: INIT-BOARD ( -- )
    BOARD BOARD-SIZE ERASE ;

: INDEX ( ROW COL -- INDEX )
    3 * + ;

: VALID-MOVE? ( ROW COL -- FLAG )
    INDEX BOARD + C@ 0= ;

: PLACE-MOVE ( ROW COL PLAYER -- )
    INDEX BOARD + C! ;

\ Check for a Winner
: ROW-WIN? ( PLAYER -- FLAG )
    \ Check rows for a win
    0
    0 DO
        3 I * BOARD + 3 0 DO
            I J + C@ OVER = IF 1 ELSE 0 THEN
        LOOP + + 3 = IF DROP TRUE EXIT THEN
    LOOP DROP FALSE ;

: COL-WIN? ( PLAYER -- FLAG )
    \ Check columns for a win
    0
    0 DO
        I BOARD + 0 3 DO
            J 3 * + C@ OVER = IF 1 ELSE 0 THEN
        LOOP + + 3 = IF DROP TRUE EXIT THEN
    LOOP DROP FALSE ;

: DIAG-WIN? ( PLAYER -- FLAG )
    \ Check diagonals for a win
    BOARD C@ OVER = 3 BOARD 4 + C@ OVER = AND
    6 BOARD + C@ OVER = AND IF TRUE EXIT THEN
    2 BOARD + C@ OVER = 4 BOARD + C@ OVER = AND
    6 BOARD C@ OVER = AND IF TRUE ELSE FALSE THEN ;

: CHECK-WINNER ( -- WINNER )
    \ Check all win conditions
    'X' ROW-WIN? IF DROP 'X' EXIT THEN
    'O' ROW-WIN? IF DROP 'O' EXIT THEN
    'X' COL-WIN? IF DROP 'X' EXIT THEN
    'O' COL-WIN? IF DROP 'O' EXIT THEN
    'X' DIAG-WIN? IF DROP 'X' EXIT THEN
    'O' DIAG-WIN? IF DROP 'O' EXIT THEN
    0 ;

\ Check if Board is Full
: BOARD-FULL? ( -- FLAG )
    BOARD BOARD-SIZE 0 DO
        I + C@ 0= IF DROP FALSE EXIT THEN
    LOOP TRUE ;

\ Human Player's Turn
: MAN-TURN ( -- )
    BEGIN
        CR ." Enter Row (0-2): " QUERY NUMBER? DROP
        3 MOD SWAP
        ." Enter Column (0-2): " QUERY NUMBER? DROP
        3 MOD
        2DUP VALID-MOVE? IF
            DROP PLACE-MOVE 'X'
            EXIT
        ELSE
            ." Invalid Move. Try Again." CR
        THEN
    AGAIN ;

\ Simple PC AI for Opponent
: FIND-BEST-MOVE ( -- ROW COL )
    \ First empty cell
    BOARD BOARD-SIZE 0 DO
        I + C@ 0= IF
            I 3 /MOD
            EXIT
        THEN
    LOOP ;

: PC-TURN ( -- )
    FIND-BEST-MOVE 2DUP PLACE-MOVE 'O' ;

\ Main Game Loop
: GAME-LOOP ( -- )
    INIT-BOARD
    0 \ Start with Man
    BEGIN
        DISPLAY-BOARD
        DUP 0= IF MAN-TURN ELSE PC-TURN THEN
        DISPLAY-BOARD
        CHECK-WINNER DUP 0<> IF
            CR ." Winner: " EMIT CR
            DROP EXIT
        THEN
        BOARD-FULL? IF
            ." It's a draw!" CR
            DROP EXIT
        THEN
        1 SWAP 1 XOR \ Switch players
    AGAIN ;

\ Main Entry Point
: MAIN ( -- )
    GAME-LOOP ;

\ Run the game
MAIN
```
