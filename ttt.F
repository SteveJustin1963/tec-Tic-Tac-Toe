: grid ( -- )
  3 3 array
  0 0 do
    i j do
      i j ""
    loop
  loop
;

: player1 ( -- )
  0 0 "X"
;

: player2 ( -- )
  1 1 "O"
;

: player1-wins? ( -- )
  0 0 @ "X" =
  0 1 @ "X" =
  0 2 @ "X" =
  and and
;

: player2-wins? ( -- )
  1 0 @ "O" =
  1 1 @ "O" =
  1 2 @ "O" =
  and and
;

: draw? ( -- )
  0 0 @ "" =
  0 1 @ "" =
  0 2 @ "" =
  and and
  1 0 @ "" =
  1 1 @ "" =
  1 2 @ "" =
  and and
  2 0 @ "" =
  2 1 @ "" =
  2 2 @ "" =
  and and
;

: play ( -- )
  grid
  player1
  player2
  player1-wins? if
    ." Player 1 wins!" cr
  else
    player2-wins? if
      ." Player 2 wins!" cr
    else
      draw? if
        ." The game ends in a draw." cr
      else
        ." The game is still in progress." cr
      then
    then
  then
;

play
