   10   REM start with an empty 3x3 grid
   20   DIM grid(2,2)
   30   FOR i=0 TO 2
   40   FOR j=0 TO 2
   50   grid(i,j)=""
   60   NEXT j
   70   NEXT i
   80   REM player 1 chooses a position on the grid
   90   grid(0,0)="X"
  100   REM player 2 chooses a position on the grid
  110   grid(1,1)="O"
  120   REM if player 1 has three 'X' symbols in a row, player 1 wins
  130   IF grid(0,0)="X" AND grid(0,1)="X" AND grid(0,2)="X" THEN PRINT "Player 1 wins!"
  140   REM if player 2 has three 'O' symbols in a row, player 2 wins
  150   IF grid(1,0)="O" AND grid(1,1)="O" AND grid(1,2)="O" THEN PRINT "Player 2 wins!"
  160   REM if all the cells on the grid are filled and neither player has won, the game ends in a draw
  170   IF grid(0,0)<>"" AND grid(0,1)<>"" AND grid(0,2)<>"" AND grid(1,0)<>"" AND grid(1,1)<>"" AND grid(1,2)<>"" AND grid(2,0)<>"" AND grid(2,1)<>"" AND grid(2,2)<>"" THEN PRINT "The game ends in a draw."
