[1 2 3 4 5 6 7 8 9] $' b!

 
: C 1 10 1 do
      i 2 * b @ + i ! 
   loop ;
: D r ! r @ r @ $ 3 * + b @ + ! ; 
: E 0 3 0 do
      i 3 * 0 do
            i j + $ 3 * + b @ . space
      loop 
      cr 
   loop ;
: F 3 / ; 
: G $ 3 * + b @ + ; 

: H r ! 0
  0 3 0 do
    i 3 * 0 do
      i j + G @ r @ = if 1+ else 0 then r +!
    loop
  loop
  r @ 3 = if 1 else 0 then ;

: J 0 9 0 do
      i H if
         cr ." WE HAVE A WINNER!" cr 1+ 
      then 
   loop 
   0= if cr ." BOARD IS FULL -- TIE GAME." cr then ;
: K D E J ;
: r begin 9 random 9 / dup H 0= until ;
: u begin 
      cr ." ENTER YOUR MOVE (1-9): " decimal accept 48 - dup H 0= 
   until ;
: X C E begin 
      u 120 K r ! 111 K J 0= 
   until ;
 
