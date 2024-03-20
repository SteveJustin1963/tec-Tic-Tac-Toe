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

