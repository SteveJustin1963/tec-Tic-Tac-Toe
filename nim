### NIM

The game of NIM is played with a number of objects, called pieces. Two players take turns removing objects from the pile. The player who removes the last object loses the game. 

The game can be played with any number of pieces, but the most common number is 21. To play, each player removes 1, 2, or 3 pieces from the pile on their turn. The player who removes the last piece loses the game.

If you are playing with 21 pieces, the game would go as follows:
```
Player 1 removes 3 pieces
Player 2 removes 2 pieces
Player 1 removes 1 piece
Player 2 removes 3 pieces
Player 1 removes 2 pieces
Player 2 removes 1 piece
Player 1 removes 3 pieces
Player 2 removes 2 pieces
Player 1 removes 1 piece
Player 2 removes 3 pieces
Player 1 removes 2 pieces
Player 2 removes 1 piece
Player 1 removes 3 pieces
Player 2 removes 2 pieces
Player 1 removes 1 piece
Player 2 removes 3 pieces
Player 1 removes 2 pieces
Player 2 removes 1 piece
Player 1 removes 3 pieces
```
Player 2 has now won, as they were the last to remove a piece from the pile.

```
#include <stdio.h> 
#include <stdlib.h> 

int main() 
{ 
    int n,m,i,j,k; 
    printf("Enter the value of n and m\n"); 
    scanf("%d %d", &n, &m); 
    if (n%2 == 0) 
    { 
        printf("Player 1 wins\n"); 
        return 0; 
    } 
    else
    { 
        printf("Player 2 wins\n"); 
        return 0; 
    } 
}
```
```

100 REM NIM
110 REM by John Doe
120 REM
130 CLS
140 DIM SHARED a(3)
150 a(1)=4:a(2)=4:a(3)=4
160 PRINT "There are ";a(1)+a(2)+a(3);" sticks."
170 PRINT "Player 1, please select a stick."
180 INPUT b
190 a(b)=a(b)-1
200 IF a(1)+a(2)+a(3)=0 THEN PRINT "Player 1 wins!" : GOTO 990
210 PRINT "Player 2, please select a stick."
220 INPUT b
230 a(b)=a(b)-1
240 IF a(1)+a(2)+a(3)=0 THEN PRINT "Player 2 wins!" : GOTO 990
250 GOTO 170
260 END
270
```
PASCAL code for NIM

```
var
  n,m,i,j,k:integer;
  a:array of integer;
begin
  read(n,m);
  setlength(a,n);
  for i:=0 to n-1 do
    a[i]:=0;
  i:=0;
  while i<m do
    begin
      j:=random(n);
      if a[j]=0 then
        begin
          inc(a[j]);
          inc(i);
        end;
    end;
  k:=0;
  for i:=0 to n-1 do
    if a[i]=1 then
      inc(k);
  writeln(k);
end.
```
