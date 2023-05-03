: C 1 10 1 do
       i A b@ + i! 
   loop ;

: E 0 3 0 do
       i 3 * 0 do
           i j + $ 3 * + b@ . space 
       loop 
       \$ 
   loop ;

: H r! 0 {{0 1 2} {3 4 5} {6 7 8} {0 3 6} {1 4 7} {2 5 8} {0 4 8} {2 4 6}} 
    for i 0 i begin
        i@ F G @r @ = if 1+ else ' 0 then 
        i 2 + r! 
        $ r@ 1+ $ until 
    3 = then if ' r@ ' 1 else ' r@ 0 then ;

: J 0 9 0 do
        i H if 
            \$ ." WE HAVE A WINNER!" \$ 
            1+ 
        then 
   loop 
   0= if \$ ." BOARD IS FULL -- TIE GAME." \$ then ;

: r H0= (9 random 9 / dup);

: u H 0=(\$ ." ENTER YOUR MOVE (1-9): " decimal accept 48 - dup);

: X C E J0=(u 120 K r! 111);
