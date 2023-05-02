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
