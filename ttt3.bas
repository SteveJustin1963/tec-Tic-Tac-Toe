REM TIC-TAC-TOE Game: Player vs Computer

DIM B(3, 3)

REM Initialize an empty 3x3 grid
FOR I = 1 TO 3
    FOR J = 1 TO 3
        B(I, J) = " "
    NEXT J
NEXT I

REM Display the grid
PRINT " TIC-TAC-TOE "
PRINT " ------------ "
PRINT
PRINT " 1 | 2 | 3 "
PRINT " --------- "
PRINT " 4 | 5 | 6 "
PRINT " --------- "
PRINT " 7 | 8 | 9 "
PRINT

REM Player chooses 'X' or 'O'
INPUT "Choose 'X' or 'O': ", playerMarker
computerMarker = "O"
IF playerMarker = "O" THEN computerMarker = "X"

REM Main game loop
FOR T = 1 TO 9
    IF T MOD 2 = 1 THEN PRINT "YOUR TURN."
    IF T MOD 2 = 0 THEN PRINT "COMPUTER'S TURN."

    REM Player's turn
    IF T MOD 2 = 1 THEN
        INPUT "Enter your move (1-9): ", N
        IF B((N - 1) / 3 + 1, (N - 1) MOD 3 + 1) <> " " THEN PRINT "ILLEGAL MOVE.": GOTO 300
        B((N - 1) / 3 + 1, (N - 1) MOD 3 + 1) = playerMarker
    END IF

    REM Computer's turn (random move)
    IF T MOD 2 = 0 THEN
        DO
            I = INT(RND * 3) + 1
            J = INT(RND * 3) + 1
        LOOP UNTIL B(I, J) = " "
        B(I, J) = computerMarker
    END IF

    REM Display the updated grid
    PRINT "  ", B(1, 1), " | ", B(1, 2), " | ", B(1, 3), " "
    PRINT " ------------ "
    PRINT "  ", B(2, 1), " | ", B(2, 2), " | ", B(2, 3), " "
    PRINT " ------------ "
    PRINT "  ", B(3, 1), " | ", B(3, 2), " | ", B(3, 3), " "

    REM Check for a win
    IF B(1, 1) * B(1, 2) * B(1, 3) <> 0 OR
       B(2, 1) * B(2, 2) * B(2, 3) <> 0 OR
       B(3, 1) * B(3, 2) * B(3, 3) <> 0 OR
       B(1, 1) * B(2, 1) * B(3, 1) <> 0 THEN
        IF T MOD 2 = 1 THEN PRINT "YOU WIN."
        IF T MOD 2 = 0 THEN PRINT "COMPUTER WINS."
        END
    END IF
NEXT T

REM Game ends in a draw
PRINT "The game ends in a draw."
END

REM Function to check if the grid is full
FUNCTION IsGridFull()
    FOR I = 1 TO 3
        FOR J = 1 TO 3
            IF B(I, J) = " " THEN RETURN FALSE
        NEXT J
    NEXT I
    RETURN TRUE
END FUNCTION
