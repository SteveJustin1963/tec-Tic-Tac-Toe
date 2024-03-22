CELL_SIZE 3
EMPTY 0
PLAYER1 1
PLAYER2 2
CURRENT_PLAYER PLAYER1

: show-cell ( n -- ) DUP 0 = IF ." . " ELSE DUP 1 = IF ." X " ELSE ." O " THEN THEN ;

: show-board ( -- ) 0 CELL_SIZE * DO I CELL_SIZE MOD 0= IF CR THEN I show-cell LOOP CR ;

: get-user-input ( -- n ) BEGIN ." Enter cell number (1-9): " KEY 1- DUP 0 < OVER 8 > OR WHILE DROP REPEAT ;

: check-win ( player -- win? )
  0 CELL_SIZE 1 - DO
    I CELL_SIZE * CELL_SIZE + DO
      J CELL_SIZE / I * CELL_SIZE + @ = NOT IF LEAVE THEN
    LOOP I CELL_SIZE = UNTIL
  LOOP ;

: computer-move ( -- n )
  0 CELL_SIZE * CELL_SIZE DO
    I @ EMPTY = IF I EXIT THEN
  LOOP ;

: init-board ( -- ) 0 CELL_SIZE * CELL_SIZE DO I EMPTY ! LOOP ;

: play-game ( -- )
  init-board
  BEGIN
    show-board
    CURRENT_PLAYER PLAYER1 = IF get-user-input ELSE 0 computer-move THEN DUP @ CURRENT_PLAYER !
    DUP check-win IF ." Win!" CR EXIT THEN
    CURRENT_PLAYER PLAYER1 = IF PLAYER2 ELSE PLAYER1 THEN TO CURRENT_PLAYER
  AGAIN ;
