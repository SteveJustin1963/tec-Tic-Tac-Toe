# Tic-Tac-Toe / Naughts and Crosses  



```
VARIABLE board
[1 2 3 4 5 6 7 8 9] 2DROP board !

: A ( index -- offset )
  2 * ;

: B ( row col -- addr )
  SWAP 3 * + board @ + ;

: C \ Initialize the board
  1 10 1 DO
    I A board @ + I !
  LOOP ;

: D ( n row col -- ) \ Set the position
  >R >R
  R> R> B ! ;

: E \ Print the board
  CR
  0 3 0 DO
    I 3 * 0 DO
      I J + B @ . SPACE
    LOOP CR
  LOOP CR ;

: F ( n -- row col )
  3 /MOD ;

: G ( row col -- addr ) \ Calculate the cell address in the array
  3 * + board @ + ;

: H ( n -- winner? )
  >R
  0
  { {0 1 2} {3 4 5} {6 7 8} {0 3 6} {1 4 7} {2 5 8} {0 4 8} {2 4 6} }
  FOR I
    0
    I BEGIN
      I @ F G @ R@ =
      IF
        1+
      ELSE
        DROP 0
      THEN
      I 2 + >R SWAP R> 1+ SWAP
    UNTIL
    3 =
  THEN
  IF
    DROP R> DROP 1
  ELSE
    DROP R> 0
  THEN ;

: J \ Check for a win
  0
  9 0 DO
    I H
    IF
      CR ." We have a winner!" CR
      1+
    THEN
  LOOP
  0= IF
    CR ." Board is Full -- Tie Game." CR
  THEN ;

: K ( n -- ) \ Main game loop
  D E J ;

: random-move ( -- n )
  BEGIN
    9 RANDOM 9 MOD
  DUP H 0= UNTIL ;

: user-move ( -- n )
  BEGIN
    CR ." Enter your move (1-9): " DECIMAL
    ACCEPT 48 - ( Convert ASCII to number )
  DUP H 0= UNTIL ;

: game-loop
  BEGIN
    user-move 120 D E J
    random-move 111 D E J
    J 0= NOT
  UNTIL ;

: play-game
  C
  E
  game-loop ;

```
## more compact

~~~
 

[1 2 3 4 5 6 7 8 9] 2drop b!

: A  2 * ; //( i -- o )
: C 1 10 1 do i A b @ + i ! loop ;
: D  r ! r @ r @ swap 3 * + b @ + ! ; //( n r c -- )
: E 0 3 0 do i 3 * 0 do i j + swap 3 * + b @ . space loop cr loop ;
: F  3 /mod ; //( n -- r c )
: G swap 3 * + b @ + ; ( r c -- a )
: H ( n -- w ) r ! 0 {{0 1 2} {3 4 5} {6 7 8} {0 3 6} {1 4 7} {2 5 8} {0 4 8} {2 4 6}} for i 0 i begin i @ F G @ r @ = if 1+ else drop 0 then i 2 + r ! swap r @ 1+ swap until 3 = then if drop r @ drop 1 else drop r @ 0 then ;
: J 0 9 0 do i H if cr ." WE HAVE A WINNER!" cr 1+ then loop 0= if cr ." BOARD IS FULL -- TIE GAME." cr then ;
: K ( n -- ) D E J ;
: r ( -- n ) begin 9 random 9 mod dup H 0= until ;
: u ( -- n ) begin cr ." ENTER YOUR MOVE (1-9): " decimal accept 48 - dup H 0= until ;
: X ( -- ) C E begin u 120 K r ! 111 K J 0= until ;

 

```
