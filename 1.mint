\ Tic-Tac-Toe Game in Forth

\ Initialize the board (empty cells represented by 0)
10 CONSTANT SIZE
CREATE BOARD SIZE CELLS ALLOT

: DISPLAY-BOARD
    CR ." Current Board:" CR
    0 SIZE 1 DO
        I 3 MOD 0= IF CR THEN
        I @ . SPACE
    LOOP ;

: CHECK-WINNER ( row1 col1 row2 col2 row3 col3 -- flag )
    3 PICK 3 PICK @ = 3 PICK 3 PICK @ = AND
    3 PICK 3 PICK @ = 3 PICK 3 PICK @ = AND
    OR
    3 PICK 3 PICK @ = 3 PICK 3 PICK @ = AND
    3 PICK 3 PICK @ = 3 PICK 3 PICK @ = AND
    OR
    3 PICK 3 PICK @ = 3 PICK 3 PICK @ = AND
    3 PICK 3 PICK @ = 3 PICK 3 PICK @ = AND
    OR ;

: CHECK-TIE ( -- flag )
    BOARD SIZE 0 DO
        I @ 0= IF DROP FALSE EXIT THEN
    LOOP
    TRUE ;

: MAIN
    BOARD DISPLAY-BOARD
    BEGIN
        ." Enter your move (1-9): " ACCEPT
        DUP 48 - 0< DUP 9 > OR IF
            ." Invalid input. Please enter a number between 1 and 9." CR
            CONTINUE
        THEN
        DUP 1- 3 MOD 3 * SWAP 3 / + DUP @ 0= IF
            ." Cell already taken. Please choose an empty cell." CR
            CONTINUE
        THEN
        1 SWAP !
        BOARD DISPLAY-BOARD
        DUP CHECK-WINNER IF
            ." WE HAVE A WINNER!" CR
            EXIT
        THEN
        CHECK-TIE IF
            ." BOARD IS FULL -- TIE GAME." CR
            EXIT
        THEN
    REPEAT ;

MAIN
