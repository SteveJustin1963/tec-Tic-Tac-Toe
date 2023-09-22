//rem start with an empty 3x3 grid
20 Dim grid(2, 2)
30 For i = 0 To 2
40 For j = 0 To 2
50 grid(i, j) = ""
60 Next j
70 Next i
80  //player 1 chooses a position on the grid
90 grid(0, 0) = "X"
100  //player 2 chooses a position on the grid
110 grid(1, 1) = "O"
120  //If player 1 has three  'X' symbols in a row, player 1 wins
130 If grid(0, 0) = "X" And grid(0, 1) = "X" And grid(0, 2) = "X" Then Print "Player 1 wins!"
140  //If player 2 has three  'O' symbols in a row, player 2 wins
150 If grid(1, 0) = "O" And grid(1, 1) = "O" And grid(1, 2) = "O" Then Print "Player 2 wins!"
160  //If all the cells on the grid are filled And neither player has won, the game ends in a draw
170 If grid(0, 0) <> "" And grid(0, 1) <> "" And grid(0, 2) <> "" And grid(1, 0) <> "" And grid(1, 1) <> "" And grid(1, 2) <> "" And grid(2, 0) <> "" And grid(2, 1) <> "" And grid(2, 2) <> "" Then Print "The game ends in a draw."


\\\\\\\\\\\\\\\\\\\\\\\\


Dim grid(3)

For i = 0 To 2

For j = 0 To 2

grid(i, j) = i + j

Next

Next

sub print_grid()
Dim i, j
For i = 0 To 2
For j = 0 To 2
Print grid(i, j) ; " ";
Next j
Print
Next i
End sub                                           

sub clear_grid()
Dim i, j
For i = 0 To 2
For j = 0 To 2
grid(i, j) = " ";
Next j
Next i
End sub                                           

sub check_win()
Dim i, j
Dim win
win = 0
For i = 0 To 2
If grid(i, 0) <> " " And grid(i, 0) = grid(i, 1) And grid(i, 1) = grid(i, 2) Then
win = 1
End If                                            
If grid(0, i) <> " " And grid(0, i) = grid(1, i) And grid(1, i) = grid(2, i) Then
win = 1
End If                                            
Next i
If grid(0, 0) <> " " And grid(0, 0) = grid(1, 1) And grid(1, 1) = grid(2, 2) Then
win = 1
End If                                            
If grid(0, 2) <> " " And grid(0, 2) = grid(1, 1) And grid(1, 1) = grid(2, 0) Then
win = 1
End If                                            
check_win = win
End Function                                      

sub check_draw()
Dim i, j
Dim draw
draw = 1
For i = 0 To 2
For j = 0 To 2
If grid(i, j) = " " Then
draw = 0
End If                                            
Next j
Next i
check_draw = draw
End Function                                      

Dim player
Dim row, col
Dim win
Dim draw

Call clear_grid
player = 1
win = 0
draw = 0
While win = 0 And draw = 0
Call print_grid
Print "Player "; player; ", enter row and column: ";
input row, col
If grid(row, col) = " " Then
If player = 1 Then
grid(row, col) = "X"
Else
grid(row, col) = "O"
End If                                            
win = check_win()
draw = check_draw()
If player = 1 Then
player = 2
Else
player = 1
End If                                            
Else
Print "That space is already taken."
End If                                            
Wend
Call print_grid
If win = 1 Then
Print "Player "; player; " wins!"
Else
Print "Draw!"
End If                                            

\\\\\\\\\\\\\\\\\\\\\\\\\

10 REM TIC-TAC-TOE
20 REM  
30 DIM B(3,3)
40 FOR I=1 TO 3
50 FOR J=1 TO 3
60 B(I,J)=0
70 NEXT J
80 NEXT I
90 PRINT " TIC-TAC-TOE "
100 PRINT " ------------ "
110 PRINT
120 PRINT " 1 | 2 | 3 "
130 PRINT " --------- "
140 PRINT " 4 | 5 | 6 "
150 PRINT " --------- "
160 PRINT " 7 | 8 | 9 "
170 PRINT
180 PRINT "PRESS ANY KEY TO BEGIN."
190 GET A$
200 FOR T=1 TO 9
210 IF T MOD 2 = 1 THEN GOTO 240
220 PRINT "COMPUTER'S TURN."
230 GOTO 270
240 PRINT "YOUR TURN."
250 GOTO 290
260 REM COMPUTER'S TURN
270 I=INT(RND(1)*3)+1
280 J=INT(RND(1)*3)+1
290 REM YOUR TURN
300 PRINT "ENTER YOUR MOVE (1-9)."
310 INPUT N
320 IF B((N-1)/3+1,(N-1) MOD 3+1)<>0 THEN PRINT "ILLEGAL MOVE.": GOTO 300
330 B((N-1)/3+1,(N-1) MOD 3+1)=1
340 PRINT "  ",B(1,1)," | ",B(1,2)," | ",B(1,3)," "
350 PRINT " ------------ "
360 PRINT "  ",B(2,1)," | ",B(2,2)," | ",B(2,3)," "
370 PRINT " ------------ "
380 PRINT "  ",B(3,1)," | ",B(3,2)," | ",B(3,3)," "
390 IF B(1,1)*B(1,2)*B(1,3)<>0 THEN GOTO 430
400 IF B(2,1)*B(2,2)*B(2,3)<>0 THEN GOTO 430
410 IF B(3,1)*B(3,2)*B(3,3)<>0 THEN GOTO 430
420 IF B(1,1)*B(2,1)*B(3,1)<>0 THEN GOTO 430
430 REM GAME OVER
440 IF T MOD 2 = 1 THEN PRINT "COMPUTER WINS."
450 IF T MOD 2 = 0 THEN PRINT "YOU WIN."
460 PRINT "PRESS ANY KEY TO PLAY AGAIN."
470 GET A$
480 GOTO 30

\\\\\\\\\\\\
