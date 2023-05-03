# Tic-Tac-Toe / Naughts and Crosses  

Here's a more tidy version:

Arrays in this language are defined using an array of 16-bit numbers enclosed in square brackets: `[n,n,...]`. When an array is created, its address and length are obtained. The stack displays the address and length as `<address 2*> <length 2*>` format. For example, entering `[1 2 3 4]` and pressing `ctrl-p` will display `> 3368 00004` on the stack, where `>` is the terminal prompt.

To create an array of 16-bit numbers, enter the values enclosed in square brackets. For example, `[100 200 400 800]` will return a pointer to the array and its length in words (in this case, 4). Store the pointer in a variable, say `c`, and discard the length value with `'[100 200 400 800] c!`.

To access an element in the array, calculate the offset address and deal with 16-bit quantities. For example, to get the third element in the array, push the address of the array stored in `c` onto the stack, then push the index `3` onto the stack. Multiply the index by 2 to get the offset in bytes. Add the offset to the address of the array, and fetch the 16-bit value stored there using `c@ 3 2* + @.` To divide a value by 2 or shift it one bit to the right, use `{ + @.` instead.

For another example, to store the array `[1 2 3 4 5 6 7 8 9 0]` in a variable `a`, swap the starting address onto the stack and store it in `a` using `$ a!`. To fetch the `N`th member of the array, create a colon definition `N` with `:N @ $ {+ @. ;`. To access the second element in the array stored in `a`, enter `a 1 2* + @.` or `a 1 {+ @.` to print `2`. To store `100` in the last location of the array, enter `100 a 2 2* + !.` or `100 a 2{+ !.` The resulting array will be `[1 2 100]`.


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

C

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
