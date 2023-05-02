# Tic-Tac-Toe / Naughts and Crosses  


```
CREATE WINNING-CONFIGURATIONS
    7 56 224   ( 0b111 0b111000 0b111000000 )
    73 146 36   ( 0b1001001 0b10010010 0b100100100 )
    33 132 168  ( 0b100001 0b1000010100 0b10101000 )

: BIT-AT-INDEX ( value index -- bit )
    1 SWAP LSHIFT AND
;

: CHECK-WIN ( boardState index -- flag )
    WINNING-CONFIGURATIONS
    DUP 0 +   ( address of first configuration )
    3 DO      ( loop through configurations )
        OVER @ SWAP    ( boardState index config )
        3 DO    ( loop through bits in config )
            OVER SWAP I + @  ( boardState index config bit )
            BIT-AT-INDEX AND ( boardState index (config & bit) )
            ROT           ( (config & bit) boardState index )
            ROT XOR       ( (config ^ bit) boardState index )
        LOOP
        IF             ( if config matches boardState )
            DROP 1      ( set flag=1 (true) )
            LEAVE       ( exit inner loop )
        THEN
        3 +             ( next configuration )
    LOOP
    DROP              ( remove index )
;

: CHECK-FOR-WIN ( boardState -- flag )
    0 ( init flag )
    0 ( init index )

    BEGIN
        8 OVER >= ( check if index >= 8 )
    WHILE
        ( boardState index )
        CHECK-WIN
        IF
            DROP 1 ( flag=1 (true) )
            9 ( break index )
        ELSE
            1 + ( increment index )
        THEN
    REPEAT

    DROP ( remove index )
;
```


## another check for win
```
: checkForWin ( player -- flag )
  3 0 DO
    I 3 * DUP 3 + DUP 6 + SWAP
    OVER 1+ SWAP OVER 2+ SWAP
    DUP @ ROT @ ROT @ = AND AND
    IF DROP 1 EXIT THEN
  LOOP
  0 ;
  ```
  
  ## another
  ```
  : RESET-BOARD  ( -- )
  3 3 DO  3 0 DO  I J 2DUP  B!  LOOP  LOOP  ;

: PRINT-BOARD  ( -- )
  ." TIC-TAC-TOE" CR ." ------------" CR
  CR ." 1 | 2 | 3" CR ." ---------" CR
  ." 4 | 5 | 6" CR ." ---------" CR
  ." 7 | 8 | 9" CR CR ;

: PROMPT-MOVE  ( -- n )
  CR ." ENTER YOUR MOVE (1-9)." CR
  KEY DUP 48 - DUP 9 > SWAP 0 < OR IF
    ." ILLEGAL MOVE." CR DROP  PROMPT-MOVE
  THEN  DROP  1-  ;

: PLAY-AGAIN?  ( -- flag )
  CR ." PRESS ANY KEY TO PLAY AGAIN." CR
  KEY DROP  1 =  ;

: GAME-LOOP  ( -- )
  0 0 0 0 0 0 0 0 0  ( initialize board to all zeros )
  0 0 ( player goes first )
  9 0 DO
    DUP 1+ 2 MOD 0= IF
      ." COMPUTER'S TURN." CR
      RANDOM 3 MOD 1+   ( generate random move )
      RANDOM 3 MOD 1+   ( generate random move )
    ELSE
      ." YOUR TURN." CR  PROMPT-MOVE
    THEN
    DUP 1+ 2 MOD 1=  ( alternate turns )
    DUP 1- 3 / 1+  DUP 3 MOD 1+  ( convert move to row/col indices )
    DUP B@ 0= IF  SWAP B!  THEN  ( update board if move is legal )
    PRINT-BOARD
    DUP 1 1 B@ 1 2 B@ 1 3 B@ * IF  EXIT  THEN  \ check rows
    DUP 2 1 B@ 2 2 B@ 2 3 B@ * IF  EXIT  THEN
    DUP 3 1 B@ 3 2 B@ 3 3 B@ * IF  EXIT  THEN
    DUP 1 1 B@ 2 1 B@ 3 1 B@ * IF  EXIT  THEN  \ check columns
    DUP 1 2 B@ 2 2 B@ 3 2 B@ * IF  EXIT  THEN
    DUP 1 3 B@ 2 2 B@ 3 1 B@ * IF  EXIT  THEN  \ check diagonals
  LOOP ;

: TIC-TAC-TOE  ( -- )
  PRINT-BOARD
  CR ." PRESS ANY KEY TO BEGIN." CR
  KEY DROP
  BEGIN
    GAME-LOOP
    CR DUP 1+ 2 MOD 0= IF
      ." COMPUTER WINS." CR
    ELSE
      ." YOU WIN." CR
    THEN
    PLAY-AGAIN? UNTIL
  DROP ;
```

