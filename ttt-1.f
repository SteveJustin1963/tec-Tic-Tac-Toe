CELL_SIZE 3  ; Define board size (3x3)
EMPTY 0      ; Empty cell representation
PLAYER1 1    ; Player 1 marker
PLAYER2 2    ; Player 2 marker (computer)
CURRENT_PLAYER PLAYER1  ; Start with player 1

; Display functions
: show-cell ( n -- )
    DUP 0 =  ; Check if empty
    IF ( . ) THEN  ; Print "." for empty cell
    ELSE ( . ) THEN  ; Print "X" or "O" based on marker
    ENDIF
;

: show-board ( -- )
    0 DO
        I CELL_SIZE * 2 - 1 > J  ; Loop for each row (2 cells + separator)
        DO
            I MOD 2 = 0  ; Check if separator column
            IF ( . ) THEN ELSE 
                I CELL_SIZE + (I DIV 2) @ show-cell  ; Print cell content
            THEN
            J 1- LEAVE  ; Decrement column counter and potentially exit loop
        LOOP
        CR  ; New line after each row
    LOOP
;

; Get user input for cell selection
: get-user-input ( -- n )
    . ." Enter cell number (1-9): "
    KEY IN  ; Get user input
    SWAP 0 =  ; Check if valid input (1-9)
    WHILE ( . ) ." Invalid input. Try again: " KEY IN SWAP 0 = ENDWHILE
    1-  ; Convert 1-based input to 0-based index
;

: check-win ( player n -- win? )
  0 2 1 + DUP @ =  ; Check first row
  IF ( . ) THEN ELSE 
    0 1 2 + DUP @ = OR  ; Check first row OR diagonal (top-left to bottom-right)
    IF ( . ) THEN ELSE 
      1 2 1 + DUP @ = OR  ; Check second row OR other diagonal (bottom-left to top-right)
      IF ( . ) THEN ELSE
        2 2 1 + DUP @ =  ; Check third row
        IF ( . ) THEN ELSE ( . ) THEN 
          SWAP 0 2 1 + DUP @ = OR  ; Check first column OR diagonal
          IF ( . ) THEN ELSE ( . ) THEN 
            SWAP 1 2 1 + DUP @ = OR  ; Check second column OR other diagonal
            IF ( . ) THEN ELSE ( . ) THEN 
              SWAP 2 2 1 + DUP @ =   ; Check third column
            THEN
          THEN
        THEN
      THEN
    THEN
  THEN
;


; Computer move using minimax algorithm (simplified version)
: computer-move ( board -- n )
    0 CELL_SIZE * CELL_SIZE DO  ; Loop through all cells
        I @ EMPTY =  ; Check if cell is empty
        IF 
            SWAP I !  ; Place computer's marker temporarily
            ( check-win CURRENT_PLAYER I )  ; Check if it leads to a win
            IF 
                LEAVE  ; If win, return this cell
            ELSE 
                SWAP EMPTY !  ; Remove temporary marker
            THEN
        THEN
    LOOP
    ; If no immediate win, prioritize blocking player 1's win
    0 CELL_SIZE * CELL_SIZE DO  ; Loop through all cells again
        I @ EMPTY =  ; Check if cell is empty
        IF 
            SWAP I !  ; Place opponent's marker temporarily (player 1)
            ( check-win PLAYER1 I )  ; Check if it leads to a win for player 1
            IF 
                SWAP PLAYER2 !  ; Place computer's marker here to block
                LEAVE  ; Exit loop
            ELSE 
                SWAP EMPTY !  ; Remove temporary marker
            THEN
        THEN
    LOOP
    ; If no immediate win or block, choose any empty cell
    0 CELL_SIZE * CELL_SIZE DO  ; Loop through all cells again
        I @ EMPTY =  ; Check if cell is empty
        IF 
            SWAP PLAYER2 !  ; Place computer
