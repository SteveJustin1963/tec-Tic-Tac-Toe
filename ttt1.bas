REM Tic-Tac-Toe Game: Player vs Computer

DIM grid(2, 2)

REM Initialize an empty 3x3 grid
FOR i = 0 TO 2
    FOR j = 0 TO 2
        grid(i, j) = " "
    NEXT j
NEXT i

REM Display the empty grid
PRINT "Tic-Tac-Toe Game"
PRINT " 0 | 1 | 2"
PRINT "-----------"
PRINT " 3 | 4 | 5"
PRINT "-----------"
PRINT " 6 | 7 | 8"

REM Player chooses 'X' or 'O'
INPUT "Choose 'X' or 'O': ", playerMarker
computerMarker = "O"
IF playerMarker = "O" THEN computerMarker = "X"

REM Main game loop
DO
    REM Player's turn
    INPUT "Enter your move (0-8): ", playerMove
    grid(playerMove \ 3, playerMove MOD 3) = playerMarker
    PRINT "Your move:"
    GOSUB PrintGrid

    REM Check for player win
    IF CheckWin(playerMarker) THEN
        PRINT "Congratulations! You win!"
        END
    END IF

    REM Computer's turn (random move)
    DO
        computerMove = INT(RND * 9)
    LOOP UNTIL grid(computerMove \ 3, computerMove MOD 3) = " "
    grid(computerMove \ 3, computerMove MOD 3) = computerMarker
    PRINT "Computer's move:"
    GOSUB PrintGrid

    REM Check for computer win
    IF CheckWin(computerMarker) THEN
        PRINT "Computer wins! Better luck next time."
        END
    END IF

    REM Check for a draw
    IF IsGridFull() THEN
        PRINT "The game ends in a draw."
        END
    END IF
LOOP

REM Subroutine to print the grid
PrintGrid:
    FOR i = 0 TO 2
        PRINT grid(i, 0) + " | " + grid(i, 1) + " | " + grid(i, 2)
        IF i < 2 THEN PRINT "---------"
    NEXT i
RETURN

REM Function to check for a win
FUNCTION CheckWin(marker)
    REM Check rows, columns, and diagonals
    FOR i = 0 TO 2
        IF grid(i, 0) = marker AND grid(i, 1) = marker AND grid(i, 2) = marker THEN RETURN TRUE
        IF grid(0, i) = marker AND grid(1, i) = marker AND grid(2, i) = marker THEN RETURN TRUE
    NEXT i
    IF grid(0, 0) = marker AND grid(1, 1) = marker AND grid(2, 2) = marker THEN RETURN TRUE
    IF grid(0, 2) = marker AND grid(1, 1) = marker AND grid(2, 0) = marker THEN RETURN TRUE
    RETURN FALSE
END FUNCTION

REM Function to check if the grid is full
FUNCTION IsGridFull()
    FOR i = 0 TO 2
        FOR j = 0 TO 2
            IF grid(i, j) = " " THEN RETURN FALSE
        NEXT j
    NEXT i
    RETURN TRUE
END FUNCTION


