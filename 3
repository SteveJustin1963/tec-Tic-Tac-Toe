variable b
variable r

: A ( Initialize board )
    1 10 1 do
        i 2 * b +! 
    loop ;

: B ( Update board: r N -- )
    r @ 3 * b +! ;

: C ( Print board )
    0 3 0 do
        i 3 * 0 do
            i j + 3 * b + @ . space
        loop
        cr
    loop ;

: D ( Check winner: r -- F )
    r ! 0
    0 3 0 do
        i 3 * 0 do
            i j + 3 * b + @ r @ = if 1+ else 0 then r +!
        loop
    loop
    r @ 3 = ;

: E ( Play round: N -- )
    B C
    D if
        cr ." WE HAVE A WINNER!" cr exit
    then ;

: F ( Random move )
    begin
        9 random 1+ dup D 0= and
    until
    E ;

: G ( User move )
    begin
        cr ." ENTER YOUR MOVE (1-9): " decimal accept 48 - dup D 0=
    until
    E ;

: Z ( Main )
    A C
    begin
        G 120
        F 111
        D 0=
    until ;
