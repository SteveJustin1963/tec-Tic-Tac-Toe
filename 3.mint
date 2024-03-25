\\ variable b
\\ variable r

\\ ( Initialize board )
:A 
    1 10 1 do
        i 2 * b +! 
    loop ;

\\ Update board: r N -- )
:B (
    r @ 3 * b +! ;

\\ ( Print board )
:C 
    0 3 0 do
        i 3 * 0 do
            i j + 3 * b + @ . space
        loop
        cr
    loop ;

\\ ( Check winner: r -- F )
:D 
    r ! 0
    0 3 0 do
        i 3 * 0 do
            i j + 3 * b + @ r @ = if 1+ else 0 then r +!
        loop
    loop
    r @ 3 = ;

\\ ( Play round: N -- )
:E     B C
    D if
        cr ." WE HAVE A WINNER!" cr exit
    then ;

\\ ( Random move )
:F 
    begin
        9 random 1+ dup D 0= and
    until
    E ;

\\ ( User move )
:G 
    begin
        cr ." ENTER YOUR MOVE (1-9): " decimal accept 48 - dup D 0=
    until
    E ;

\\ ( Main )
:Z 
    A C
    begin
        G 120
        F 111
        D 0=
    until ;
